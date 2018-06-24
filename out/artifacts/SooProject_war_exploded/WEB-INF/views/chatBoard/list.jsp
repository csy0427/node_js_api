
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String id= (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/css/custom.css' />">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css' />">
    <script src="<c:url value='/js/bootstrap.js' />"></script>
    <script src="<c:url value='/css/login.css'/>"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>대기실</title>
    <script>
        $(document).ready(function () {
            $("#btnWrite").click(function () {
                console.log("btnWrite");

                var roomName=$("#roomName").val();
                var secret="n";
                var roomPassword=$("#roomPassword").val();

                if(roomName==""){
                    alert("방이름을 입력하세요");
                    document.form1.roomName.focus();
                    return;
                }


                if($("#secretRoom").is(":checked")){
                    if(roomPassword==""){
                        alert("비밀번호를 입력하세요");
                        document.form1.roomPassword.focus();
                    }
                    else {
                        secret = "y";
                    }
                }

                if(confirm("방을 만드시겠습니까?")){
                    $.ajax({
                        type: 'post',
                        url: "/chat/insert.do",
                        dataType: "json",
                        data:{
                            "roomName": roomName,
                            "secret": secret,
                            "roomPassword": roomPassword,
                            "owner": ${id},
                            "maxMember": maxMember,
                            "boardnumber": ${boardnumber}
                        }

                    });
                }
            });

            $("#btnExit").click(function () {
                console.log("btnExit");
                if(confirm("나가시겠습니까?")){
                    location.href="/login/loginCheck.do";
                }
            });
        });
    </script>
    <style>
        body{
            background: cornflowerblue url("<c:url value='/images/portfolio/fullsize/3.jpg' />");
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="portlet portlet-default">
                <div class="portlet-heading">
                    <div class="portlet-title">
                        <h4><i class="fa fa-circle text-green"></i>${id}님의 대기실</h4>
                        <h2>${map.count}개의 방이 있습니다.</h2>
                    </div>
                    <div class="portlet-widgets">
                        <div class="btn-group">
                            <button type="button" class="btn btn-white dropdown-toggle btn-xs" data-toggle="dropdown">
                                <i class="fa fa-circle text-green"></i> Status
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#"><i class="fa fa-circle text-green"></i> Online</a>
                                </li>
                                <li><a href="#"><i class="fa fa-circle text-orange"></i> Away</a>
                                </li>
                                <li><a href="#"><i class="fa fa-circle text-red"></i> Offline</a>
                                </li>
                            </ul>
                        </div>
                        <span class="divider"></span>
                        <a data-toggle="collapse" data-parent="#accordion" href="#chat"><i class="fa fa-chevron-down"></i></a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="chat" class="panel-collapse collapse in">

                <c:forEach var="list" items="${map.list}" varStatus="status">
                    <div>
                        <div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="text-center text-muted small">날짜</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="media">
                                        <a class="pull-left" href="#">
                                            <a href="/chat/conver/detail.do/${list.boardnumber}"><img class="media-object img-circle" src="https://lorempixel.com/30/30/people/1/" alt=""></a>
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading">${list.roomName}</h4>
                                            <p>${list.secret}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>
                </c:forEach>
                    <div class="portlet-footer">
                        <form role="form">
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter message..."></textarea>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-default pull-right" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">방만들기</button>
                                <button type="button" class="btn btn-default pull-left" id="btnExit">나가기</button>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                    <div id="id02" class="modal">
                        <form class="modal-content animate" action="/chat/insert.do" method="post" id="form1" name="form1">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
                                <img src="<c:url value='/images/tiffany.jpg'/>" alt="Avatar" class="avatar">
                            </div>
                            <div class="container">
                                <label><b>방 제목</b></label>
                                <input type="text" placeholder="Enter Room Name" name="roomName" id="roomName" required>
                                <input type="checkbox" id="secretRoom">비밀 방
                            </div>
                            <div class="container">
                                <label><b>방 정원</b></label>
                                <input style="color:black;" type="number" style="width: 40px" name="maxMember" value="10" min="1">
                            </div>
                            <div class="container">
                                <label><b>방 비밀번호</b></label>
                                <input type="password" placeholder="Enter Password" name="roomPassword" id="roomPassword">
                                <input type="hidden" name="owner" value="${id}">
                            </div>
                            <div class="container">
                                <button type="submit" id="btnWrite" class="btn btn-default pull-right">방만들기</button>
                            </div>
                            <div class="container">
                                <br>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
