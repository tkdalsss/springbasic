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
    let item_add = {
        init: function () {
            $('#item_add_form > button').click(() => {
                let c = confirm("추가하시겠습니까?");
                if (c == true) {
                    this.send();
                }
            });
        },
        send: function() {
            $('#item_add_form').attr({
                'action':'<c:url value="/item/addImpl"/>',
                'enctype':'multipart/form-data',
                'method':'POST'
            });
            $('#item_add_form').submit();
        }
    };
    $(function () {
        item_add.init();
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
                <form id="item_add_form">

<%--                    <div class="form-group">--%>
<%--                        <label for="id">ID:</label>--%>
<%--                        <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter name" name="itemName">
                    </div>

                    <div class="form-group">
                        <label for="name">Price:</label>
                        <input type="text" class="form-control" id="price" placeholder="Enter price" name="itemPrice">
                    </div>
                    <div class="form-group">
                        <label for="image">Image:</label>
                        <input type="file" class="form-control" id="image" placeholder="Input Image" name="image">
                    </div>
                    <button type="submit" class="btn btn-primary">Add</button>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
