<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let ajax3 = {

        init:function(){
            <%--setInterval(function(){--%>
            <%--    $.ajax({--%>
            <%--        url:'<c:url value="/getData"/>',--%>
            <%--        success:function(data){--%>
            <%--            // console.log(data);--%>
            <%--            ajax3.display(data);--%>
            <%--        }--%>
            <%--    })--%>
            <%--}, 1000);--%>
            setInterval(function(){
                $.ajax({
                    url:'<c:url value="/getData"/>',
                    success:function(data){
                        let list = ["<div>"];
                        data.forEach(
                            (item, i) => {
                                if (i%2 === 0) {
                                    list.push(
                                        '<div class="m-1">' +
                                        '<span class="badge badge-primary">' +
                                        (i+1) + ' ' + item +
                                        '</span>'+
                                        '</div>'
                                    )
                                } else {
                                    list.push(
                                        '<div class="m-1">' +
                                        '<span class="badge badge-success">' +
                                        (i+1) + ' ' + item +
                                        '</span>'+
                                        '</div>'
                                    )
                                }
                            }
                        );
                        list.push("</div>");
                        ajax3.display(list);
                    }
                })
            }, 2000);

        },
        display:function(data){
            $('#result').html(data);
        }
    }
    $(function(){
        ajax3.init();
    })
</script>
<div class="container">
    <h2>AJAX3 Page</h2>
    <h5>실시간 검색 순위</h5>
    <div id="result"></div>
</div>
