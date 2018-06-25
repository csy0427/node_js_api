var nodemailer = require('nodemailer');
var smtpPool= require('nodemailer-smtp-pool');

var transporter=nodemailer.createTransport({
    service : 'naver',
    auth:{
        user: '111@naver.com',
        pass: 'dfsd!'
    }
});
/*
var smptpTransport=nodemailer.createTransport("SMTP",{
    service : 'Gmail',
    auth:{
        user: '222@gmail.com',
    }
});
*/
var mailOptionsNaver = {
    from: '111@naver.com',
    to: '222@gmail.com',
    subject: '변경된 비밀번호',
    text: '변경된 비밀번호'
};

var mailOptionsGmail = {
    from: '222@gmail.com',
    to: '111@naver.com',
    subject: '변경된 비밀번호',
    text: '변경된 비밀번호'
};

transporter.sendMail(mailOptionsNaver,function(err,info){
    if(err) console.log(err);
    else console.log("Email sent to : "+info.response);
    transporter.close();
});
