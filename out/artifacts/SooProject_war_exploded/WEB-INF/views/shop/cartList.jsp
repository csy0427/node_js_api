<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title>상품장바구니 목록</title>
    <script>
        $(document).ready(function () {
            $("#btnList").click(function () {
                location.href="/shop/product/list.do";
            })
        });
    </script>
    <style>
        body{
            background: lemonchiffon url("<c:url value='/images/portfolio/fullsize/4.jpg' />");
            color: black;
        }
    </style>
</head>
<body>
<h2 align="center">장바구니 확인</h2>
<c:choose>
    <c:when test="${map.count==0}">
        장바구니가 비었습니다.
    </c:when>
    <c:otherwise>
        <form  align="center" name="form1" id="form1" method="post" action="/shop/cart/update.do">
            <table border="1" align="center" style="color:lightgoldenrodyellow;">
                <thead>
                <tr class="active">
                    <th>상품명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>취소</th>
                </tr>
                </thead>
                <c:forEach var="row" items="${map.list}" varStatus="i">
                    <tr>
                        <td>
                                <input type="hidden" name="cartId" value="${row.cartId}">
                                ${row.productName}
                        </td>
                        <td style="width: 80px" align="right">
                            <fmt:formatNumber pattern="###,###,###" value="${row.productPrice}"/>
                        </td>
                        <td>
                            <input style="color:black;" type="number" style="width: 40px" name="amount" value="${row.amount}" min="1">
                            <input type="hidden" name="productId" value="${row.productId}">
                        </td>
                        <td style="width: 100px" align="right">
                            <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                        </td>
                        <td>
                            <a href="/shop/cart/delete.do?cartId=${row.cartId}">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5" align="right">
                        장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/><br>
                        배송료 : ${map.fee}<br>
                        전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="count" value="${map.count}">
            <button type="submit" id="btnUpdate">수정</button>
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
