const telebot = require('telebot');
const config = require('../config');

const bot = new telebot(config.telegramApiKey);

class Telegram {
    constructor() {
        this.botStarted = false;
        this.contacts = new Map();
    }

    start() {
        if(!this.botStarted) {
            bot.start();
            this.botStarted = !this.botStarted;
        }
    }

    hasUser(uid) {
        return this.contacts.has(uid);
    }

    addUser(contact) {
        if(!this.hasUser(contact.id)) this.contacts.set(contact.id, contact);
    }

    getUser(uid) {
        return this.contacts.get(uid);
    }

    message(uid, message) {
        bot.sendMessage(uid, message).then(response => {
            console.log(`OK`, response);
        }).catch(error => {
            console.log(`Error`, error);
            throw error;
        });
    }
}
const telegram = new Telegram();

bot.on('*', msg => {
    if(!telegram.hasUser(msg.from.id)) telegram.addUser(msg.from);
    else {
        const user = telegram.getUser(msg.from.id);
        if(user && user.awaitingName) {
            user.username = msg.text.trim();
            delete user.awaitingName;
            msg.reply.text('Daten wurden gespeichert!');
            console.log(user);
        }
        else {
            msg.reply.text(`Fehler!`);
        }
    }
});
bot.on(/^(hallo|hi|hello|hey)/i, function(msg) {
    msg.reply.text(`Hallo ${msg.chat.first_name}!\nWie kann ich dir helfen?`);
});
bot.on('/start', (msg) => {
    msg.reply.text(`Wie lautet dein Benutzername?`);
    const user = telegram.getUser(msg.from.id);
    console.log('Starte Setup!');
    if(user) user.awaitingName = true;
    else msg.reply.text(`Fehler!`);
});
bot.on('/help', function(msg) {
    msg.reply.text(
        `/today: Aufgaben, die du heute erledigen musst.\n`
        +`/tomorrow: Aufgaben, die du bis morgen erledigen musst.`
    );
});
bot.on('/info', msg => {
    msg.reply.text();
});

module.exports = telegram;