
<!DOCTYPE html>
...
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=2, user-scalable=no">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Welcome to SOOBoard</title>
    <style>
        body{
            background: lemonchiffon url("<c:url value='/images/header.jpg' />");
        }
    </style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
Welcome to SOOBoard!!
<br>
<input type="button" onclick="location.href='/board/list.do'" value="게시판 입장"> </input>
<br>
<input type="button" onclick="location.href='/shop/product/list.do'" value="쇼핑몰 입장"> </input>
<br>
<input type="button" onclick="location.href='/shop/cart/list.do'" value="장바구니"> </input>
<br>
<input type="button" onclick="location.href='/chat/list.do'" value="채팅 게시판 입장"> </input>
</body>
</html>