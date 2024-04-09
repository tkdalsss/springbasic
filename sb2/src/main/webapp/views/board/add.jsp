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
    <%--let custAdd = {--%>
    <%--    init: function() {--%>
    <%--        $("#id").keyup(function(){--%>
    <%--            var id = $(this).val();--%>
    <%--            custAdd.send(id);--%>
    <%--        });--%>

    <%--    },--%>
    <%--    send: function(id) {--%>
    <%--        $.ajax({--%>
    <%--            url: '<c:url value="/cust/checkId"/>',--%>
    <%--            data: {'id': id},--%>
    <%--            success: function(data) {--%>
    <%--                console.log(data);--%>
    <%--                custAdd.display(data, id);--%>
    <%--            }--%>
    <%--        })--%>
    <%--    },--%>
    <%--    display: function(data, id) {--%>
    <%--        var result = 'Available';--%>
    <%--        if (data) result = 'Not Available.';--%>
    <%--        $('#id_span').text(id+ ' is ' + result);--%>
    <%--    }--%>
    <%--};--%>

    <%--let check = {--%>
    <%--    init: function() {--%>
    <%--        $('#pwdCheck').keyup(function() {--%>
    <%--            var pwdCheck = $(this).val();--%>
    <%--            check.display(pwdCheck);--%>
    <%--        });--%>
    <%--    },--%>
    <%--    display: function(pwdCheck) {--%>
    <%--        console.log(pwdCheck);--%>
    <%--        var pwd = $('#pwd').val();--%>
    <%--        var result = 'Not Correct!';--%>
    <%--        if (pwd === pwdCheck) {--%>
    <%--            result = 'Correct!';--%>
    <%--        }--%>
    <%--        $('#check_span').text(result);--%>
    <%--    }--%>
    <%--}--%>
    let ajax1 = {
        init:function(){
            // setInterval(function(){
            //     alert('OK');
            // }, 3000);
            setInterval(function(){
                $.ajax({
                    url:'/getServerTime',
                    success:function(data){
                        ajax1.display(data);
                    },
                    error:function(){}
                });
            }, 1000);

        },
        display:function(data){
            // let result = substring()
            $('#currentTime').text(data);
        }
    };

    let boardAdd = {
        init: function() {
            $('#register_form > #registerBtn').click(() => {
                this.send();
            });
        },
        send: function() {
            $('#register_form').attr({
                method: 'POST',
                action: '<c:url value="/board/addImpl"/>'
            });
            $('#register_form').submit();
        }
    }

    $(function(){
        // custAdd.init();
        // ajax1.init();
        boardAdd.init();

        document.querySelector("#registerBtn").disabled = true;

        document.querySelector('#register_form').addEventListener('keyup', () => {
            if ($('#board_title').val() && $('#board_content').val()) {
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
    <h5>Board > Add</h5>
    <h2>Board Add Page!!</h2>
    <form id="register_form">
<%--        <div class="form-group">--%>
<%--            <label for="name">Name</label>--%>
<%--            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">--%>
<%--        </div>--%>
        <div class="form-group">
            <label for="id">작성자 ID</label>
<%--            <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">--%>
            <span id="id">${sessionScope.id}</span>
        </div>
        <div class="form-group">
            <label for="currentTime">현재 시간</label>
            <span id="currentTime"></span>
        </div>
        <div class="form-group">
            <label for="board_title">Title</label>
            <input type="text" class="form-control" id="board_title" placeholder="Enter password" name="boardTitle">
        </div>
        <div class="form-group">
            <label for="board_content">Content</label>
            <textarea class="form-control" rows="10" id="board_content" placeholder="Enter contents" name="boardContent"></textarea>
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
