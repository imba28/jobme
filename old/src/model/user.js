const Model = require('../model');

class User extends Model {
    constructor() {
        this.collection = 'Users';
        super();
    }
}

module.exports = Object.assign(User, Model);