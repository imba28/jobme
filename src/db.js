const mongoClient = require('mongodb').MongoClient;
const mongoConf = require('./config').mongodb;

const url = `mongodb://${mongoConf.host}:${mongoConf.port}/${mongoConf.path}`;
function open(){
    return new Promise((resolve, reject) => {
        mongoClient.connect(url, (err, db) => {
            if (err) {
                reject(err);
            } else {
                resolve(db);
            }
        });
    });
}

function close(db){
    if(db){
        db.close();
    }
}

const db = {
    open,
    close
}

module.exports = db;