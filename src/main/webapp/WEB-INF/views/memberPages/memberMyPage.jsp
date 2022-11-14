<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-10
  Time: 오후 5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberMyPage</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>
<c:if test="${sessionScope.loginEmail != 'admin'}">
    <a href="/member/update" class="btn btn-primary">회원정보수정</a>
</c:if>
<a href="/board/paging" class="btn btn-primary">게시판</a>
</body>
</html>
