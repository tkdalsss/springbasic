<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/3/24
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h5>Cust > Get</h5>
    <h2>Customer List!!!</h2>
<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>PWD</th>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${custs}">
        <tr>
            <td><a href="<c:url value="/cust/detail?id=${c.id}"/>">${c.id}</a></td>
            <td>${c.pwd}</td>
            <td>${c.name}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
