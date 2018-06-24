<%--
  Created by IntelliJ IDEA.
  User: daou
  Date: 2017-09-06
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
body>
<h2 align="center"><p class="bg-danger">로그인</p></h2>
<div class="container">
    <form method="post" action="/member/loginCheck.do">
        <table class="table" border="1" width="400px">
            <tbody>
            <tr>
                <td>아이디</td>
                <td><input name="id" id="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" id="password"></td>
            </tr>
            </tbody>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="로그인"/>
                    <c:if test="${msg == 'failure'}">
                        <div style="color: red">
                            아이디 또는 비밀번호가 일치하지 않습니다.
                        </div>
                    </c:if>
                    <c:if test="${msg == 'logout'}">
                        <div style="color: red">
                            로그아웃되었습니다.
                        </div>
                    </c:if>
                </td>
                <td colspan="2" align="center">
                    <button value="로그인" onclick="location.href='./signupForm.do'"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
