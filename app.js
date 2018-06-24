const express = require('express');
const path = require('path');
const session = require('express-session'); // 세션 설정
var router = express.Router();
const passport = require('passport'); // 여기와
const passportConfig = require('./passport')(passport); // 여기
const app = express();
const mongoose=require('mongoose');
const http=require('http');
const fs=require('fs');
var bodyParser=require('body-parser');
var MongoClient = require('mongodb').MongoClient;
var bkfd2Password = require("pbkdf2-password");
var hasher = bkfd2Password();
var nodemailer = require('nodemailer');
var smtpPool= require('nodemailer-smtp-pool');
var validator = require("email-validator");
var userSchema = require('./models/user');
var boardSchema = require('./models/board');
var commentSchema=require('./models/comment');
var orderlistSchema=require('./models/orderlist');
//var productSchema=require('./models/product');
var cartSchema=require('./models/cart');
var categorySchema=require('./models/category');
app.set('views', __dirname + '/views_file');
////////////////////
var index = require('./routes/index')(app);
var member= require('./routes/userRouter')(app,userSchema,cartSchema);
var board= require('./routes/boardRouter')(app,userSchema,boardSchema,commentSchema,cartSchema);
//var passport=require('./passport.js')
///const productRouter=require('./routes/')

app.use(bodyParser.urlencoded({ extended : false })); //이게 있어야  http data transfer 가능
//app.use(validator());
app.set('views', __dirname + '/views_file');
//app.set('views', '/views_file');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

app.use(session({ secret: '@#@$MYSIGN#@$#$', resave: false, saveUninitialized: true })); // 세션 활성화
app.use(passport.initialize()); // passport 구동
app.use(passport.session()); // 세션 연결
app.use(express.static('public'));//public file 사용하겠다.
app.use(express.static('models'));
////플래쉬 메시지 사용하겠다.
var flash = require('connect-flash');
app.use(flash())


//app.use(passportConfig); // 이 부분 추가
//app.use(express.static(path.join(__dirname, 'html')));

app.use('/', router);
app.use('/member',member);
app.use('/board',board);


app.set('port',process.envPORT || 3000);

var date = new Date();

app.get('/template', function(rq, res){
    res.render('index.html');
});

var options = {
    server: { socketOptions: { keepAlive: 1, connectTimeoutMS: 30000 } },
    replset: { socketOptions: { keepAlive: 1, connectTimeoutMS: 30000 } }
  };
  //mongoose.connect(secrets.db, options);

var url='mongodb://root:123456@54.249.81.28/admin';
mongoose.connect(url,options);

var db = mongoose.connection;
// 연결 실패
db.on('error', function(){
    console.log('Connection Failed!');
});

// 연결 성공
db.once('open', function() {
    console.log('Connected!');
});


app.listen(3001,function(){
    console.log('Connected, 3001 port');
});





