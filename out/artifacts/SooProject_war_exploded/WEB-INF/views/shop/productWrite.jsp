<%@ page import="com.spring.Board.dto.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String adminId= (String) session.getAttribute("adminId");
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
            $("#addBtn").click(function () {
                console.log("addBtn");
                var productName=$("#productName").val();
                var productDesc=$("#productDesc").val();
                var productPrice=$("#productPrice").val();
                var productPhoto=$("#productPhoto").val();

                if(productName == "") {
                    alert("상품명을 입력해주세요");
                    productName.foucs();
                } else if (productPrice == "") {
                    alert("상품 가격을 입력해주세요");
                    productPrice.focus();
                } else if (productDesc == "") {
                    alert("상품 설명을 입력해주세요");
                    productDesc.focus();
                } else if (productPhoto == "") {
                    alert("상품 사진을 입력해주세요");
                    productPhoto.focus();
                }
                document.form1.action="/shop/product/insert.do"
                document.form1.submit();
            });

        });

    </script>
    <style>
        body{
            background: lemonchiffon url("<c:url value='/images/header.jpg' />");
        }

        *{
            align: "center";
        }
    </style>
    <title>상품 등록</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<h2>상품 등록</h2>
<form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
    <table border="1">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="productName" id="productName"></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="text" name="productPrice" id="productPrice"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="5" cols="60" name="productDesc" id="productDesc"></textarea></td>
        </tr>
        <tr>
            <td>상품이미지</td>
            <td><input type="file" name="productPhoto" id="productPhoto"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="등록" id="addBtn">
                <input type="button" value="목록" onclick="location.href='/shop/product/list.do';">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
