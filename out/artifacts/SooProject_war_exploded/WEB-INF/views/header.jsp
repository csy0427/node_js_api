<%@ page pageEncoding="UTF-8"%>

<a href="/board/list.do">게시판</a>

<c:choose>
    <c:when test="${id == null}">
        <a href="/login/login.do">로그인</a>
    </c:when>
    <c:otherwise>
        ${id}님이 로그인중입니다.
        <a href="/login/logout.do">로그아웃</a>
    </c:otherwise>
</c:choose>
<hr>
