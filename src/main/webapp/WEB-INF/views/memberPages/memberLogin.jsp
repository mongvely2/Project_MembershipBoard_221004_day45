<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberLogin</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        #loginFn {
            width: 500px;
            margin-top: 30px;
        }
        /*#loginBt{*/
        /*    position: center;*/
        /*}*/
    </style>
</head>
<body>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<div class="container" id="loginFn">
    <form action="/member/login" method="post">
        <input type="text" name="memberEmail" placeholder="이메일입력" class="form-control">
        <input type="text" name="memberPassword" placeholder="비밀번호입력" class="form-control">
    </form>
    <div class="container" id="loginBt">
    <input type="submit" value="로그인" class="btn btn-primary">
    <a href="/" class="btn btn-dark">홈으로 이동</a>
    </div>
</div>
</body>
</html>
