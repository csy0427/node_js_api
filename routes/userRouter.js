const express=require('express');
const passport = require('passport');
const router=express.Router();
const mongoose=require('mongoose');
var bodyParser=require('body-parser');
const crypto = require('crypto');
var bkfd2Password = require("pbkdf2-password");
var hasher = bkfd2Password();
var nodemailer = require('nodemailer');
var smtpPool= require('nodemailer-smtp-pool');
var hasOwnProperty = Object.prototype.hasOwnProperty;
var validator = require("email-validator");
KakaoStrategy = require('passport-kakao').Strategy;

module.exports=function(app,userSchema,cartSchema){
function isEmpty(obj) {

    if (obj == null) return true;

    if (obj.length > 0)    return false;
    if (obj.length === 0)  return true;

    if (typeof obj !== "object") return true;
    for (var key in obj) {
        if (hasOwnProperty.call(obj, key)) return false;
    }

    return true;
};

function isLoggedIn(req, res, next) {
    if (req.isAuthenticated()){
        return next();
    } else {
        res.redirect('/member/login');
    }
};

router.route('/findPassword').get(function(req,res){
    res.render('passwordfind.html');
});

router.route('/logout').get(function(req,res){
    req.logout();
    res.redirect('/member/login');
});

router.route('/otherlogin').get(function(req,res){
    res.render('otherlogin.html');
});

router.route('/email').get(function(req,res){
    console.log('email function called');
    res.redirect('/member/otherlogin');
});

router.route('/sendEmail').post(function(req,res){
   
   console.log('/sendEmail');
    
    var password = Math.floor((Math.random() * 100000000) + 1).toString();
    hasher({password: password},function(err,pass,salt,hash){
           var password2=hash;
           var salt=salt;

           console.log('password : '+password); 
           console.log('password2 : '+password2);  
           console.log('salt : '+salt);

           var transporter=nodemailer.createTransport({
            service : 'naver',
            auth:{
                user: 'tuchsoo2@naver.com',
                pass: '**********'
            }
            });
    
        var mailOptionsNaver = {
            from: 'tuchsoo2@naver.com',
            to: req.body.input_email,
            subject: '변경된 비밀번호에 대한 안내 메일입니다.',
            text : '변경된 비밀번호 입니다. ' + password
            //html:  '<h1>변경된 비밀번호입니다.</h1><h2>${password}</h2>'
        };
    
        console.log('input_email : '+req.body.input_email);
    
        transporter.sendMail(mailOptionsNaver,function(err,info){
            if(err) console.log(err);
            else console.log("Email sent to : "+info.response);
            transporter.close();
        });
        var date= new Date();
        userSchema.where({email : req.body.input_email}).update({password : password2, salt :salt, modify_date : date, istemppass: true},function(err,data){
            if(err) console.log('update error');
            else console.log(data);
        });

    });
    res.redirect('/member/email');
});

router.route('/').get(function(req,res){
    res.send('FIRST PAGE');
});

router.get('/login',function(req,res){
    if(req.user) res.render('index.html');
    else res.render('login.html');
});

router.post('/login', passport.authenticate('local', {
    successRedirect : '/template', 
    failureRedirect : '/member/login', //로그인 실패시 redirect할 url주소
    failureFlash : true 
}));

router.route('/validEmail').post(function(req,res){
    console.log("/validEmail, email : "+ req.body.input_email);
    var getEmail=req.body.input_email;
    return validator.validate(getEmail)
});

router.route('/checkEmail').post(function(req,res){
    console.log("/checkEmail, email : "+ req.body.input_email);
    var getEmail=req.body.input_email;
    var isEmptyObject=userSchema.find().where('email').equals(getEmail);
    console.log(isEmptyObject);
    userSchema.findOne({email : getEmail},function(err,data){
        if(err) console.log(err);
        console.log("__________"+ data);
        if(data==null){
            res.send(true) 
        } 
        else res.send(false)
        //res.send(data);
    });

});

router.get('/signup',function(req,res){
    res.render('signin.html');
});

router.get('/signup/email',function(req,res){
    res.render('emailsignin.html');
});

function makeCart(email){
    cartSchema.findOne({email : req.body.input_email},function(err,data){
        console.log('--- Read all carts---');
        if(err) console.log("error finding data to db :" + err);
        else {
            console.log(data);
            if(data==null || data=='') {
                var date= new Date();
    var obj={
        email : email,
        create_date : date,
        modify_date : date,
        products : ''
    };
    var newCart= new cartSchema(obj);

    newCart.save(function(err,data){
        if(err) {console.log("error saving data to carts :" + err);  res.status(500); }
        else console.log('success');
    });
    
    cartSchema.find(function(err,data){
        console.log('--- Read all ---');
        if(err) console.log("error finding data to db :" + err);
        else console.log(data); 
    });
    
    cartSchema.findOne({email : email},function(err,data){
        console.log('--- Read all carts---');
        if(err) console.log("error finding data to db :" + err);
        else {
            console.log(data);
            var jsondata=JSON.parse(data);
            var cartid=jsondata._id;
            return cartid;
        }
    });
            }
            else return data._id;
        }
    });
   
}; 


router.route('/signup').post(function(req,res){
    var date=new Date();
    var cartid;
      //var jsondata=JSON.parse(data);
    var cartid=makeCart(req.body.input_email);
    console.log('cart_id : '+ cartid);
    hasher({password: req.body.input_password},function(err,pass,salt,hash){
        var id=req.body.input_email.split('@');
        var obj={
              authId : "local:"+id[0],
              email:req.body.input_email,
              password : hash,
              salt : salt,
              nickname:req.body.input_nickname,
              create_date: date,
              modify_date: date,
              cart_id : cartid                    
        };
        var newUser=new userSchema(obj);
        console.log(newUser);
        ////saving new data
        newUser.save(function(err,data){
            if(err) {console.log("error saving data to db :" + err);  res.status(500); }
            else console.log("success"); 
        });

    });
    userSchema.find(function(err,data){
        console.log('--- Read all ---');
        if(err) console.log("error finding data to db :" + err);
        else console.log(data);
    });


    res.render('index.html')
           
});

router.route('/auth/facebook').get(passport.authenticate('facebook-login',{
    scope: ['email']
}));

router.route('/auth/facebook/callback').get(passport.authenticate('facebook-login',{
    successRedirect: '/profile',
    failureRedirect: '/'
}));

router.get('/auth/kakao', passport.authenticate('kakao-login'));

router.get('/oauth', passport.authenticate('kakao-login',{
    successRedirect : '/',
    failureRedirect : '/'
}));


router.route('/auth/naver').get(passport.authenticate('naver',{

}));

router.route('/auth/naver/callback').get(passport.authenticate('naver',{
    successRedirect: 'profile',
    failureRedirect: '/'
}));

router.get('/profile',function(req,res){
    console.log('/profile 패스 요청됨');
    console.log('req.user 객체의 값');
    console.log(req.user);
    if(!req.user){
        //console.log('000000000');
        console.log('사용자 인증 안된 상태임.');
        res.redirect('/');
    }
    else{
        console.log('사용자 인증된 상태임');
        console.log('/profile 패스 요청됨');
        console.dir(req.user);

        if(Array.isArray(req.user)){
            var user_json=JSON.stringify(req.user[0]._doc);
            res.send(uesr_json);
        }
        else{
            var user_json=JSON.stringify(req.user);
            var user_json_parse=JSON.parse(user_json);
            if(user_json_parse.provider=="kakao"){
                console.log('33333333');
                res.send(user_json);
            }

            else if(user_json_parse.provider=="facebook"){
                res.send(user_json)
            }
            else{

            }
        }
    }
});
    return router;
}
