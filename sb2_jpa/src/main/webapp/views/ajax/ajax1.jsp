<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
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
            $('#result').text(data);
        }
    };
    $(function(){
        ajax1.init();
    });
</script>
<div class="container">
    <h2>AJAX1 Page</h2>
    <h3>Server Time</h3>
    <h3 id="result"></h3>
</div>
