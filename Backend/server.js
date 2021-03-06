var fs = require('fs');
var content = fs.readFileSync('password.txt','utf8');
var mysql = require('mysql');
var cors = require('cors');

var con = mysql.createConnection({
  host: "localhost",
  user: "dallin",
  password: content.substring(0,14),
  database: "gander",
  multipleStatements: true
});
const bodyParser = require("body-parser");

const express = require('express');
const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));

app.use(cors());

app.get('/person', (req, res) =>
{
      con.query("SELECT * FROM Person", function (err, result, fields)
      {
        if (err) throw err;
        res.send(result);
      });
});

app.get('/post', (req, res) =>
{
      con.query("SELECT * FROM Post;", function (err, result, fields)
      {
        if (err) throw err;
	console.log("Retrieved all posts: ");
	console.log(result);
        res.send(result);
      });
});

app.get('/delete', (req, res) =>
{
   con.query("DELETE FROM Person", function(err, result) {
    if (err) throw err;
   });
   con.query("DELETE FROM Post", function(err, result) {
     if (err) throw err;
    });
    console.log("cleared database");
    res.sendStatus(200);
});

app.post('/person', (req, res) => {
  var entry = JSON.parse(Object.keys(req.body)[0]);
  console.log(entry);
  console.log("entry.PersonID: " + entry.PersonID);
  var sqlString = "INSERT INTO Person (PersonID, FirstName, LastName, ProfilePic) VALUES (\'" + entry.PersonID + "\', \'" + entry.FirstName + "\', \'" + entry.LastName + "\', \'" + entry.ProfilePic + "\');";
  con.query(sqlString, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
  res.sendStatus(200);
});


app.post('/post', (req, res) => {
  var entry = JSON.parse(Object.keys(req.body)[0]);
  console.log(entry);
  console.log("entry.PersonID: " + entry.PersonID);
  var sqlString = "INSERT INTO Post(PostID, Title, PersonID, PictureID, Picture, Content, Date, ParentID) VALUES (\'" + entry.PostID + "\', \'" + entry.Title + "\', \'" + entry.PersonID + "\', \'" + entry.PictureID + "\', \'" + entry.Picture + "\', \'" + entry.Content + "\', \'" + entry.Date +  "\', \'" + entry.ParentID + "\')";
  con.query(sqlString, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
  res.sendStatus(200);
});

app.listen(3005, "0.0.0.0");

