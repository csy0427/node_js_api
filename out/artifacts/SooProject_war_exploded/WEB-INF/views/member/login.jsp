
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css' />">
    <script src="<c:url value='/js/bootstrap.js' />"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="<c:url value='/css/login.css'/>"></script>
    <title>로그인 페이지</title>
    <style>
        body{
            background: lemonchiffon url("<c:url value='/images/header.jpg' />");
        }
    </style>
</head>
<body>
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
<div id="id01" class="modal">

    <form class="modal-content animate" action="/login/loginCheck.do">
        <div class="imgcontainer">
            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            <img src="<c:url value='/images/img_avatar2.png' />" alt="Avatar" class="avatar">
        </div>
        <div class="container">
            <label><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="userid" id="userid" required>

            <label><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="userpw" id="userpw" required>
            <button type="submit">Login</button>
            <input type="checkbox" checked="checked"> Remember me
        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
        <div class="container" align="center" style="background-color:#f1f1f1">
            <input type="button" value="회원가입" onclick="location.href='/member/signupForm.do'">
        </div>
        <div class="container"><br></div>
    </form>
</div>
</body>
</html>
