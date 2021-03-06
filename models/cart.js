var express = require('express');
const mongoose = require('mongoose');
const crypto = require('crypto');
var MongoClient = require('mongodb').MongoClient;
var bkfd2Password = require("pbkdf2-password");
var hasher = bkfd2Password();
var url='mongodb://@/admin';

mongoose.connect(url,function(err,db){
    if(err) console.log("failed to connect to db in user.js");
    console.log("success to connect to db in user.js"); 
});


const product = new mongoose.Schema({
    category : {type: String, required: true},
    create_date : Date,
    modify_date : Date,
    price : {type : Number}
});

const cart = new mongoose.Schema({
    email : { type: String, required: true, trim: true /*, validate:[ {validator : NameAlphabeticValidator,msg: "only enter alpabet"}]*/},
    create_date : Date,
    modify_date : Date,
    products : [product]
});

module.exports = mongoose.model('Cart', cart);
