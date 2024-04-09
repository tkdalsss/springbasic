<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let register = {
        url: '',
        init:function(url) {
            this.url = url;
            $('#register_form #btn_id_check').click(() => {
                let id = $('#id').val();
                if(id == '' || id == null) {
                    alert('ID를 입력하세요');
                    return;
                }

                $.ajax({
                    url: '<c:url value="/registerIdCheck"/>',
                    data: {'id': id},
                    success: (result) => {
                        let msg = '사용 가능합니다.';
                        if (result == '0') {
                            msg = '사용 불가능합니다.';
                        }
                        $('#check_msg').html(msg);
                    }
                })
            });

            $('#register_form > #btn_register').click(function() {

            });
        }
    }
    $(function(){
        reg.init("<c:url value="/registerImpl"/>");
        register.init();
    });
</script>
<div class="container">
    <h2>Register Page</h2>
    <form id="register_form">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
            <span id="check_msg"></span>
            <button id="btn_id_check" type="button" class="btn btn-warning">CHECK ID</button>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember"> Remember me
            </label>
        </div>
        <button id="btn_register" type="submit" class="btn btn-primary">Register</button>
    </form>
</div>