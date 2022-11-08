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
</head>
<body>
<div class="container">
    <form action="/member/login" method="post">
        <input type="text" name="memberEmail" placeholder="이메일입력">
        <input type="text" name="memberPassword" placeholder="비밀번호입력">
        <input type="submit" value="로그인" class="btn btn-primary">
    </form>
    <a href="/" class="btn btn-dark">홈으로 이동</a>
</div>
</body>
</html>
