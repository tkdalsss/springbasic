<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/3/24
  Time: 2:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let detail = {
        init: function () {
        }
    };
    $(function () {
        detail.init();
    })
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="container">
        <h2>Cust Detail</h2>
        <h3>${cust.id}</h3>
        <h3>${cust.pwd}</h3>
        <h3>${cust.name}</h3>
    </div>
</body>
</html>
