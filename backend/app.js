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
>>>>>>> 35ca3b9104b275c79e1cca8ba2e9eb19ef3fe890
