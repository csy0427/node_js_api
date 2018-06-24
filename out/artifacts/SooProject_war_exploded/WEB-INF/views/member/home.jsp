<%--
  Created by IntelliJ IDEA.
  User: daou
  Date: 2017-09-06
  Time: 오후 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Home</title>
    <%@ include file="index.jsp" %>
</head>
<body>
<%@ include file="menu.jsp" %>
<c:if test="${msg == 'success'}">
    <h2><p class="bg-danger">${sessionScope.id}님 환영합니다.</p></h2>
</c:if>
</body>
</html>
