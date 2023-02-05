var express = require('express');
var router = express.Router();
var db = require('../database');
router.get('/form', function(req, res, next) {
    res.render('users');
});
router.post('/create', function(req, res, next) {

    // store all the user input data
    const full_name = req.body.fullName;
    const DoB = req.body.DoB;
    const email = req.body.emailAddress;
    const phone_number = req.body.phoneNumber;

    console.log("------------------------");

    userDetails = [
        [full_name, DoB, email, phone_number]
    ];
    console.log(userDetails)

    // insert user data into users table
    var sql = "INSERT INTO users (fullName, DoB, emailAddress, phoneNumber) VALUES ?";
    db.query(sql, [userDetails], function(err, data) {
        if (err) throw err;
        console.log("User data is inserted successfully ");
    });
    res.redirect('/users/form'); // redirect to user form page after inserting the data
});
module.exports = router;