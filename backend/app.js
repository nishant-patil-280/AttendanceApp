const { json } = require('express');
const bodyParser = require("body-parser");
const express = require('express');
const { Server } = require('ws'); 
const mysql = require('mysql2');

const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "attendance_db"
}
  
);

const app = express();

app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));

const PORT = process.env.PORT || 3000; //port for https

//-----------------Teacher app-----------------//

app.get("/test", function(req, res){
  var text;
  var sub = timetable.subject_id;
  for(var subject in subjects) {
    console.log(subject)
    if (subject.subject_id == timetable.div1) {
      text = subject
    }
  }
  res.send(timetable.div1);
});

app.post("/login", function(req, res){
  var isCorrect = false;
  var username = req.body.username;
  var password = req.body.password;
  con.query('select enrollid ,password from user', function(err, result){
    if(err) throw err;
    for(i in result) {
      // console.log(String(username) + String(result[i].enrollid) + String(password) + String(result[i].password));
      if(username.localeCompare(result[i].enrollid)){
        if(password.localeCompare(result[i].password)){
          isCorrect = true;
        }
      }
    }
  })
  console.log(username + " " + password)
  res.send(isCorrect)
});

app.post("/location", function(req, res){
  var location = req.body.location;
  console.log(location)
});

//-----------------Teacher app-----------------//

//-----------------Student app-----------------//

app.post("/student_login", function(req, res){
  var username = req.body.username;
  var password = req.body.password;

  

  console.log(username + " " + password)
});

//-----------------Student app-----------------//

app.listen(3000, function() {
  console.log("Server started on port 3000");
});


