var express=require('express');
var bodyparser=require('body-parser');
//post information get...
var fs=require('fs');
var app=express();
app.use(bodyparser.urlencoded({extended: false}));
app.set('views','./views_file');
app.set('view engine','jade');

app.post('/topic',function(req,res){
    var title=req.body.title;
    var description=req.body.description;
    fs.writeFile('data/'+title, description,function(err){
        if(err){
            res.status(500).send('Internal Server Error');
        }
        res.send('Success!');
        res.send('HI,post'+title);        
    });
  
});

//app listens 3000 port ,if 3000 port is called, callback function is called
app.listen(3000,function(){
    console.log('Connected, 3000 port');
});

