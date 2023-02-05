var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var teachersRouter = require('./routes/teachers');
var studentsRouter = require('./routes/students');
var coursesRouter = require('./routes/courses');
var subjectsRouter = require('./routes/subjects');
var lecturesRouter = require('./routes/lectures');

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

var usersRouter = require('./routes/users');
app.use('/users', usersRouter);

var teachersRouter = require('./routes/teachers');
app.use('/teachers', teachersRouter);

var studentsRouter = require('./routes/students');
app.use('/students', studentsRouter);

var coursesRouter = require('./routes/courses');
app.use('/courses', coursesRouter);

var subjectsRouter = require('./routes/subjects');
app.use('/subjects', subjectsRouter);

var lecturesRouter = require('./routes/lectures');
app.use('/lectures', lecturesRouter);

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');



app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/teachers', teachersRouter);
app.use('/students', studentsRouter);
app.use('/courses', studentsRouter);
app.use('/subjects', subjectsRouter);
app.use('/lectures', lecturesRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;