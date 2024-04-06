<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/3/24
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let center = {
        init: function () {
            $.ajax({
                url: '<c:url value="/getAddr/${cust.id}"/>',
                success: function(data) {
                    center.display(data);
                }
            })
        },
        display(data){
            console.log(data);
            let table = '<table>';
            for (let i = 0; i < data.length; i++) {
                table += '<tr>' +
                    '<td>' + data[i].addrId + '</td>' +
                    '<td>' + data[i].addrName + '</td>' +
                    '<td>' + data[i].addrDetail + '</td>' +
                    '</tr>';
            }
            table += '</table>';
            $('#addrList').html(table);
        }
    };
    // let addCustAddr = {
    //     init: function() {
    //
    //     }
    // }
    $(function () {
        console.log("TEST");
        center.init();

        $('#registerAddr').click(function() {
            var addressName = $('#addrName').val();
            var addressDetail = $('#addrDetail').val();
            var custId = "${cust.id}";

            let address = {
                addrId : 0,
                addrName : addressName,
                addrDetail : addressDetail,
                custId : custId
            };
            // console.log(JSON.stringify(address));

            $.ajax({
                type: 'POST',
                url:'<c:url value="/myPage/addAddr"/>',
                contentType: 'application/json',
                data: JSON.stringify(address),
                success: function(data, request) {
                    console.log(request.getResponseHeader());
                    location.reload(true);
                }
            });

        })
    })
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="container">
        <h2>${cust.id}님의 상세페이지입니다.</h2>
        <h2>이름 : ${cust.name}</h2>
        <div class="col-sm-4">
            주소록 <button type="button" data-toggle="modal" data-target="#myModal"
                        class="btn btn-primary" id="addAddr">추가</button>
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- modal header -->
                        <div class="modal-header">
                            <h4 class="modal-title">주소 추가</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- modal body -->
                        <div class="modal-body">
                            ADDRESS NAME <input type="text" class="form-control" id="addrName" placeholder="Enter ID" name="addrName">
                            ADDRESS DETAIL <input type="text" class="form-control" id="addrDetail" placeholder="Enter ID" name="addrDetail">
                        </div>
                        <!-- modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" data-dismiss="modal" id="registerAddr">주소 등록</button>
                        </div>
                    </div>
                </div>
            </div>
<%--            <h2>주소록 목록</h2>--%>
            <div id="addrList"></div>
        </div>

    </div>
</body>
</html>
