var mongoose=require('mongoose');
var Schema=mongoose.Schema;

var commentSchema= new Schema({
    comment_id: String,
    contents: String,
    author: String,
    comment_date: {type:Date, default: Date.now()}
});

var boardSchema =new Schema({
    board_id: String,
    title: String,
    contents: String,
    author: String,
    password : String,
    isHavePassword: {type: Boolean, default: false },
    board_date: {type:Date, default: Date.now()},
    board_modi_date:{type:Date, default: Date.now()},
    comments: [commentSchema]
});

module.exports=mongoose.model('board',boardSchema);

