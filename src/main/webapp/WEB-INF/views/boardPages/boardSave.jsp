<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js"></script>
</head>
<body>
<div class="container">
    <form action="/board/save" method="post" name="saveForm" enctype="multipart/form-data">
        작성자: <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" class="form-control">
        제목: <input type="text" name="boardTitle" placeholder="제목입력" class="form-control">
        내용: <textarea name="boardContents" cols="30" rows="10" placeholder="내용입력" class="form-control"></textarea>
        첨부파일: <input type="file" name="boardFileName" class="form-control">
        <input type="button" value="작성하기" onclick="saveButton()" class="btn btn-primary">
    </form>
    <a href="/" class="btn btn-dark">홈으로 이동</a>
</div>
</body>
<script>
    const saveButton = () => {
        document.saveForm.submit();
    }
</script>
</html>
