<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오전 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardUpdate</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js"></script>
</head>
<body>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<div class="container">
    <form action="/board/update" name="updateResult" method="post">
        번호: <input type="text" name="id" value="${result.id}" class="form-control" readonly>
        작성자: <input type="text" name="boardWriter" value="${result.boardWriter}" class="form-control" readonly>
        제목: <input type="text" name="boardTitle" value="${result.boardTitle}" class="form-control">
        내용: <textarea name="boardContents" cols="30" rows="10" class="form-control">${result.boardContents}</textarea>
        <input type="button" value="수정" class="btn btn-warning" onclick="update()">
    </form>
    <a href="/" class="btn btn-dark">홈으로 이동</a>
</div>
</body>
<script>
    const update = () => {
        document.updateResult.submit();
    }
</script>
</html>
