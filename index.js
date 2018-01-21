const express = require('express');
const app = express();
const path = require('path');

const options = {
    dotfiles: 'ignore',
    etag: false,
    extensions: ['htm', 'html', 'js'],
    index: false,
    maxAge: '1d',
    redirect: false,
    setHeaders: function(res, path, stat) {
        res.set('x-timestamp', Date.now())
    }
}

app.use('/img', express.static(path.join(__dirname, 'public/assets')));
app.use('/js', express.static(path.join(__dirname, 'public/js')));
app.use('/css', express.static(path.join(__dirname, 'public/css')));

const name = [__dirname, 'public', 'index.html'].join('/');
app.get('/', function(req, res) {
    res.sendFile(name, function(err) {
        if (err) {
            console.log("FEHLER", err);
            next(err);
        } else {
            console.log('Sent:', name);
        }
    });
});

app.listen(8080, () => console.log('Example app listening on port 8080!'));