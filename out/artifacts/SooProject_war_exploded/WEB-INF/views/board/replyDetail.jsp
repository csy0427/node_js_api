<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%String id= (String) session.getAttribute("id");
    String boardUserId= (String)session.getAttribute("boardUserId");
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>More Detail about Reply</title>
    <script type="text/javascript">
        $("#btnReplyUpdate").click(function () {
            var detailReplytext= $("#detailReplytext").val();
            $.ajax({
               type: "put",
               url: "/reply/update/${post.rno}",
               headers: {
                 "Content-Type":"application/json"
               },
                data: JSON.stringify({
                    replytext: detailReplytext
                }),
                dataType: "text",
                success: function (result) {
                    if(result=="success"){
                        $("#modifyReply").css("visibility","hidden");
                        listReplyRest("1");
                    }
                }
            });
        });

        $("#btnReplyClose").click(function () {
           $("#modifyReply").css("visibility","hidden");
        });

        $("#btnReplyDelete").click(function () {
           if(confirm("삭제하시겠습니까?")){
               $.ajax({
                   type: "delete",
                   url: "/reply/delete/${post.rno}",
                   success: function (result) {
                       if(result=="success"){
                           alert("삭제되었습니다.");
                           $("#modifyReply").css("visibility","hidden");
                           listReplyRest("1");
                       }
                   }

               });
           }
        });
    </script>
</head>
<body>
    댓글 번호 : ${post.rno}<br>
    <textarea id="detailReplytext" rows="5" cols="82">${post.replytext}</textarea>
    <div style="text-align: center;">
        <c:if test="${id==post.replyer}">
            <button id="btnReplyUpdate">수정</button>
            <button id="btnReplyDelete">삭제</button>
        </c:if>
        <button id="btnReplyClose">닫기</button>
    </div>
</body>
</html>
