<%--
  Created by IntelliJ IDEA.
  User: daou
  Date: 2017-09-11
  Time: 오후 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 수정</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<h2>게시글 작성</h2>
<form name="form1" method="post" action="${path}/board/update.do">
    <div>
    제목
    <input name="title" id="title" size="80" value="${post.title}">
    </div>
    <div>
        내용
        <textarea name="content" id="content" rows="4" cols="80">${post.content}</textarea>
    </div>
    <div style="width:650px; text-align: center;">
        <input type="hidden" name="boardnumber" id="boardnumber" value="${post.boardnumber}">
        <input type="hidden" name="views" id="views" value="${post.views}">
        <input type="submit" value="제출">
    </div>
</form>
</body>
