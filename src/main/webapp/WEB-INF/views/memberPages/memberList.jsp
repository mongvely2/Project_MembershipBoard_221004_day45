<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-11
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberList</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <link rel="stylesheet" href="/resources/js/jquery.js">
</head>
<body>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table table-striped table-hover">
        <tr>
            <th>id</th>
            <th>memberEmail</th>
            <th>memberPassword</th>
            <th>memberName</th>
            <th>memberMobile</th>
            <th>fileAttached_첨부파일(Y/N)</th>
            <th>회원삭제</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberMobile}</td>
                <td>${member.fileAttached}</td>
                <td>
                    <button class="btn btn-danger" onclick="deleteMember('${member.id}')">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/" class="btn btn-primary">홈으로 이동</a>
    <a href="/member/admin" class="btn btn-primary">회원관리</a>
</div>
</body>
<script>
    const deleteMember = (id) => {
        if (confirm("해당 회원을 삭제하시겠습니까?")) {
            location.href = "/member/delete?id=" + id;
            alert("삭제되었습니다")
        } else {
            alert("취소하셨습니다")
        }
    }
</script>
</html>
