var express = require('express');
var router = express.Router();
var db = require('../database');
router.get('/form', function(req, res, next) {
    res.render('courses');
});
router.post('/create', function(req, res, next) {

    // store all the user input data
    const course_name = req.body.course_name;

    console.log("------------------------");

    courseDetails = [
        [course_name]
    ];
    console.log(courseDetails)

    // insert user data into users table
    var sql = "INSERT INTO courses (course_name) VALUES ?";
    db.query(sql, [courseDetails], function(err, data) {
        if (err) throw err;
        console.log("User data is inserted successfully ");
    });
    res.redirect('/courses/form'); // redirect to user form page after inserting the data
});
module.exports = router;