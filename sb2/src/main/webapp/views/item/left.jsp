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
        <a class="nav-link" href="<c:url value="/item/add"/>">Add</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/item/getList"/>">Get</a>
    </li>
</ul>
