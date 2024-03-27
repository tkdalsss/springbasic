<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    p{
        color:red;
    }
</style>
<script>
    $(document).ready(function(){
        $('#ptag').text('Replace Text');
        $('p').click(function(){
            alert('ok');
        });
        $('h5').click(function(){
            $(this).text('Click Event');
        })
    });
    // window.onload = function() {
    //     document.getElementById("ptag").innerHTML = 'Replace Text';
    //     document.querySelector('h5').onclick(function(){
    //         this.innerHTML = 'Click Event';
    //     });
    //     document.querySelector('h5').addEventListener(onclick(() => this.innerHTML = 'ClickEvent'));
    // };
</script>
<div class="container">
    <h2>HTML1 Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <div class="fakeimg">Fake Image</div>
    <p id="ptag">Some text..</p>
    <span>Span</span>
    <a href="#">A TAG</a>
<%--    <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>--%>
</div>