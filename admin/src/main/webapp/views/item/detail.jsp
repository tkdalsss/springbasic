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
        init: function() {
            $('#item_update_form > #updateBtn').click(() => {
                let c = confirm("수정하시겠습니까?");
                if (c == true) {
                    this.send();
                }
            });
            $('#item_update_form > #deleteBtn').click(() => {
                let c = confirm("삭제하시겠습니까?");
                if (c == true) {
                    this.delete();
                }
            })
        },
        send: function() {
            $('#item_update_form').attr({
                'method':'post',
                'enctype':'multipart/form-data',
                'action':'<c:url value="/item/updateImpl"/>'
            });
            $('#item_update_form').submit();
        },
        delete: function() {
            let id = $('#id').val();
            $.ajax({
                url:'<c:url value="/item/delete"/>',
                data: {"id": id}
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
                <form id="item_update_form">
                    <div class="form-group">
                        <label for="id">ID:</label>
                        <input type="text" readonly="readonly" value="${item.itemId}" class="form-control" id="id" placeholder="Enter id" name="itemId">

                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text"  value="${item.itemName}"  class="form-control" id="name" placeholder="Enter name" name="itemName">

                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" value="${item.itemPrice}"  class="form-control" id="price" placeholder="Enter name" name="itemPrice">

                    </div>
                    <div class="form-group">
                        <h6>
                            <fmt:parseDate value="${item.regDate}" pattern="%y-%M-%d" var="parsedDateTime" type="both"/>
                            <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${parsedDateTime}"/>
                        </h6>
                        <h3>${item.regDate}</h3>
                        <h3>${item.updateDate}</h3>
                    </div>
                    <div class="form-group">
                        <img src="<c:url value="/img"/>/${item.imgName}">
                        <input type="hidden" name="imgName" value="${item.imgName}"/>
                    </div>
                    <div class="form-group">
                         <label for="newImage">New Image:</label>
                        <input type="file" class="form-control" id="newImage" placeholder="Enter name" name="image"/>
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
