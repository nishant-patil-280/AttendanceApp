### INSTALLATION
##### step 1: Install express framework
`npm install -g express-generator`

`npx express --view=ejs`
##### step 2: Initialize npm
`npm init -y` 

#### step 3: Install dependencies
`npm install`

#### step 4: Create MySQL table
`CREATE DATABASE login`

``CREATE TABLE `users` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `DoB` Date,
  `emailAddress` varchar(255) DEFAULT NULL,
  `phoneNumber` long DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;``

#### step 5: Run project
`npm start`

### WORKING
1. users.ejs takes input data from html form.
2. data is then send to app.js where data is parsed and encoded through middleware.
3. this data is then sent to user.js through userRouter in app.js.
4. here data is then updated into main DB.
