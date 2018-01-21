const request= require('request');

const telegram = require('./api/telegram');
const discord = require('./api/discord');
const config = require('./config');

const update = function(message) {
    request({
        method: 'POST',
        url: config.api.discord.webhook,
        json: {
            'content': message,
            'username': 'Homework Bot'
        }
    });

    telegram.broadcast(message);
}

telegram.start();

module.exports = {
    update
}