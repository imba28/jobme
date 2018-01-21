const database = require('./db');

class Model {
    constructor(options, collection) {
        this.data = options;
        this.collection = collection;
    }

    set(key, value) {
        this.data[key] = value;
    }

    get(key) {
        return this.data[key] ? this.data[key] : null;
    }

    static async get(id, collection) {
        const db = await database.open();
        const item = db.collection(collection).find({id: id}).next();

        await db.close();

        return item.then(m => {
            console.log(m);
            if(m == null) return null;
            return new this(m, collection);
        });
    }

    static remove(id, collection) {
        return new Promise(async (resolve, reject) => {
            const db = await database.open();
            db.collection(collection).remove({id: id}, (err, status) => {
                if(err) reject(err);
                else resolve(status);
            });
        });
    }

    static async getAll(collection) {
        const db = await database.open();
        const items = await db.collection(collection).find().toArray();

        await db.close();

        return items;
    }

    static async insert(data, collection) {
        const db = await database.open();
        await db.collection(collection).insert(data);
        const cursor = await db.collection(collection).find({id: data.id});
        let item = await cursor.next();

        db.close();

        return item;
    }

    async save() {
        if(!this.isCreated()) {
            this.insert(this.data, collection);
            return;
        }

        const db = await database.open();
        await db.collection(this.collection).update({id: this.data.id}, {$set: this.data}, false, true)
        db.close();
    }

    isCreated() {
        return this.data.id !== undefined;
    }
}

module.exports = Model;