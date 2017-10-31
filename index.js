const http = require('http');
const fs = require('fs');
const url = require('url');
const path = require('path');
const mime = require('mime');
const querystring = require('querystring');
const httpd_port = 8080;

const telegramBot = require('./src/api/telegram');
telegramBot.start();

const processPost = (request, response, callback) => { // https://stackoverflow.com/questions/4295782/how-do-you-extract-post-data-in-node-js/12022746#12022746
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
}

const httpd = http.createServer((req,res) => {
    try {
        if (req.method == 'POST') {
            console.log("POST");
            processPost(req, res, () => {
                if(req.post.submit && req.post.message) {
                    console.log(`Send ${req.post.message} to telegram`);
                    telegramBot.message('259170589', req.post.message);

                    res.writeHead(200, "OK", {'Content-Type': 'text/plain'});
                    res.end();
                }
            });
        }
        else {
            const uri = url.parse(req.url);
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
            });
        }
    }
    catch(e) {
        res.writeHead(500, {'Content-Type': 'text/plain'});
        res.write(`${e}\n`);
        res.end();
    }
}).listen(httpd_port, () => {
    console.log(`${(new Date())}: Web server is listening on port ${httpd_port}, http://localhost:${httpd_port}`);
});