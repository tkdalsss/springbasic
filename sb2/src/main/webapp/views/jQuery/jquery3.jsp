<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/28/24
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let jquery3 = {
        init:function(){
            $('#btn_get').click(function(){
                $.ajax({
                    url:'<c:url value="/getData"/>',
                    success:function(data){
                        alert(data);
                    }
                })
            });
        }
    }
    $(function(){
       jquery3.init();
    });
</script>
<div class="container">
    <h2>jQuery3 Page</h2>
    <button id="btn_get" type="button" class="btn btn-primary">GET</button>
</div>