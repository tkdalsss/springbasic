<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>

    <title>Bootstrap 4 Website Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="<c:url value="/js/0327.js"/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <%--kakao map API--%>
<%--    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9e1c6a20d65fd94d833f6984f6e0f2ba"></script>--%>
<%--    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9e1c6a20d65fd94d833f6984f6e0f2ba&libraries=services"></script>--%>

    <%-- highchart --%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>

    <style>
        .container {
            color: black !important;
        }
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>HTML5 & JavaScript</h1>
</div>

<c:choose>
    <c:when test="${id == null}">
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/login" />">LOGIN</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/register" />">REGISTER</a>
            </li>
        </ul>
    </c:when>
    <c:otherwise>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/myPage/${id}" />">${id}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/logout" />">LOGOUT</a>
            </li>
        </ul>
    </c:otherwise>
</c:choose>



<%--Start Nav Bar--%>
<jsp:include page="navbar.jsp"/>
<%--End Nav Bar--%>

<%-- Start Center Area --%>
<div class="container-fluid" style="margin-top:30px">
    <div class="row">
        <div class="col-sm-3">
            <c:choose>
                <c:when test="${left == null}">
                    <jsp:include page="left.jsp" />
                </c:when>
                <c:otherwise>
                    <jsp:include page="${left}.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="col-sm-9">
            <c:choose>
                <c:when test="${center == null}">
                    <jsp:include page="center.jsp"/>
                </c:when>
                <c:otherwise>
                    <jsp:include page="${center}.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<%--End Center Area--%>

<%--Start Bottom Area--%>
<div class="text-center bg-dark" style="margin-bottom:0">
    <p>Footer</p>
</div>
<%--End Bottom Area--%>

</body>
</html>
