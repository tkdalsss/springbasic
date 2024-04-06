<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/4/24
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let detail = {
        init: function () {
            $('#register_form > button').click(() => {
                $('#register_form').attr({
                    'action':'<c:url value="/cust/addImpl"/>',
                    'method': 'POST'
                });
                $('#register_form').submit();
            });
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
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form id="register_form">

                    <div class="form-group">
                        <label for="id">ID:</label>
                        <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
