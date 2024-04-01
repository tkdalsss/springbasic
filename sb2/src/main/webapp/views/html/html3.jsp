<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <h2>HTML3 Page</h2>
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
                <td><a href="<c:url value="/html/html3/get?id=${c.id}"/>">${c.id}</a></td>
                <td>${c.pwd}</td>
                <td>${c.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
