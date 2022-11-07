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
</head>
<body>
<div>
<h2>회원제 게시판</h2>
    <button class="btn btn-primary" onclick="memberSave()">회원가입</button>

</div>
</body>
<script>
    const memberSave = () => {
        location.href = "/member/save"
    }
</script>
</html>
