<%--suppress ALL --%>
<%@ page import="com.spring.Board.dto.BoardVO" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript">

        $(document).ready(function(){

            $(".fileDrop").on("dragenter dragover", function(e){
                e.preventDefault(); // 기본효과 제한
            });

            $(".fileDrop").on("drop", function(e){
                e.preventDefault();
                var files = e.originalEvent.dataTransfer.files;
                var file = files[0];
                var formData = new FormData();
                formData.append("file", file);
                $.ajax({
                    url: "/upload/uploadAjax",
                    type: "post",
                    data: formData,
                    dataType: "text",
                    processData: false,
                    contentType: false,
                    success: function(data){
                        console.log(data);
                        var fileInfo = getFileInfo(data);
                        var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";

                        html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'>";

                        $("#uploadedList").append(html);
                    }
                });
            });

            $("#btnSave").click(function(){
                console.log("btnSave");

                var title = $("#title").val();
                var content = $("#content").val();

                if(title == ""){
                    alert("제목을 입력하세요");
                    document.form1.title.focus();
                    return;
                }

                if(content == ""){
                    alert("내용을 입력하세요");
                    document.form1.content.focus();
                    return;
                }

                var that = $("#form1");
                var str = "";

                $("#uploadedList .file").each(function(i){
                    str += "<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
                });

                $("#form1").append(str);
                document.form1.submit();
            });

        });


        function checkImageType(fileName){
            var pattern = /jpg|gif|png|jpeg/i;
            return fileName.match(pattern);
        }

        function getFileInfo(fullName){
            var fileName, imgsrc, getLink, fileLink;

            if(checkImageType(fullName)){

                imgsrc = "/upload/displayFile?fileName=" + fullName;
                console.log(imgsrc);

                fileLink = fullName.substr(14);
                console.log(fileLink);

                var front = fullName.substr(0, 12);
                console.log(front);

                var end = fullName.substr(14);
                console.log(end);

                getLink = "/upload/displayFile?fileName="+front+end;
                console.log(getLink);

            } else {
                // UUID를 제외한 원본파일명
                fileLink = fullName.substr(12);
                console.log(fileLink);
                // 일반파일디렉토리
                getLink = "/upload/displayFile?fileName="+fullName;
                console.log(getLink);
            }

            fileName = fileLink.substr(fileLink.indexOf("_")+1);
            console.log(fileName);
            return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
        }
    </script>
    <style>
        body{
            background-color: antiquewhite;
        }
        .fileDrop {
            width: 600px;
            height: 70px;
            border: 2px dotted royalblue;
            background-color: lightcoral;
        }
    </style>
    <title>게시글 작성</title>
</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<h2>게시글 작성</h2>
<form name="form1" id="form1" method="post" action="/board/add.do">
    <div>
        제목
        <input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
    </div>
    <br/><br/>
    <div>
        내용
        <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
    </div>
    <br/>
    <div>
        첨부파일 등록
        <div class="fileDrop"></div>
        <div id="uploadedList"></div>
    </div>
    <br/><br/>
    <div>
        아이디
        ${id}
    </div>
    <div style="width:650px; text-align: center;">
        <button type="button" id="btnSave">확인</button>
        <button type="reset">취소</button>
    </div>
    <br>
    </div>
</form>


</body>
