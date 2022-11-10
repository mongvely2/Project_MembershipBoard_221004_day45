<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>boardDetail</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<div class="container">
    <table class="table table-hover">
        <tr>
            <th>번호</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.boardContents}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>작성일자</th>
            <td>${board.boardCreatedDate}</td>
        </tr>
        <c:if test="${boardFile.storedFileName != null}">
            <tr>
                <th>file</th>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                         alt="" width="200" height="200">
                </td>
            </tr>
        </c:if>
    </table>
    <button class="btn btn-primary" onclick="listFn()">글목록</button>

    <c:if test="${sessionScope.loginEmail eq board.boardWriter}">
        <button class="btn btn-warning" onclick="updateFn()">글수정</button>
        <button class="btn btn-danger" onclick="deleteFn()">삭제</button>
    </c:if>
</div>
<%--    댓글작성창    --%>
<div class="container mt-5" id="comment-write">
    <div class="input-group-sm mb-3">
        <div class="form-floating">
            <input type="text" id="commentWriter" class="form-control" value="${sessionScope.loginEmail}">
            <label for="commentWriter">작성자</label>
        </div>
        <div class="form-floating">
            <input type="text" id="commentContents" class="form-control" placeholder="댓글입력">
            <label for="commentContents">내용</label>
        </div>
        <button id="comment-write-btn" class="btn btn-secondary" onclick="commentWrite()">댓글작성</button>
    </div>
</div>
</body>
<%--            여기부터 댓글 리스트             --%>
<div class="container mt-5" id="comment-list">
    <table class="table">
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td>
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                    value="${comment.commentCreateDate}"></fmt:formatDate>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>

    const commentWrite = () => {
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        const board = '${board.id}';
        const data = document.getElementById("comment-list")



        $.ajax({
            type: "post",
            url: "comment/save",
            data: {
                commentWriter: writer,
                commentContents: contents,
                boardId: board
            },
            dataType: "json",
            success: function (commentList) {
                console.log(commentList)
                let output = "<table class='table'>";
                // == 넣을시 최종 마지막에 입력한 값만 나옴, += 사용시 누적해서 데이터 쌓임
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                // i=인덱스 같은 역할, 반복변수로 활용
                for (let i in commentList) {
                    output += "<tr>";
                    output += "<td>" + commentList[i].id + "</td>";
                    output += "<td>" + commentList[i].commentWriter + "</td>";
                    output += "<td>" + commentList[i].commentContents + "</td>";
                    // moment: 자바스크립트에서 제공하는 라이브러리 날짜값 사용하는 함수
                    output += "<td>" + moment(commentList[i].commentCreateDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "</tr>"
                    console.log(output);
                }
                output += "</table>";
                console.log(output);

                document.getElementById('comment-list').innerHTML = output;
                // 새로 작성하는 칸을 위해 공란으로 표시
                document.getElementById('commentWriter').value = '';
                document.getElementById('commentContents').value = '';
            },
            error: function() {
                console.log("실패");
            }
        });
    }

    const id = '${board.id}';

    const listFn = () => {
        const page = '${page}';
        location.href = "/board/paging?page=" + page;
    }

    const updateFn = () => {
        location.href = "/board/update?id=" + id;
    }

    const deleteFn = () => {
        location.href ="/board/delete?id=" + id;
        alert("삭제되었습니다")
    }


</script>
</html>
