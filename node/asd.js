const fs = require('fs');
const { createServer } = require('node:http');

const hostname = '127.0.0.1';
const port = 3000;

let u = "";

const server = createServer(function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'html');
  readFile("index.html");
  res.end(u);
});

server.listen(port, hostname, function() {
  console.log(`Server running at http://${hostname}:${port}/`);
});

function readFile(name) {
    fs.readFile(name, 'utf8', function(err, data) {
    if (err) {
      console.error('Error reading file:', err);
      return;
    }
    u = data;
  });
}
