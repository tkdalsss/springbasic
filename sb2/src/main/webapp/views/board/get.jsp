<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/3/24
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let get = {
        init: function () {
        }
    };
    $(function () {
        get.init();
    })
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
<h5>Board > Get</h5>
    <h2>Board List!!!</h2>
<table class="table table-striped" id="board_table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Register Date</th>
        <th>조회수</th>
    </tr>
    </thead>
    <tbody>
<%--    <tr>--%>
<%--        <td>aa</td>--%>
<%--        <td>bb</td>--%>
<%--        <td>cc</td>--%>
<%--    </tr>--%>
    <c:forEach var="b" items="${boardList}">
        <tr>
            <td><a href="<c:url value="/board/detail?id=${b.boardId}"/>">${b.boardId}</a></td>
            <td>${b.boardTitle}</td>
<%--            <td>${b.boardRegdate}</td>--%>
            <td>
                <fmt:parseDate value="${b.boardRegdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both"/>
                <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${parsedDateTime}"/>
            </td>
            <td>${b.boardCnt}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
