
var express     = require('express');
var app         = express();
var bodyParser  = require('body-parser');
var mongoose    = require('mongoose');

// [CONFIGURE APP TO USE bodyParser]
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
// [CONFIGURE ROUTER]
var router = require('./routes/index');

var app=express();

app.set('port',process.envPORT || 3000)
var url='mongodb://root:123456@54.249.81.28:27017/admin';
mongoose.connect('mongodb://root:123456@54.249.81.28/');
var db = mongoose.connection;
db.on('error', console.error);
db.once('open', function(){
    console.log("Connected to mongod server");
});


db.collection('users').drop(function(err,delOK){
    if(err) console.log(err);
    if(delOK) console.log("collection deleted");
});

 app.listen(3000, function(){
    console.log('Conneted 3000 port!');
});

