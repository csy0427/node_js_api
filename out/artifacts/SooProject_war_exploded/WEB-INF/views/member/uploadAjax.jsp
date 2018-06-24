<%--
  Created by IntelliJ IDEA.
  User: daou
  Date: 2017-10-26
  Time: 오후 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script type="text/javascript" src="./js/common.js"></script>
    <title>Insert title here</title>
    <style>
        .fileDrop{
            width:600px;
            height: 200px;
            border: 1px dotted blue;
        }

        small{
            margin-left: 3px;
            font-weight: bold;
            color: gray;
        }
    </style>
</head>
<body>
<h2>AJAX File Upload</h2>
<div class="fileDrop"></div>
<div class="uploadedList"></div>
</body>
</html>
