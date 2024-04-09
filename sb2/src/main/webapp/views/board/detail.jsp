<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/4/24
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let detail = {
        init: function() {
            $('#board_update_form > #updateBtn').click(() => {
                let c = confirm("수정하시겠습니까?");
                if (c == true) {
                    this.send();
                }
            });
            $('#board_update_form > #deleteBtn').click(() => {
                let c = confirm("삭제하시겠습니까?");
                if (c == true) {
                    this.delete();
                }
            })
        },
        send: function() {
            $('#board_update_form').attr({
                'method':'post',
                'enctype':'multipart/form-data',
                'action':'<c:url value="/board/updateImpl"/>'
            });
            $('#board_update_form').submit();
        },
        delete: function() {
            let id = $('#id').val();
            $.ajax({
                url:'<c:url value="/board/delete"/>',
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
    <h1 class="h3 mb-2 text-gray-800">Board Detail</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3" style="display:flex">

            <div class="col-sm-4">
                <h5 class="m-0 font-weight-bold text-primary">Board Detail Page</h5>
            </div>
            <div class="col-sm-2">
                <p class="m-0 font-weight-bold text-black-50">Board ID - ${board.boardId}</p>
            </div>
            <c:choose>
                <c:when test="${board.custId == sessionScope.id}">
                    <div class="col-sm-3">
                        <p>작성일자</p>
                        <p class="m-0 font-weight-bold text-success">
                            <fmt:parseDate value="${board.boardRegdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both"/>
                            <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${parsedDateTime}"/>
                        </p>
                    </div>
                    <div class="col-sm-3">
                        <p>최종수정일자</p>
                        <p class="m-0 font-weight-bold text-success">
                            <fmt:parseDate value="${board.boardUpdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both"/>
                            <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${parsedDateTime}"/>
                        </p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-sm-3">
                        <p class="m-0 font-weight-bold text-success">
                            작성일자 : <fmt:parseDate value="${board.boardRegdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both"/>
                            <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${parsedDateTime}"/>
                        </p>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form id="board_update_form">
                    <div class="form-group">
                        <label for="id">Board ID</label>
                        <input type="text" readonly="readonly" value="${board.boardId}" class="form-control" id="id" placeholder="Enter id" name="boardId">

                    </div>
                    <div class="form-group">
                        <label for="name">Title</label>
                        <input type="text"  value="${board.boardTitle}"  class="form-control" id="name" placeholder="Enter name" name="boardTitle">

                    </div>
                    <div class="form-group">
                        <label for="price">Content</label>
                        <input type="text" value="${board.boardContent}"  class="form-control" id="price" placeholder="Enter name" name="itemPrice">

                    </div>
                    <input type="hidden" name="boardId" value="${board.boardId}">

<%--                    <div class="form-group">--%>
<%--                        <img src="<c:url value="/img"/>/${item.imgName}">--%>
<%--                        <input type="hidden" name="imgName" value="${item.imgName}"/>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                         <label for="newImage">New Image:</label>--%>
<%--                        <input type="file" class="form-control" id="newImage" placeholder="Enter name" name="image"/>--%>
<%--                    </div>--%>
                    <c:choose>
                        <c:when test="${board.custId == sessionScope.id}">
                            <button type="button" class="btn btn-primary" id="updateBtn">UPDATE</button>
                            <button type="button" class="btn btn-danger" id="deleteBtn">DELETE</button>
                        </c:when>
                    </c:choose>

                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
