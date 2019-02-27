'use strict';

const express = require('express');
var path = require('path')

// Constants
const PORT = 8080;

postgreSQL 
const pg = require('pg');
pg.connect('postgres://postgres:password@localhost:5432/practicedocker');

//body parser -> grabs data from form
const bodyParser = require('body-parser')

//password hash object
var passwordHash = require('password-hash');

//app instantiate
const app = express();
app.use(express.static(__dirname + '/public'));    // set static directory

//app uses body parser
app.use(bodyParser.urlencoded({extended: false}))

app.get('/', (req, res) => {
  res.sendFile('index.html');
});
app.get('/index.html', (req, res) => {
  res.sendFile('index.html');
});
app.get('/about.html', (req, res) => {
  res.sendFile('about.html');
});
app.get('/category.html', (req, res) => {
  res.sendFile('category.html');
});
app.get('/login.html', (req,res) => {
  res.sendFile('login.html');
})
app.get('/signup.html', (req,res) => {
  res.sendFile('signup.html');
})

app.post('/user_create', (req, res) => {
  
  //conosole log -> user info
  console.log("User Pressed Submit.............")
  console.log("===User Info===")
  console.log("1. Name: " + req.body.create_name)
  console.log("2. ID: " + req.body.create_ID)
  console.log("3. Password: " + req.body.create_password)
  console.log("4. email: " + req.body.create_email)
  console.log("5. age: " + req.body.create_age)

  //form data -> variables
  var name = req.body.create_name
  var id = req.body.create_ID
  var unsecure_password = req.body.create_password
  var email = req.body.create_email
  var age = req.body.create_age

  //secure password
  var secure_password = passowrdHasher(unsecure_password)
  transferToPostgre(name,id,secure_password,email,age)

  //route to login.html
  res.sendFile('login.html', { root: __dirname +  '/public'});
})

app.listen(PORT, () => console.log(`Running on ${PORT}`));

function transferToPostgre(nameP,idP,passwordP,emailP,ageP) {
  
  console.log("userData transfer in progress.......")

  //push variables
  var name = nameP
  var id = idP
  var password = passwordP
  var email = emailP
  var age = ageP

  //success var
  var success = false

  //make password secure

  //YR's Postgre pushes here


  //console success log
  if (success == true) {
    console.log("userData postgre transfer DONE.")
  } else {
    console.log("userData postgre transfer FAILURE!!!")
  }
  
}

function passowrdHasher(unsecure_password) {
  var secure_password = passwordHash.generate(unsecure_password);
  console.log("!!!Password is now secure!!!")
  //console.log("Hashed Passowrd = ",secure_password)

  return secure_password
}


//verify funtion for later
// function passwordValidater(userPassowrd) {
//   passwordHash = require('./lib/password-hash');

//   var hashedPassword = passwordHash.generate(userPassowrd)
//   var postgreHashedPassword = 'USER_PASSWORD_FROM_POSTGRE';   //need postgre lookup
  
//   if (passwordHash.isHashed(hashedPassword)) {
//     console.log('password hashed...')
//     console.log('password_VERIFIED = ', passwordHash.verify(hashedPassword, postgreHashedPassword));
//   } else {
//     console.log('PASSWORD NOT HASHED...')
//     console.log('password_VERIFIED = ', passwordHash.verify(hashedPassword, postgreHashedPassword)); 
//   }
// }