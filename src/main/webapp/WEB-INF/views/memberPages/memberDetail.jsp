<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-10
  Time: 오후 5:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberDetail</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table">

        <tr>
            <th>번호</th>
            <td>${result.id}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${result.memberEmail}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>${result.memberPassword}</td>
        </tr>
        <tr>
            <th>이름</th>
            <td>${result.memberName}</td>
        </tr>
        <tr>
            <th>연락처</th>
            <td>${result.memberMobile}</td>
        </tr>

        <a class="btn btn-dark" href="/">홈으로 이동</a>
        <a class="btn btn-primary" href="/board/paging">페이징 목록</a>
    </table>
</div>

</body>
</html>
