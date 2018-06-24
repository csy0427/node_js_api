var nodemailer = require('nodemailer');
var smtpPool= require('nodemailer-smtp-pool');

var transporter=nodemailer.createTransport({
    service : 'naver',
    auth:{
        user: 'tuchsoo2@naver.com',
        pass: 'enwkd0329!'
    }
});
/*
var smptpTransport=nodemailer.createTransport("SMTP",{
    service : 'Gmail',
    auth:{
        user: 'tuchsoo3@gmail.com',
        pass: 'glqnf945'
    }
});
*/
var mailOptionsNaver = {
    from: 'tuchsoo2@naver.com',
    to: 'tuchsoo3@gmail.com',
    subject: '변경된 비밀번호',
    text: '변경된 비밀번호'
};

var mailOptionsGmail = {
    from: 'tuchsoo3@gmail.com',
    to: '@naver.com',
    subject: '변경된 비밀번호',
    text: '변경된 비밀번호'
};

transporter.sendMail(mailOptionsNaver,function(err,info){
    if(err) console.log(err);
    else console.log("Email sent to : "+info.response);
    transporter.close();
});
