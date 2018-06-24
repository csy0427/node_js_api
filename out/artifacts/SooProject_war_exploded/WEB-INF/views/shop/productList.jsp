<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String id= (String) session.getAttribute("id");
    String adminId=(String)session.getAttribute("adminId");
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
    <title>상품 목록</title>
    <script>
        $(document).ready(function () {
            $("#btnAdd").click(function () {
                location.href="/shop/product/write.do";
            });
        });
    </script>
<style>
    body{
        text-align: center;
    }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/shop/banner.jsp" %>
<div class="container">
<c:if test="${adminId!=null}">
    <button type="button" id="btnAdd">상품등록</button><br>
</c:if>
    <div class="table-responsive">
    <table border="1" align="center">
    <thead>
    <tr>
        <th>상품이미지</th>
        <th>상품명</th>
        <th>가격</th>
    </tr>
    </thead>
        <c:forEach var="row" items="${list}">
        <tbody>
        <tr>
            <td>
                <a href="${path}/shop/product/detail/${row.productId}">
                    <img src="<c:url value='/resources/file/${row.productUrl}'/>" width="150ox" height="120px">
                </a>
            </td>
            <td align="center">
                <a href="/shop/product/detail/${row.productId}">${row.productName}</a><br>
                <c:if test="${adminId!=null}">
                <a href="/shop/product/edit/${row.productId}">[상품편집]</a>
                </c:if>
            </td>
            <td>
                <fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>
            </td>
        </tr>
        </tbody>
        </c:forEach>
</table>
    </div>
</div>
</body>
</html>
