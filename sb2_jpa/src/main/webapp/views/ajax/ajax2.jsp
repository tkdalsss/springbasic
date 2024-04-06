<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    let ajax2 = {
        init:function(){
            // 아이디 입력이 끝나면 이벤트 발생
            $('#id').keyup(function(){
                var id = $(this).val();
                ajax2.send(id);
            });
        },
        send:function(id){
            $.ajax({
                url:'<c:url value="/checkid"/>',
                data:{'id':id},
                success:function(data){
                    ajax2.display(data, id);
                }
            });
        },
        display:function(data, id){
            var result = 'Available';
            if (data.trim() == '0'){
                result = 'Not Available.';
            }
            $('#id_span').text(id + ' is ' + result);
        }
    };
    $(function(){
        ajax2.init();
    });
</script>
<div class="container">
    <h2>AJAX2 Page</h2>
    <form id="login_form">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
            <span id="id_span"></span>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
            <span id="pwd_span"></span>
        </div>
        <button type="submit" class="btn btn-primary" id="login">LOGIN</button>
    </form>
</div>
