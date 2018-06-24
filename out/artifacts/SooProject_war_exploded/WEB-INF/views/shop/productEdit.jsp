<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>상품 편집</title>

    <script>
        $(document).ready(function () {
            $("#editBtn").click(function () {
                console.log("editBtn");
                if(confirm("수정하시겠습니까?")) {
                    var productName = $("#productName").val();
                    var productPrice = $("#productPrice").val();
                    var productDesc = $("#productDesc").val();
                    //var productPhoto = $("#productPhoto").val();

                    if (productName == "") {
                        alert("상품명을 입력해주세요");
                        productName.foucs();
                    } else if (productPrice == "") {
                        alert("상품 가격을 입력해주세요");
                        productPrice.focus();
                    } else if (productDesc == "") {
                        alert("상품 설명을 입력해주세요");
                        productDesc.focus();
                    }
                    document.form1.action = "/shop/product/update.do";
                    document.form1.submit();
                }
            });

            $("#deleteBtn").click(function () {
                console.log("btnList");
                if(confirm("삭제하시겠습니까?")){
                    document.form1.action="/shop/product/delete.do";
                    document.form1.submit();
                }
            });

            $("#listBtn").click(function () {
                console.log("btnList");
                if(confirm("리스트로 이동하시겠습니까?")){
                    location.href="/shop/product/list.do";
                }
            });

        });
    </script>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<h2>상품 정보</h2>
<form  action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
    <table border="">
        <tr>
            <td>상품 이미지</td>
            <td>
                <img src="<c:url value='/resources/file/${row.productUrl}'/>" height="300px" width="310px">
                <br>
                <input type="file" id="productPhoto" name="productPhoto">
            </td>
        </tr>
        <tr>
            <td>상품명</td>
            <td><input type="text" id="productName" name="productName" value="${vo.productName}"></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="number" id="productPrice" name="productPrice" value="${vo.productPrice}"></td>
        </tr>
        <tr>
            <td>상품소개</td>
            <td><textarea id="productDesc" name="productDesc" rows="5" cols="60">${vo.productDesc}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="productId" value="${vo.productId}">
                <input type="button" id="editBtn" value="수정">
                <input type="button" id="deleteBtn"value="삭제">
                <input type="button" id="listBtn" value="상품목록">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
