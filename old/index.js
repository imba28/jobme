const express = require('express');
const path = require('path');
const bodyparser = require('body-parser');

const config = require('./src/config');
const Notification = require('./src/notification');
const database = require('./src/db');

const Model = require('./src/model');

async function main() {
    /*let u = await Model.getAll('Users');
    console.log(u);*/

    database.open().then(db => {
        function exitHandler(options, err) {
            if (options.cleanup) console.log('clean');
            if (err) console.log(err.stack);
            if (options.exit){
                database.close(db);
                process.exit();
            }
        }
        process.on('exit', exitHandler.bind(null,{cleanup:true}));
        process.on('SIGINT', exitHandler.bind(null, {exit:true}));
        process.on('SIGUSR1', exitHandler.bind(null, {exit:true}));
        process.on('SIGUSR2', exitHandler.bind(null, {exit:true}));
        process.on('uncaughtException', exitHandler.bind(null, {exit:true}));

        /*const processPost = (request, response, callback) => { // https://stackoverflow.com/questions/4295782/how-do-you-extract-post-data-in-node-js/12022746#12022746
            let queryData = "";
            if(typeof callback !== 'function') return;

            if(request.method == 'POST') {
                request.on('data', function(data) {
                    queryData += data;
                    if(queryData.length > 1e6) {
                        queryData = "";
                        response.writeHead(413, {'Content-Type': 'text/plain'}).end();
                        request.connection.destroy();
                    }
                });

                request.on('end', function() {
                    request.post = querystring.parse(queryData);
                    callback();
                });

            } else {
                response.writeHead(405, {'Content-Type': 'text/plain'});
                response.end();
            }
        }*/

        const app = express();
        app.use(bodyparser.urlencoded({
            extended: true
        }));

        app.get('/', (req, res) => {
            console.log(u);
            res.sendFile(path.join(process.cwd(), 'public', 'index.html'));
        });
        app.post('/', (req, res) => {
            Notification.update(req.body.message);

            res.redirect('/');
        });
        app.post('/add-channel', (req, res) => {
            const channel_name = req.body.message;
            console.log('NEW CHANNEL', channel_name);
            res.redirect('/');
        });

        app.listen(config.server.port, () => {
            console.log(`${(new Date())}: Web server is listening on port ${config.server.port}, http://localhost:${config.server.port}`);
        });
        /*const uri = url.parse(req.url);
        let filename = path.join(process.cwd(), 'public', uri.pathname);
        if(fs.statSync(filename).isDirectory()) filename = path.join(filename, 'index.html');

        console.log(`${req.socket.localAddress} requests file ${filename}`);

        fs.exists(filename, exists => {
            if(!exists) {
                res.writeHead(404, { 'Content-Type': 'text/plain' });
                res.write('404 Not Found');
                res.end();
                return;
            }

            fs.readFile(filename, 'binary', (err, file) => {
                if(err) {
                    throw err;
                }

                res.writeHead(200, { 'Content-Type': mime.getType(filename) });
                res.write(file, 'binary');
                res.end();
            });
        });*/
    }).catch(err => {
        console.log(err);
    });
};

main();