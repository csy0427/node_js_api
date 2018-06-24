
<%@ page import="com.spring.Board.dto.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String id= (String) session.getAttribute("id");
    String adminId=(String)session.getAttribute("adminId");
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>상품 상세 설명</title>
    <style>
        body{
            background: lemonchiffon url("<c:url value='/images/portfolio/fullsize/4.jpg' />");
            color: black;
        }
    </style>
</head>
<body>
<h2 align="center" style="color: aliceblue">상품 상세정보</h2>
<table border="1" align="center">
    <tr>
        <td>
            <img src="<c:url value='/images/${vo.productUrl}'/>" width="340px" height="300px">
        </td>
        <td>
            <table border="1" style="height: 300px; width: 400px;">
                <tr align="center">
                    <td>상품명</td>
                    <td>${vo.productName}</td>
                </tr>
                <tr align="center">
                    <td>가격</td>
                    <td><fmt:formatNumber value="${vo.productPrice}" pattern="###,###,###"/></td>
                </tr>
                <tr align="center">
                    <td>상품소개</td>
                    <td>${vo.productDesc}</td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <form name="form1" method="post" action="/shop/cart/insert.do">
                            <input type="hidden" name="productId" value="${vo.productId}">
                            <select name="amount">
                                <c:forEach begin="1" end="10" var="i">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>&nbsp;개
                            <input type="submit" value="장바구니에 담기">
                        </form>
                        <a href="${path}/shop/product/list.do">상품목록</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
