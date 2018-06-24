<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
     #banner2{
         background: lemonchiffon url("<c:url value='/images/banner.jpg' />");
         width: 100%;
         height: 500px;
     }
 </style>
</head>
<body>
    <div id="banner" name="banner" class="row">
        <a href="/shop/product/list.do">
            <div id="banner2"/>
        </a>
    </div>
</body>
</html>
