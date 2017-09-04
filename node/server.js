var app, io, server, cors;

cors = require('cors')

app = require("express")();

app.use(cors())

app.use(function (req, res, next) {
    app.disable("x-powered-by");
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    res.header("Server", "import antigravity;");
    next();
});


  server = require("http").createServer(app);

  io = require("socket.io").listen(server, {
    transports  : [ 'websocket', 'xhr-polling', 'jsonp-polling', 'polling' ]
  });

  server.listen(3001);

  app.get("/", function(req, res) {
    return res.sendfile(__dirname + "/index.html");
  });

  var redis = require("redis");

  io.sockets.on('connection', function (socket) {

  console.log('user connected...');

  var subscribe = redis.createClient();
  subscribe.subscribe('vote.create');

  subscribe.on("message", function(channel, message) {
    console.log("from rails to subscriber:", channel, message);
    socket.emit('message', message)
  });

  socket.on('disconnect', function () {
    console.log("user disconnected");

    subscribe.quit();
  });

});






