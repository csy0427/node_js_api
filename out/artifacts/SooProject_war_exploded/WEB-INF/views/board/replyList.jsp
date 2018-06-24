<%--
  Created by IntelliJ IDEA.
  User: daou
  Date: 2017-11-06
  Time: 오후 1:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String id= (String) session.getAttribute("id");
    String boardUserId= (String)session.getAttribute("boardUserId");
    String boardnumber= (String)session.getAttribute("boardnumber");
%>
<html>
<head>
    <title>댓글 목록</title>
</head>
<body>
<table style="width:700px">
    <c:forEach var="row" items="${list}">
        <tr>
            <td>
                ${row.userId}
                <br>
                ${row.replytext}
                <br>
                <c:if test="${id==row.replyer}">
                    <input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.rno}')">
                </c:if>
                <hr>
            </td>
        </tr>
    </c:forEach>


    <tr style="text-align: center;">
        <td>
            <c:if test="${replyPager.curBlock > 1}">
                <a href="javascript:listReply('1')">[처음]</a>
            </c:if>
            <c:if test="${replyPager.curBlock > 1}">
                <a href="javascript:listReply('${replyPager.prevPage}')">[이전]</a>
            </c:if>

            <c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
                <c:choose>
                    <c:when test="${num == replyPager.curPage}">
                        ${num}&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:listReply('${num}')">${num}</a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                <a href="javascript:listReply('${replyPager.nextPage}')">[다음]</a>
            </c:if>

            <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                <a href="javascript:listReply('${replyPager.totPage}')">[끝]</a>
            </c:if>
        </td>
    </tr>
</table>
    <div id="modifyReply"/>
</body>
</html>
