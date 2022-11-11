<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        #indexFn {
            width: 500px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" flush="false"></jsp:include>
<div class="container" id="indexFn">
<h2>회원제 게시판</h2>
    <button class="btn btn-primary" onclick="indexSave()">회원가입</button>
    <c:if test="${sessionScope.loginEmail == null}">
    <button class="btn btn-primary" onclick="indexLogin()">로그인</button>
    </c:if>
    <c:if test="${sessionScope.loginEmail != null}">
    <button class="btn btn-primary" onclick="indexLogout()">로그아웃</button>
    </c:if>
<%--    <button class="btn btn-primary" onclick="boardList()">글목록</button>--%>
    <button class="btn btn-primary" onclick="indexPaging()">페이징 글목록</button>

</div>
</body>
<script>
    const indexSave = () => {
        location.href = "/member/save";
    }

    const indexLogin = () => {
        location.href = "/member/login";
    }

    // const boardList = () => {
    //     location.href = "/board/list";
    // }

    const indexPaging = () => {
        location.href = "/board/paging";
    }

    const indexLogout = () => {
        location.href = "/member/logout";
    }
</script>
</html>
