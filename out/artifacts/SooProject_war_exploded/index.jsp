
<!DOCTYPE html>
...
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=2, user-scalable=no">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <title>Welcome!</title>
  <style>
    body{
      background: lemonchiffon url("<c:url value='/images/header.jpg' />");
    }
  </style>
</head>
<body>
<input type="button" onclick="location.href='/login/login.do'" value="로그인"> </input>
</body>
</html>
