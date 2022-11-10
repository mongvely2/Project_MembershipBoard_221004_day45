<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-04
  Time: 오후 5:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div>
<h2>회원제 게시판</h2>
    <button class="btn btn-primary" onclick="memberSave()">회원가입</button>
    <button class="btn btn-primary" onclick="memberLogin()">로그인</button>
<%--    <button class="btn btn-primary" onclick="boardList()">글목록</button>--%>
    <button class="btn btn-primary" onclick="boardPagingList()">페이징 글목록</button>

</div>
</body>
<script>
    const memberSave = () => {
        location.href = "/member/save";
    }

    const memberLogin = () => {
        location.href = "/member/login";
    }

    // const boardList = () => {
    //     location.href = "/board/list";
    // }

    const boardPagingList = () => {
        location.href = "/board/paging";
    }
</script>
</html>
