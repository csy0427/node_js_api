
const express=require('express');
const passport = require('passport');
const router=express.Router();
const mongoose=require('mongoose');
var bodyParser=require('body-parser');
//var userSchema = require('./models/user')
const crypto = require('crypto');
var bkfd2Password = require("pbkdf2-password");
var hasher = bkfd2Password();
var nodemailer = require('nodemailer');
var smtpPool= require('nodemailer-smtp-pool');
var hasOwnProperty = Object.prototype.hasOwnProperty;
var validator = require("email-validator");

KakaoStrategy = require('passport-kakao').Strategy;

module.exports=function(app){
    router.get('/',function(req,res){
        res.send('FIRST PAGE'); 
    });
    return router;
}
