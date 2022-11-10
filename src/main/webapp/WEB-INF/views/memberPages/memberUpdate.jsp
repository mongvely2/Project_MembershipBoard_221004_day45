<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-10
  Time: 오후 1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberUpdate</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>
<div class="container" id="update-form">
    <form action="/member/update" name="updateForm" method="post">
        번호: <input type="text" name="id" value="${member.id}" class="form-control" readonly>
        이메일: <input type="text" name="memberEmail" value="${member.memberEmail}" class="form-control" readonly>
        패스워드: <input type="text" name="memberPassword" id="memberPassword" class="form-control">
        이름: <input type="text" name="memberName" id="memberName" value="${member.memberName}" class="form-control">
        핸드폰번호: <input type="text" name="memberMobile" value="${member.memberMobile}" class="form-control">
        <input type="button" value="수정" class="btn btn-warning" onclick="update()">
    </form>
</div>
</body>
<script>
    const update = () => {
        const name = document.getElementById("memberName").value;
        const memberPassword = document.getElementById("memberPassword").value;
        const memberName = document.getElementById("memberName").value;

        if (memberName.length>=1) {

        } else {
            alert("이름은 필수 입력사항 입니다!")
        }

        if (memberPassword==${member.memberPassword}) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!")
        }
    }
</script>
</html>
