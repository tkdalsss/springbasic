<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/3/24
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    // $("#register_form > button").click(function() {
    //
    // })
    let custAdd = {
        init: function() {
            $("#id").keyup(function(){
                var id = $(this).val();
                custAdd.send(id);
            });

        },
        send: function(id) {
            $.ajax({
                url: '<c:url value="/cust/checkId"/>',
                data: {'id': id},
                success: function(data) {
                    console.log(data);
                    custAdd.display(data, id);
                }
            })
        },
        display: function(data, id) {
            var result = 'Available';
            if (data) result = 'Not Available.';
            $('#id_span').text(id+ ' is ' + result);
        }
    };

    let check = {
        init: function() {
            $('#pwdCheck').keyup(function() {
                var pwdCheck = $(this).val();
                check.display(pwdCheck);
            });
        },
        display: function(pwdCheck) {
            console.log(pwdCheck);
            var pwd = $('#pwd').val();
            var result = 'Not Correct!';
            if (pwd === pwdCheck) {
                result = 'Correct!';
            }
            $('#check_span').text(result);
        }
    }

    $(function(){
        custAdd.init();

        document.querySelector("#registerBtn").disabled = true;

        document.querySelector('#register_form').addEventListener('keyup', () => {
            if ($('#id').val() && $('#pwd').val()) {
                document.querySelector('#registerBtn').disabled = false;
            }
        })
    });
</script>
<body>
<div class="container">
<%--    <div class="container">--%>
<%--        <button class="btn btn-primary">Cust</button>--%>
<%--        <button class="btn btn-success">Add</button>--%>
<%--    </div>--%>
    <h5>Cust > Add</h5>
    <h2>Customer Register Page!!</h2>
    <form id="register_form" action="<c:url value="/cust/addImpl"/>" method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
        </div>
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
            <span id="id_span"></span>
        </div>
        <div class="form-group">
            <label for="pwd">Password</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
<%--        <div class="form-group">--%>
<%--            <label for="pwdCheck">Password Check:</label>--%>
<%--            <input type="password" class="form-control" id="pwdCheck" placeholder="Enter password" name="pwdCheck">--%>
<%--            <span id="check_span"></span>--%>
<%--        </div>--%>
<%--        <div class="form-group form-check">--%>
<%--            <label class="form-check-label">--%>
<%--                <input class="form-check-input" type="checkbox" name="remember"> Remember me--%>
<%--            </label>--%>
<%--        </div>--%>
        <button type="submit" class="btn btn-primary" id="registerBtn">Register</button>
    </form>
</div>
</body>
</html>
