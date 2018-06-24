
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  String id= (String) session.getAttribute("id");
    String boardUserId= (String)session.getAttribute("boardUserId");
    String boardnumber=(String)session.getAttribute("boardnumber");
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/css/custom.css' />">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css' />">
    <script src="<c:url value='/js/bootstrap.js' />"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>채팅방</title>
    <script type="text/javascript">
    $(document).ready(function () {

        listReplyRest("1");

        $("#btnSend").submit(function (e) {
            e.preventDefault();
            console.log("btnSend");
            var chatContent=$("#chatContent").val();
            if(confirm("메시지를 전송하시겠습니까?")){
                $.ajax({
                    type: "post",
                    url: "/chat/conver/insert.do",
                    headers: {
                        "Content-Type" : "application/json"
                    },
                    dateType: "text",
                    data:  JSON.stringify({
                        chatContent: chatContent,
                        userid: ${id}
                    }),
                    success:function () {
                            console.log("btnSend성공");
                            listReplyRest("1");  // Rest 방식
                    },
                    error:function () {
                        $('#checkMessage').html('전송에 실패하였습니다.');
                        return false;
                    }
                });
            }

        });

         $("#btnExit").click(function () {
            console.log("btnExit");
            if(confirm("나가시겠습니까?")){
            location.href="/chat/list.do";
            }
         });

    });

    function listReplyRest(num){
     $.ajax({
            type: "get",
            url: "/chat/conver/detail/${boardnumber}",
             processData: false,
            contentType: false,
            success: function(result){
                 $("#chatList").html(result);
            }
        });
    }
    </script>
    <style>
        body{
            background: lemonchiffon url("<c:url value='/images/header.jpg' />");
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
                        <h4><i class="fa fa-circle text-green"></i>${id}님이 ${map.roomName}방에 들어 와있습니다.</h4>
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
                <div class="row">
                    <div class="col-lg-12">
                        <div class="media">
                <div id="chat" class="panel-collapse collapse in">
                    <!--대화 불러오기-->
                    <div id="chatList" name="chatList"></div>
                </div>
                        </div>
                    </div>
                </div>
                <!-- 메신저 입력-->
                    <div class="portlet-footer">
                        <form role="form" id="form3" name="form3" method="post" action="/chat/conver/insert.do">
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter message..." id="chatContent" name="chatContent"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default pull-right" id="btnSend" name="btnSend">Send</button>
                                <div class="clearfix"></div>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-default pull-left" id="btnExit">나가기</button>
                                <div class="clearfix"></div>
                                <span id="checkMessage"></span>
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
