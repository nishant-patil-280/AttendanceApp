const express = require('express');
const { Server } = require('ws');

const app = express();

const PORT = process.env.PORT || 3000; //port for https

app.get("/test", function(req, res){
  
  console.log(req)
});

app.post("/test", function(req, res){
  
  console.log(req)
});

app.listen(3000, function() {
  console.log("Server started on port 3000");
});




// const express = require('express');
// const { Server } = require('ws');

// const PORT = process.env.PORT || 3000; //port for https

// const server = express()
//     .use((req, res) => res.send("Hi there"))
//     .listen(PORT, () => console.log(`Listening on ${PORT}`));

// const wss = new Server({ server });

// wss.on('connection', function(ws, req) {
//     ws.on('message', message => {
//         var dataString = message.toString();
//         console.log(dataString)
//     })
// })