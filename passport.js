

const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const User = require('./models/user');
const crypto = require('crypto');
const mongoose=require('mongoose');
var MongoClient = require('mongodb').MongoClient;
var KakaoStrategy = require('passport-kakao').Strategy;
var FacebookStrategy= require('passport-facebook').Strategy;
var bkfd2Password = require("pbkdf2-password");
var hasher = bkfd2Password();
var url='mongodb://root:123456@/';
module.exports = function(passport) {
    
    passport.serializeUser(function(user, done) {
        done(null, user.email);
    });

    passport.deserializeUser(function(email, done) {
        console.log("deserialized: "+ email);
        User.findOne({email: email}, function(err, user) {
            if(!user) done('There is no user');
            else done(err, user);
        });
    });
    
};

function isLoggedIn(req, res, next) {
    if (req.isAuthenticated()){
        return next();
    } else {
        res.redirect('/member/login');
    }
};

passport.use('facebook-login', new FacebookStrategy({
    clientID: '1795419897431352',
    clientSecret: '3b920e2ad0dbe2ce81a4d2eef545de93',
    callbackURL: '/auth/facebook/callback',
    profileFields:['id', 'email', 'gender', 'link', 'locale', 'name', 'timezone', 'updated_time', 'verified', 'displayName']
},function(accessToken,refreshToken,profile,done){
    console.log("FacebookStrategy : " + profile);
    var authId='facebook:'+profile.id;
    User.findOne({email : profile.email},function(err,user){
        if(err) return done(err);
        if(user){
            return done(null,user);
        }
    });
}));

passport.use('kakao-login', new KakaoStrategy({
    clientID: '64b156f0fe2238ceb7d8a640bbef3c80',
    clientSecret: 'Client_Secret',
    callbackURL: 'http://localhost:3001/member/oauth'
},
function(accessToken, refreshToken, profile, done) {
    console.log(profile);
    return done(null, profile);
}));



passport.use('signup', new LocalStrategy({
    usernameField : 'email',
    passwordField : 'password',
    passReqToCallback : true,
    callbackURL: '/signup/callback' 
},
function(req, username, password, done) {
    User.findOne({ 'email' : email }, function(err, user) {
        if (err) return done(err);
        if (user) {
            return done(null, false, req.flash('signupMessage', '이메일이 존재합니다.'));
        } else {
            console.log("new memeber!");
            var newUser = new User();
            var id=email.split('@');
            newUser.authId = "local:"+id[0];
            newUser.email = email;
            hasher({password: password},function(err,pass,salt,hash){
                newUser.password=hash;
                newUser.salt=salt; 
             });
            newUser.save(function(err) {
                if (err) throw err;
                return done(null, newUser);
            });
            /*
            MongoClient.connect(url, function(err, db) {
                if (err) throw err;
                var dbo = db.db("mydb");
                console.log('connect to db in passport'); 
                dbo.collection("user").findOne({}, function(err, result) {
                  if (err) throw er
                  console.log(result);
                  db.close();
                });
                //setting
          
          });
          */
        }
    });
}));
/*
passport.use('local-login',new LocalStrategy({
    usernameField : 'email',
    passwordField : 'password',
    session : true,
    passReqToCallback : true 
},
function(req, email, password, done) { 
    User.find({ email : email }, function(err, user) {
        if (err)
            return done(err);
        if (!user)
            return done(null, false, req.flash('loginMessage', '사용자를 찾을 수 없습니다.'));
        return hasher({password : password, salt : user.salt},function(err,pass,salt,hash){
            if(hash==user.password){
                console.log('LocalStrategy ',user);
                done(null,user);
            }else{
                req.flash('loginMessage', '비밀번호가 잘못되었습니다.');
                done(null,false);
            }
        });
    });
}));
*/


passport.use(new LocalStrategy({ // local 전략을 세움
    usernameField: 'email',
    passwordField: 'password',
    session: true, // 세션에 저장 여부
    passReqToCallback: true,
  }, (req, email, password, done) => {
      console.log('local strategy :' +email);
      console.log('local strategy :' +password);
    User.findOne({ email: email }, (findError, user) => {
      if (findError) return done(findError); // 서버 에러 처리
      if (!user) return done(null, false, { message: '존재하지 않는 아이디입니다' }); // 임의 에러 처리
      return user.comparePassword(user,password,(passError, isMatch) => {
        if (isMatch) {
          return done(null, user); // 검증 성공
        }
        return done(null, false, { message: '비밀번호가 틀렸습니다' }); // 임의 에러 처리
      });
    });
  }));
