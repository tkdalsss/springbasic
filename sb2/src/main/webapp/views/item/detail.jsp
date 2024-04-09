<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/3/24
  Time: 2:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let detail = {
        init: function () {
            let money = $('#item_price').text();
            let money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $('#item_price').text(money2);
        }
    };
    $(function () {
        detail.init();
    })
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h2>Item Detail Page</h2>
    <p>Item ID: ${item.itemId}</p>
    <div class="card" style="width:400px">
        <img class="card-img-top" src="<c:url value='/img/'/>${item.imgName}" alt="Card image" style="width:100%">
        <div class="card-body">
            <h4 class="card-title">${item.itemName}</h4>
            <span id="item_price">${item.itemPrice}</span><span>원</span>
            <br><br>
            <p class="card-text">Register Date: ${item.regDate}</p>
            <p class="card-text">Update Date: ${item.updateDate}</p>
            <a href="#" class="btn btn-primary">Add To Cart</a>
        </div>
    </div>
</div>
</body>
</html>
