<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #geo3 > #map {
        width: 100%;
        height: 400px;
        border: 2px solid red;
    }
</style>
<script>
    let geo3 = {
        map:null,
        init: function(){
            geo3.map = new kakao.maps.Map(
                document.getElementById('map'),
                {
                    center: new kakao.maps.LatLng(37.5447611, 127.0564625), // 지도 중심좌표
                    level: 8 // 지도 확대 레벨
                }
            );

            let marker_position = new kakao.maps.LatLng(37.5447611, 127.0564625);
            let marker = new kakao.maps.Marker({
                position: marker_position
            });
            marker.setMap(geo3.map);
            geo3.getShop();
        },
        getShop: function(){
            // $.ajax()
            $.ajax({
               url: '<c:url value="/geo/getdata"/>',
               success: function(datas){
                   geo3.display(datas);
               }
            });
            // lat, lng, title, img,
            // let datas = [
            //     {'lat': 37.5547611, 'lng': 127.0654625, 'title': '순대국', 'img':'a.jpg', 'target':100},
            //     {'lat': 37.5347611, 'lng': 127.0654625, 'title': '파스타', 'img':'b.jpg', 'target':101},
            //     {'lat': 37.5147611, 'lng': 127.0654625, 'title': '햄버거', 'img':'c.jpg', 'target':102}
            // ];
            // geo3.display(datas);
        },
        display: function(datas){
            let imgSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            let imgSize = new kakao.maps.Size(30, 30);
            $(datas).each(function(index, item){
                let markerImage = new kakao.maps.MarkerImage(imgSrc, imgSize);
                let markerPosition = new kakao.maps.LatLng(item.lat, item.lng);

                // marker 생성
                var marker = new kakao.maps.Marker({
                    position: markerPosition,
                    map: geo3.map,
                    title: item.title,
                    image: markerImage
                });

                // 로열티 어필 중요 -> 회사에 왜가고싶어하는지 , 질문이 많이 오지 않는다면 어떻게 자신을 어필할지

                // info window 생성
                var infoContent = '<h3>' + item.title + '</h3>';
                infoContent += '<img style="width:50px;" src="<c:url value="/img/'+item.img+'"/>"/>';

                var infowindow = new kakao.maps.InfoWindow({
                    content: infoContent,
                    position: markerPosition
                })

                infowindow.open(geo3.map, marker);

                // event
                kakao.maps.event.addListener(marker, 'mouseover', mouseoverHandler(marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', mouseoutHandler(marker, infowindow));
                kakao.maps.event.addListener(marker, 'click', mouseclickHandler(item.id));

                function mouseoverHandler(marker, infowindow) {
                    infowindow.open(geo3.map, marker);
                    // return function(){
                    //     infowindow.open(geo3.map, marker);
                    // };
                }

                function mouseoutHandler(marker, infowindow){
                    return function(){
                        infowindow.close();
                    };
                }

                function mouseclickHandler(target) {
                    return function(){
                        location.href = '<c:url value="/geo/shopdetail?shopid='+target+'"/>';
                    };
                }

            });
        }
    }
    $(function(){
        geo3.init();
    })
</script>
<div class="container" id="geo3">
    <h2>GEO3 Page</h2>
    <div id="map"></div>
</div>
