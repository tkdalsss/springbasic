<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    // JSON (JavaScript Object Notation)


    // html DOM 이 화면에 표출되고 끝나면 호출됨
    $(function(){
        html2.init();
    });
</script>
<div class="container">
    <h2>HTML2 Page</h2>
    <button type="button" id="btn" class="btn btn-primary">success</button>
    <table class="table table-striped" id="cust_tb">
        <thead>
        <tr>
            <th>ID</th>
            <th>NAME</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
<%--    <div class="row">--%>
<%--        <div class="container col-sm-4">--%>
<%--            --%>
<%--        </div>--%>
<%--        <div class="container col-sm-8">--%>

<%--        </div>--%>
<%--    </div>--%>
</div>
