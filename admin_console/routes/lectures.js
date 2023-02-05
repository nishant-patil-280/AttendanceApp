var express = require('express');
var router = express.Router();
var db = require('../database');
router.get('/form', function(req, res, next) {
    res.render('lectures');
});
router.post('/create', function(req, res, next) {

    // store all the user input data
    const subject_name = req.body.subject_name;
    const subject_id = req.body.subject_id;
    const class_name = req.body.class_name;
    const teacher_id = req.body.teacher_id;
    const timing = req.body.timing;
    const day = req.body.day;
    const year = req.body.year;

    console.log("------------------------");

    lectureDetails = [
        [subject_name, subject_id, class_name, teacher_id, timing, day, year]
    ];
    console.log(lectureDetails)

    // insert user data into users table
    var sql = "INSERT INTO lectures (subject_name, subject_id, class_name, teacher_id, timing, day, year) VALUES ?";
    db.query(sql, [lectureDetails], function(err, data) {
        if (err) throw err;
        console.log("User data is inserted successfully ");
    });
    res.redirect('/lectures/form'); // redirect to user form page after inserting the data
});
module.exports = router;