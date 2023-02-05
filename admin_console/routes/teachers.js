var express = require('express');
var router = express.Router();
var db = require('../database');
router.get('/form', function(req, res, next) {
    res.render('teachers');
});
router.post('/create', function(req, res, next) {

    // store all the user input data
    const terna_id = req.body.t_id;
    const user_id = req.body.user_id;

    console.log("------------------------");

    teacherDetails = [
        [terna_id, user_id]
    ];
    console.log(teacherDetails)

    // insert user data into users table
    var sql = "INSERT INTO teachers (terna_id, user_id) VALUES ?";
    db.query(sql, [teacherDetails], function(err, data) {
        if (err) throw err;
        console.log("User data is inserted successfully ");
    });
    res.redirect('/teachers/form'); // redirect to user form page after inserting the data
});
module.exports = router;