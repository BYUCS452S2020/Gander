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

app.get('/', (req, res) => 
{
    con.connect(function(err) 
    {
      if (err) throw err;
      console.log("Connected!");
      con.query("SELECT * FROM Person; SELECT * FROM Post;", ["Person", "Post"], function (err, result, fields) 
      {
        if (err) throw err;
        res.send(result);
      });
    });
});

app.post('/', (req, res) => {
 
    res.send("yo");
});

app.listen(3005, "0.0.0.0");
