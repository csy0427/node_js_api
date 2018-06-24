<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/css/custom.css' />">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css' />">
    <script src="<c:url value='/js/bootstrap.js' />"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>대화 목록</title>
</head>
<body>
    <c:forEach var="vo" items="${map.vo}" varStatus="status">
        <div>
            <div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
                <div class="row">
                    <div class="col-lg-12">
                        <p class="text-center text-muted small">${vo.chatTime}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object img-circle" src="https://lorempixel.com/30/30/people/1/" alt="">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">${vo.userid}</h4>
                                <p>${vo.chatContent}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </c:forEach>

<!--<div id="modifyReply"/>-->
</body>
</html>