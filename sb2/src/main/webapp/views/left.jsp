<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Buttons</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/css/sb-admin-2.min.css"/>" rel="stylesheet">
</head>
<script>
    let left = {
      init: function() {
          $('#btn_board_add').click(() => {
              if ('${sessionScope.id}' == '' || '${sessionScope.id}' == null) {
                  $('#btn_board_add').removeAttr('href');
                  alert('로그인 하셔야 합니다.');
              }
          });
      }
    };
    $(function() {
        left.init();
    })
</script>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>Components</span>
        </a>
        <div id="collapseOne" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Custom Components:</h6>
                <a class="collapse-item" href="<c:url value="/html"/>">HTML</a>
                <a class="collapse-item" href="<c:url value="/jquery"/>">jQuery</a>
                <a class="collapse-item" href="<c:url value="/ajax"/>">Ajax</a>
                <a class="collapse-item" href="<c:url value="/geo"/>">Geo</a>
                <a class="collapse-item" href="<c:url value="/chart"/>">Chart</a>
            </div>
        </div>
    </li>
    <c:choose>
        <c:when test="${id != null}">
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Cust / Item</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="<c:url value="/cust/add"/>">Add Cust</a>
                        <a class="collapse-item" href="<c:url value="/cust/allpage?pageNo=1"/>">Get Cust List</a>
                    </div>
                </div>
            </li>
        </c:when>
    </c:choose>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>Board</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Board Components:</h6>
                <a id="btn_board_add" class="collapse-item" href="<c:url value="/board/add"/>">Board Add</a>
                <a class="collapse-item" href="<c:url value="/board/get"/>">Board Get</a>
                <a class="collapse-item" href="<c:url value="/board/allpage?pageNo=1"/>">Board All Get</a>
            </div>
        </div>
    </li>
</ul>