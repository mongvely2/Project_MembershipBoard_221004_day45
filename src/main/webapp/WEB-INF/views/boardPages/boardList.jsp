<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardList</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<div class="container" id="list">
    <table class="table table-striped table-hover text-center">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>조회수</th>
            <th>작성시간</th>
            <th>첨부파일</th>
        </tr>

        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardWriter}</td>
                <td>${board.boardContents}</td>
                <td>${board.boardHits}</td>
                <td>
                    <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </td>
                <td>${board.fileAttached}</td>
            </tr>
        </c:forEach>
    </table>
    <a href="/" class="btn btn-dark">홈으로 이동</a>
    <a href="/board/save" class="btn btn-primary">글쓰기</a>
    <a href="/board/paging" class="btn btn-primary">글목록</a>

</div>

</body>
</html>
