var express = require('express');
var router = express.Router();
var db = require('../database');
router.get('/form', function(req, res, next) {
    res.render('students');
});
router.post('/create', function(req, res, next) {

    // store all the user input data
    const student_id = req.body.student_id;
    const user_id = req.body.user_id;
    const course_id = req.body.course_id;
    const roll_number = req.body.roll_number;
    const year = req.body.year;

    console.log("------------------------");

    studentsDetails = [
        [student_id, user_id, course_id, roll_number, year]
    ];
    console.log(studentsDetails)

    // insert user data into users table
    var sql = "INSERT INTO students (student_id, user_id, course_id, roll_number, year) VALUES ?";
    db.query(sql, [studentsDetails], function(err, data) {
        if (err) throw err;
        console.log("User data is inserted successfully ");
    });
    res.redirect('/students/form'); // redirect to user form page after inserting the data
});
module.exports = router;