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
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<div class="container" id="update-form">
    <form action="/member/update" name="updateForm" method="post">
        번호: <input type="text" name="id" value="${member.id}" class="form-control" readonly>
        이메일: <input type="text" name="memberEmail" value="${member.memberEmail}" class="form-control" readonly>
        기존 패스워드: <input type="text" id="memberPassword" class="form-control">
        변경 패스워드: <input type="text" name="memberPassword" id="updatePassword" class="form-control">
        변경확인 패스워드: <input type="text" id="updateCheckPassword" class="form-control">
        이름: <input type="text" name="memberName" id="memberName" value="${member.memberName}" class="form-control">
        핸드폰번호: <input type="text" name="memberMobile" value="${member.memberMobile}" class="form-control">
        <input type="button" value="수정" class="btn btn-warning" onclick="update()">
    </form>
</div>
</body>
<script>
    const update = () => {
        const name = document.getElementById("memberName").value;
        const dbPassword = '${member.memberPassword}';
        const memberPassword = document.getElementById("memberPassword").value;
        const inputPassword = document.getElementById("updatePassword").value;
        const checkPassword = document.getElementById("updateCheckPassword").value;
        const memberName = document.getElementById("memberName").value;
        const exp = /^(?=.*[a-z])(?=.*[\d])[a-z\d]{5,10}$/;

        //  비밀번호 확인후 수정가능 여부 확인을 위한 변수
        const checkUpdate = memberPassword == dbPassword;
        //  변경 비밀번호 재확인 절차 변수
        const checkPass = inputPassword == checkPassword;
        //  정규식 체크
        const newPassword = inputPassword.match(exp);


        if (memberName.length == 0) {
            alert("이름은 필수 입력사항 입니다!")
            return false;
        }
        if (checkUpdate && checkPass) {
            if (newPassword) {
                document.updateForm.submit();
            } else {
                alert("영문 소문자(필수), 숫자(필수)를 포함하여 5~10 비밀번호를 변경해주세요!");
            }
        } else {
            alert("정보가 일치하지 않습니다")
        }

        // if (checkUpdate && checkPass) {
        //     alert("비밀번호가 일치하지 않습니다!")
        // }
        // document.updateForm.submit();

    }
</script>
</html>
