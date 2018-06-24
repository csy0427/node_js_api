
const express=require('express');
const passport = require('passport');
const router=express.Router();
const mongoose=require('mongoose');
var bodyParser=require('body-parser');
var smtpPool= require('nodemailer-smtp-pool');
var hasOwnProperty = Object.prototype.hasOwnProperty;

module.exports = function(app,userSchema,boardSchema,commentSchema,cartSchema){
    router.get('/',function(req,res){
        res.render('index.html');
    });
    return router;
};


router.get('/:id',(req,res)=>{
    console.log("boardRouter get: ", req.params.id);
    const id=req.params.i
    var findobj={
        board_id : id
    };
    boardSchema.find(function(err,data){
        if(data==null) res.status(400).json({error: 'Incorrect Board'});
        else{
            res.status(200);
        } 
    });
    
});

router.post('/:id',(req,res)=>{
    var title=req.params.title;
    var content=req.params.content;
    var author=req.params.author;
    var obj={
        title: title,
        contents:content,
        author: author 
    };
    var boardSchema=new boardSchema(obj);
    boardSchema.save(function(err,data){

    });
});

router.put('/:id',(req,res)=>{
    var boardId=req.params.boardId;
    var title=req.params.title;
    var content=req.params.content;
    var author=req.params.author;
    var date=Date.now();
    var update_obj={
        title: title,
        contents:content,
        author: author,
        board_modi_date: Date.now()
    };
    var upboardSchema= new boardSchema(update_obj);
    upboardSchema.where({board_id: board_id}).update({contents: content, title: title, modify_date : date},function(err,data){
        if(err) console.log('update error');
        else console.log(data);
    });
});

router.delete(':/id',(req,res)=>{
    const boardId=req.params.boardId;
    if(req.params.isHavePassword==true){
        var deleteObj={
            board_id : boardId,
            author : req.params.author,
            password: req.params.password
        };
        var delboardSchema=new boardSchema(deleteObj);
        delboardSchema.findOne({board_id : req.params.boardId, author : req.params.author, password : req.params.password},function(err,data){
            console.log('delete Board');
            if(err) {
                res.status(400).json({error: err});
            }
            else {
                console.log(data);
                delboardSchema.remove({board_id : boardId},function(err,data){
                    if(err){
                        res.status(400).json({error: err});
                    }
                    else console.log("success deletion of board ",boardId);
                }); 
            }
        });
        
    }
    else{
        var deleteObj={
            board_id : req.params.boardId,
            author : req.params.author,
        };
        var delboardSchema=new boardSchema(deleteObj);
        delboardSchema.remove({board_id : boardId},function(err,data){
            if(err){
                res.status(400).json({error: err});
            }
            else console.log("success deletion of board ",boardId);
        });  
    }
  

});

