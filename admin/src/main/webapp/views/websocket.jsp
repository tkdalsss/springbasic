<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/4/24
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>
<script>
    let websocket = {
        init: function () {

        },
        send: function () {

        }
    };
    $(function () {
        websocket.init();
    })
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Web Socket</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Web Socket</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">

            </div>
        </div>
    </div>

</div>
</body>
</html>
