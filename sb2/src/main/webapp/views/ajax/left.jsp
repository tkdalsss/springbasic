<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="nav nav-pills flex-column">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/ajax/ajax1"/>">AJAX1</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/ajax/ajax2"/>">AJAX2</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/ajax/ajax3"/>">AJAX3</a>
    </li>
</ul>
