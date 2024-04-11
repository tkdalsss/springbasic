<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let center = {
        init: function() {
            $.ajax({
                url: '<c:url value="/owm"/>',
                data: {'loc': 1835848},
                success: (result) => {
                    // let text = result.response.body.items.item[0].wfSv.split('○ ');
                    // console.log(result);
                    let weather = '<div>' +
                        '<h4>' + result.name + "-" + result.sys.country + " (" + result.coord.lat + "/" + result.coord.lon + ")" + '</h4>' +
                        '<h5>' + "온도(최저/최고) - " + result.main.temp_min + "/" + result.main.temp_max + '</h5>' +
                        '<h5>' + "습도 - " + result.main.humidity + '</h5>' +
                        '<h5>' + result.weather[0].description + '</h5>'+
                        '<h5>' + "바람 - " + result.wind.deg + "/" + result.wind.speed + '</h5>'
                        '</div>';
                    // weather += '</div>';
                    console.log(result);
                    $('#wh').html(weather);
                }
            })
        }
    }
    $(function(){
        center.init();
    })
</script>
<div class="container">
    <h2>OpenWeatherMap</h2>

    <p id="wh"></p>
</div>
