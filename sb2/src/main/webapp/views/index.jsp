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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

    <%-- Web Socket --%>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>

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
<style>
    #msgDiv {
        /*background-color: #2a96a5;*/
        /*width: 100px;*/
        color: black;
    }
    #alert {
        display: flex;
        align-items: center;
    }
</style>
<script>
    let websocket = {
        stompClient:null,
        messages: [],
        init:function() {
            let sid = '${sessionScope.id}';
            let socket = new SockJS('http://192.168.219.155:81/ws');
            let blank = "";
            // websocket.messages = sessionStorage.getItem("messages");
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                // websocket.setConnected(true);
                console.log('Connected: ' + frame);
                this.subscribe('/send', function(msg) {
                    console.log(msg);
                    blank = '공지사항 : ' + JSON.parse(msg.body).content1;
                    $('#msgDiv').text(blank);
                    websocket.messages.push(msg);
                    $('#msgCnt').text(websocket.messages.length);
                    // session 에 저장하고
                    websocket.display();
                });
                this.subscribe('/send/'+ sid, function(msg) {
                    $("#me").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1+ "</h4>");
                    websocket.messages.push(msg);
                    $('#msgCnt').text(websocket.messages.length);
                    // session 에 저장하고
                    websocket.display();
                });
                this.subscribe('/send/to/'+sid, function(msg) {
                    blank = JSON.parse(msg.body).sendid + "님이 " + JSON.parse(msg.body).receiveid + "님에게 : " +
                        JSON.parse(msg.body).content1;
                    $('#msgDiv').text(blank);
                    websocket.messages.push(msg);
                    $('#msgCnt').text(websocket.messages.length);
                    // session 에 저장하고
                    websocket.display();
                });
            });
            // sessionStorage.setItem("messages", websocket.messages);
        },
        display: function() {
            let result = '';
            websocket.messages.forEach((item) => {
                let time = JSON.parse(item.body).time;
                let content = JSON.parse(item.body).receiveid === null ? "전체 공지사항 : " :
                    JSON.parse(item.body).sendid + "님이 " + JSON.parse(item.body).receiveid + "에게 : ";
                result += '<a class="dropdown-item d-flex align-items-center" href="#">' +
                        '<div class="dropdown-list-image mr-3">' +
                        '<div class="status-indicator bg-success"></div>' +
                        '</div>' +
                        '<div class="font-weight-bold">' +
                        '<div class="text-truncate">' + content + JSON.parse(item.body).content1 +
                        '<div class="small text-gray-500">' +
                        time.split("T")[0] + " " + time.split("T")[1].split(".")[0] + // 시간
                        '</div>' +
                        '</div>' + '</a>';
            });
            $('#msgs').html(result);
        }
    }
    $(function() {
        websocket.init();
    })
</script>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h1><spring:message code="site.title" arguments="aa,aa"/></h1>
    <h5><spring:message code="site.phone"/></h5>
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
            <li id="alert" class="col-sm-7">
                <MARQUEE scrollamount="7" id="msgDiv"></MARQUEE>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/myPage/${id}" />">${id}</a>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-envelope fa-fw"></i>
                    <!-- Counter - Messages -->
                    <span class="badge badge-danger badge-counter" id="msgCnt">0</span>
                </a>
                <!-- Dropdown - Messages -->
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="messagesDropdown">
                    <h6 class="dropdown-header">
                        Message Center
                    </h6>
                    <div id="msgs"></div>
                    <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/logout" />">LOGOUT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/chat" />">Chat</a>
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
