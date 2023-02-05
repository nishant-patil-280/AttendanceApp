var express = require('express');
var router = express.Router();
var db = require('../database');
router.get('/form', function(req, res, next) {
    res.render('subjects');
});
router.post('/create', function(req, res, next) {

    // store all the user input data
    const subject_name = req.body.subject_name;
    const course_id = req.body.course_id;

    console.log("------------------------");

    subjectDetails = [
        [subject_name, course_id]
    ];
    console.log(subjectDetails)

    // insert user data into users table
    var sql = "INSERT INTO subjects (subject_name, course_id) VALUES ?";
    db.query(sql, [subjectDetails], function(err, data) {
        if (err) throw err;
        console.log("User data is inserted successfully ");
    });
    res.redirect('/subjects/form'); // redirect to user form page after inserting the data
});
module.exports = router;