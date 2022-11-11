<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-07
  Time: 오전 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberSave</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        #saveDiv, #buttonFn {
            width: 500px;
        }
    </style>

</head>
<body>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<div class="container" id="saveDiv">
    <h3>회원가입 페이지</h3>
    <form action="/member/save" method="post" name="saveForm" enctype="multipart/form-data">
        이메일: <input type="text" name="memberEmail" id="memberEmail" onblur="duplicateCheck()" placeholder="이메일입력"
                    class="form-control">
        <div>
            <span id="email-dup-check"></span>
            <span></span>
        </div>
        비밀번호: <input type="text" name="memberPassword" id="memberPassword" onblur="passCheck()" placeholder="비밀번호입력"
                     class="form-control">
        <div><span id="expPass"></span></div>
        이름: <input type="text" name="memberName" id="memberName" placeholder="이름입력" class="form-control">
        핸드폰번호: <input type="text" name="memberMobile" id="memberMobile" onblur="mobileCheck()" placeholder="핸드폰번호입력"
                      class="form-control">
        <div><span id="expMobile"></span></div>
        프로필사진: <input type="file" name="memberProfiles" class="form-control">
    </form>
</div>
<div class="container" id="buttonFn">
<input type="button" value="가입하기" onclick="save()" class="btn btn-primary">
<a href="/" class="btn btn-dark">홈으로 이동</a>
</div>
</body>
<script>
    // const save = () => {
    //     document.saveForm.submit();
    // }

    const duplicateCheck = () => {
        const inputEmail = document.getElementById("memberEmail").value;
        const checkResult = document.getElementById("email-dup-check");
        console.log(inputEmail);

        $.ajax({
            type: "post",
            url: "/member/duplicateCheck",
            dataTypes: "text",
            data: {
                inputEmail: inputEmail
            },
            success: function (result) {
                console.log("savejsp:" + result)
                if (result == "Y") {
                    checkResult.innerHTML = "사용가능한 이메일 입니다!"
                } else {
                    checkResult.innerHTML = "이미 사용중인 이메일 입니다!"
                }
            },
            error: function () {
                console.log("실패")

            }
        });
    }

    const passCheck = () => {
        const inputPass = document.getElementById("memberPassword").value;
        const expPass = document.getElementById("expPass");
        const exp = /^(?=.*[a-z])(?=.*[\d])[a-z\d]{5,10}$/;
        if (!inputPass.match(exp)) {
            expPass.innerHTML = "영문 소문자(필수), 숫자(필수)를 포함하여 5~10 비밀번호를 생성해주세요!"
            expPass.style.color = "red";
            return false;
        } else {
            expPass.innerHTML = "사용가능합니다!";
            expPass.style.color = "green";
            return true;
        }
    }

    const mobileCheck = () => {
        const inputMobile = document.getElementById("memberMobile").value;
        const expMobile = document.getElementById("expMobile");
        const exp = /^\d{3}-\d{4}-\d{4}$/;
        if (!inputMobile.match(exp)) {
            expMobile.innerHTML = "'-'를 포함한 전화번호 8자리를 입력하세요!"
            expMobile.style.color = "red";
            return false;
        } else {
            expMobile.innerHTML = "사용가능합니다!";
            expMobile.style.color = "green";
            return true;
        }
    }

    const save = () => {
        const emailCheck = document.getElementById("memberEmail");
        const passCheck = document.getElementById("memberPassword");
        const nameCheck = document.getElementById("memberName");
        const mobileCheck = document.getElementById("memberMobile");

        if (document.saveForm.memberEmail.value == "") {
            alert("이메일을 입력하세요")
            return false;
        }
        if (document.saveForm.memberPassword.value == "") {
            alert("비밀번호를 입력하세요")
            return false;
        }
        if (document.saveForm.memberName.value == "") {
            alert("이름을 입력하세요")
            return false;
        }
        if (document.saveForm.memberMobile.value == "") {
            alert("연락처를 입력하세요")
            return false;
        }
        document.saveForm.submit();
    }
</script>
</html>
