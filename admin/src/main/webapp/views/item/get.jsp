<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/28/24
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    #dataTable img {
        width: 100px !important;
    }
</style>
<body>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Image</th>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Reg Date</th>
                        <th>Update Date</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Image</th>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Reg Date</th>
                        <th>Update Date</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="item" items="${itemList}">
                        <tr>
                            <td>
                                <a href="<c:url value="/item/detail"/>?id=${item.itemId}">
                                    <img src="<c:url value="/img/"/>${item.imgName}"/>
                                </a>
                            </td>
                            <td>${item.itemId}</td>
                            <td>${item.itemName}</td>
                            <td>
                                <fmt:formatNumber type="number" pattern="###,###원" value="${item.itemPrice}" />
                            </td>
                            <td>
                                    ${item.regDate}
<%--                                <fmt:formatDate value="${item.regDate}" pattern="yyyy년MM월dd일" />--%>
                            </td>
                            <td>
                                    ${item.updateDate}
<%--                                <fmt:formatDate value="${item.updateDate}" pattern="yyyy년MM월dd일" />--%>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>
