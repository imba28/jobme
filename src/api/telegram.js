const telebot = require('telebot');
const config = require('../config').api.telegram;

const bot = new telebot(config.key);

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

    broadcast(message) {
        for(let user of this.contacts) {
            this.message(user[0], message); // uid = user[0], userinfo = user[1];
        }
    }

    message(uid, message) {
        console.log(`send '${message}' to '${uid}'`);
        bot.sendMessage(uid, message).then(response => {
            console.log(`OK`, response);
        }).catch(error => {
            console.log(`Error`, error);
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
        }
    }
});
bot.on(/^(hallo|hi|hello|hey)/i, function(msg) {
    msg.reply.text(`Hallo ${msg.chat.first_name}!\nWie kann ich dir helfen?`);
});
bot.on('/start', (msg) => {
    console.log('Starte Setup!');

    const user = telegram.getUser(msg.from.id);
    if(user) user.awaitingName = true;
    else msg.reply.text(`Fehler!`);

    msg.reply.text(`Wie lautet dein Benutzername?`);
});
bot.on('/help', function(msg) {
    msg.reply.text(
        `/today: Aufgaben, die du heute erledigen musst.\n`
        +`/tomorrow: Aufgaben, die du bis morgen erledigen musst.`
    );
});
bot.on('/info', msg => {
    const user = telegram.getUser(msg.from.id);
    if(user) {
        msg.reply.text(`Was ich über dich weiß:\n`+
            `Du heißt ${user.first_name}\n`+
            `Dein Benutzername lautet '${user.username}'.`
        );
    }
});

module.exports = telegram;