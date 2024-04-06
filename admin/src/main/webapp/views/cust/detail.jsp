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
            $('#updateBtn').click(() => {
                $('#register_form').attr({
                    'action':'<c:url value="/cust/update"/>',
                    'method': 'POST'
                });
                $('#register_form').submit();
            });
            $('#deleteBtn').click(() => {
                let id = $('#id').val();
                $.ajax({
                    url: '<c:url value="/cust/delete"/>',
                    data: {"id": id}
                });
            })
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
                        <input type="text" readonly="readonly" value="${cust.id}" class="form-control" id="id" placeholder="Enter id" name="id">

                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password"  value="${cust.pwd}"  class="form-control" id="pwd" placeholder="Enter password" name="pwd">

                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" value="${cust.name}"  class="form-control" id="name" placeholder="Enter name" name="name">

                    </div>
                    <button type="button" class="btn btn-primary" id="updateBtn">UPDATE</button>
                    <button type="button" class="btn btn-danger" id="deleteBtn">DELETE</button>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
