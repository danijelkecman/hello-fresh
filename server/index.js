var http = require('http');
var auth = require('http-auth');

var basic = auth.basic({
    realm: "Danijel Area."
  }, (username, password, callback) => {
      // Custom authentication
      // Use callback(error) if you want to throw async error
    callback(username === "user" && password === "password");
  }
);

console.log("listening on 8080!")
// Creating new HTTP server.
http.createServer(basic, (req, res) => {
  res.end(`200 - ${req.user}!`);
}).listen(8080);
