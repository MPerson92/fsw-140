
const express = require("express");
const mysql = require("mysql");

const db = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: 'Welcome27610!',
        database: 'pokemon'
    }
);

db.connect((err) => {
    if (err){
        throw err;
    }
    console.log(" Connection to MySql Database Sucessfully Established");
});

const app = express();

app.get('/createDB', (req, res) => {
    let myQuery = "CREATE DATABASE pokemon";

    db.query(myQuery, (err, result) => {
        if (err){
            throw err;
        }
        console.log(result);
        res.send("pokemon Database Created Successfully!")
    });
});

app.get('/createTable', (req, res) => {
    let myQuery = "CREATE TABLE species (id INT auto_increment, title VARCHAR(100), type VARCHAR(50), PRIMARY KEY (id))";

    db.query(myQuery, (err, result) => {
        if (err){
            throw err;
        }
        console.log(result);
        res.send("pokemon Table Created Successfully!")
    });
});

app.get('/insertFirstRow', (req, res) => {
    let list = {title: 'First Species', type: 'First type of species'};
    let myQuery = "INSERT INTO species SET ?";

    db.query(myQuery, list, (err, result) => {
        if (err){
            throw err;
        }
        console.log(result);
        res.send("First Row of species Inserted Successfully!")
    });
});

app.get('/insertSecondRow', (req, res) => {
    let list = {title: 'Second Species', type: 'Second type of species'};
    let myQuery = "INSERT INTO species SET ?";

    db.query(myQuery, list, (err, result) => {
        if (err){
            throw err;
        }
        console.log(result);
        res.send("Second Row of species Inserted Successfully!")
    });
});

app.get('/displayRows', (req, res) => {
    let myQuery = "SELECT * FROM species";
    db.query(myQuery, (err, result) => {
        if (err){
            throw err;
        }
        console.log(result);
        res.send("SELECT Query Executed Successfully!")
    });
});

app.get('/updateRow/:id', (req, res) => {
    let newTitle = "This is an update to the new Title column";
    let myQuery = `UPDATE species SET title = '${newTitle}' WHERE id = ${req.params.id}`;

    db.query(myQuery, (err, result) => {
        if (err){
            throw err;
        }
        console.log(result);
        res.send("UPDATE Query Executed Successfully!")
    });
});

app.get('/deleteRow/:id', (req, res) => {
    let myQuery = `DELETE FROM species WHERE id = ${req.params.id}`;

    db.query(myQuery, (err, result) => {
        if (err){
            throw err;
        }
        console.log(result);
        res.send("DELETE query executed Successfully!")
    });
});

app.listen('8000', () => {
    console.log("Local Web Server is Up and Running!")
});
