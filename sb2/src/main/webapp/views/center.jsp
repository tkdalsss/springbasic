<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let center = {
        init: function() {
            $.ajax({
                url: '<c:url value="/wh"/>',
                success: (result) => {
                    let text = result.response.body.items.item[0].wfSv.split('○ ');
                    // console.log(result);
                    let weather = '<div>';
                    text.forEach((item, i) => {
                        weather += '<h6>' +item + '</h6>';
                    })
                    weather += '</div>';
                    $('#wh').html(weather);
                }
            })
        }
    }
    $(function(){
        center.init();
    })
</script>
<div class="container">
    <h2>Center Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
<%--    <div class="fakeimg">Fake Image</div>--%>
    <table class="table table-striped" id="board_table">
        <thead>
        <tr>
            <th>Rank</th>
            <th>ID</th>
            <th>Title</th>
            <th>Register Date</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${ranks}">
            <tr>
                <td></td>
                <td><a href="<c:url value="/board/detail?id=${b.boardId}"/>">${b.boardId}</a></td>
                <td>${b.boardTitle}</td>
                    <%--            <td>${b.boardRegdate}</td>--%>
                <td>
                    <fmt:parseDate value="${b.boardRegdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both"/>
                    <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${parsedDateTime}"/>
                </td>
                <td>${b.boardCnt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p>Weather...</p>
    <p id="wh"></p>
</div>
