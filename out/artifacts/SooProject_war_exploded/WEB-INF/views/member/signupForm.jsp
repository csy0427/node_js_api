<%@ page import="com.spring.Member.dto.MemberVO" %>
<%--
  Created by IntelliJ IDEA.
  User: daou
  Date: 2017-09-14
  Time: 오후 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        function checkId(){
            var id=$("#userid").val();
            $.ajax({
                type:'POST',
                url: "/member/confirmId.do",
                dataType:"json",
                data: {"userid": id},
                success:function (result) {
                    $("#ajax").remove();
                    if(result)  {
                        $('#checkMessage').html('사용할 수 없는 아이디입니다.');
                        $("#signupbtn").prop('disabled',true);
                    }
                },
                error:function (result) {
                    $('#checkMessage').html('사용할 수 있는 아이디입니다.');
                    $("#signupbtn").prop('disabled',false);
                    return false;
                }
            });
        }
    </script>

    <title>회원가입</title>
</head>
<body>
<h2 align="center">
    <p class="bg-danger">회원가입</p></h2>
<div class="container">
    <form method="post" action="/member/signup.do">
        <table class="table" border="1" width="400px">
            <tbody>
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" name="userid" id="userid" onchange="checkId()" />
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="userpw" id="userpw"></td>
            </tr>
            </tbody>
            <tr>
                <td>이름</td>
                <td><input type="text" name="username" id="username"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" name="useremail" id="useremail"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="signupbtn" id="signupbtn">Sign Up</button>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                <span id="checkMessage"></span>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
