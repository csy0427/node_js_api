var fs=requre('fs');
var data=fs.readFileSync('data.txt',{encoding :'utf8'});

console.log(1);
var data=fs.readFileSync('data.txt',{encoding :'utf8'});
 console.log(2);
 //sync- single thread 로 돈다
 
 fs.readFile('data.txt',{encoding: 'utf8'},function(err,data){
     console.log(3);
     console.log(data);
 });
 console.log(4);
 //node.js 로는 async가 좋다.