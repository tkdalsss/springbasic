<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/28/24
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .form_bg {
        background: yellow !important;
    }
</style>
<script>
    let jquery1 = {
        init:function(){
            // fnOver, fnOut
            $('h2').hover(function(){
                $(this).text('in');
            }, function(){
                $(this).text('out');
            });

            $('#id').focus(function(){
                // alert('aa');
                $(this).addClass('form_bg');
            });
            $('#id').blur(function(){
                $(this).removeClass('form_bg');
            });
            $('#id').keyup(function(){
                let id = $(this).val();
                $('#pwd').val(id);
            });

            $('#login_form > button').click(function(){
                $('.fakeimg').empty();
            });
        }
    }

    $(function(){
        jquery1.init();
    });
</script>
<div class="container">
    <h2>jQuery1 Page</h2>
    <div class="fakeimg">Fake Image</div>
    <form id="login_form">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
            <span id="id_span"></span>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="text" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
            <span id="pwd_span"></span>
        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember"> Remember me
            </label>
        </div>
        <button type="submit" class="btn btn-primary">LOGIN</button>
    </form>
</div>