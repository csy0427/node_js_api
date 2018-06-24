<%--
  Created by IntelliJ IDEA.
  User: daou
  Date: 2017-09-07
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.spring.Board.dto.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String id= (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
    <%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btnWrite").click(function () {
                console.log("btnWrite");
                location.href="/board/write.do";
            })

        });
        function list(page) {
            location.href="/board/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
        }
    </script>
    <style>
        body{
            background: cornflowerblue url("<c:url value='/images/portfolio/fullsize/3.jpg' />");
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<h2>게시글 목록</h2>
<form name="form1" method="post" action="/board/list.do">
    <select name="searchOption">
        <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+아이디+내용</option>
        <option value="userid" <c:out value="${map.searchOption == 'username'?'selected':''}"/> >아이디</option>
        <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
        <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
    </select>

    <input name="keyword" value="${map.keyword}">
    <input type="submit" value="조회">

    <c:if test="${id!=null}">
        <button type="button" id="btnWrite">글쓰기</button>
    </c:if>

</form>
${map.count}개의 게시물이 있습니다.
<table border="1" width="600px" class="table">
    <thead>
    <tr class="active">
        <th scope="col">제목</th>
        <th scope="col">아이디</th>
        <th scope="col">조회수</th>
    </tr>
    </thead>
    <c:forEach var="list" items="${map.list}" varStatus="status">
        <c:choose>
        <c:when test="${list.show == 'y'}">
            <thead>
        <tr>
            <td><a href="${path}/board/read.do?boardnumber=${list.boardnumber}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${list.title}</a></td>
            <td>${list.userId}</td>
            <td>${list.views}</td>
        </tr>
            </thead>
        </c:when>
            <c:otherwise>
                <tr class="info">
                    <td colspan="5" align="left">
                        <c:if test="${list.recnt > 0}">
                            <a href="${path}/board/read.do?bno=${list.boardnumber}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">삭제된 게시물입니다.
                                <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                                <c:if test="${list.recnt > 0}">
						<span style="color: red;">(${list.recnt})
						</span>
                                </c:if>
						</span>
                            </a>
                        </c:if>
                        <c:if test="${list.recnt == 0 }">
                            삭제된 게시물입니다.
                        </c:if>
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <tr class="warning">
        <td colspan="5">
            <c:if test="${map.boardPager.curBlock > 1}">
                <a href="javascript:list('1')">[처음]</a>
            </c:if>

            <c:if test="${map.boardPager.curBlock > 1}">
                <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
            </c:if>

            <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                <c:choose>
                    <c:when test="${num == map.boardPager.curPage}">
                        <span style="color: red">${num}</span>&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:list('${num}')">${num}</a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>

           <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
            </c:if>


            <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
            </c:if>
        </td>
    </tr>
</table>
</body>
</html>

