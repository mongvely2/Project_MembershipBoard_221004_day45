<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-11
  Time: 오전 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
<header class="p-3 text-bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <%--            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">--%>
            <%--                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>--%>
            <%--            </a>--%>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/" class="nav-link px-2 text-secondary">Home</a></li>
                <li><a href="/member/login" class="nav-link px-2 text-white">로그인</a></li>
                <li><a href="/board/paging" class="nav-link px-2 text-white">글목록</a></li>
                <%--                <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>--%>
                <%--                <li><a href="#" class="nav-link px-2 text-white">About</a></li>--%>
            </ul>

            <form action="/board/search" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <div class="input-group">
                    <select name="type" class="form-select">
                        <option value="boardTitle" selected>제목</option>
                        <option value="boardWriter">작성자</option>
                    </select>
                    <input type="search" name="q" class="form-control form-control-dark text-bg-dark"
                           placeholder="Search..." aria-label="Search">
                    <button class="btn btn-outline-light"><i class="bi bi-search-heart"></i></button>
                </div>
            </form>

            <div class="text-end">
                <c:if test="${sessionScope.loginEmail == null}">
                    <button type="button" onclick="login()" class="btn btn-outline-light me-2">Login</button>
                    <button type="button" onclick="memberSave()" class="btn btn-warning">Sign-up</button>
                </c:if>
                <c:if test="${sessionScope.loginEmail != null}">
                    <span>${sessionScope.loginEmail} 님 반갑습니다</span>
                    <button class="btn btn-warning" onclick="memberLogout()" type="button">logout</button>
                </c:if>

            </div>
        </div>
    </div>
</header>
</body>
<script>
    const login = () => {
        location.href = "/member/login"
    }

    const memberSave = () => {
        location.href = "/member/save";
    }

    const memberLogout = () => {
        location.href = "/member/logout"
    }
</script>
</html>
