<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    #geo1 > #map {
        width:100%;
        height:350px;
        border: 2px solid red;
    }
</style>
<script>
    let geo1 = {
        map:null,
        // lat:37.5448181,
        // lng:127.0565111,
        lat:0,
        lng:0,
        init: function(){
            // GPS 기반으로 위도 경도 설정하기
            if (navigator.geolocation){
                navigator.geolocation.getCurrentPosition(function(position) {
                    geo1.lat = position.coords.latitude;
                    geo1.lng = position.coords.longitude;
                    geo1.map = new kakao.maps.Map(
                        document.getElementById('map'),
                        {
                            center: new kakao.maps.LatLng(geo1.lat, geo1.lng), // 지도 중심좌표
                            level: 4 // 지도 확대 레벨
                        }
                    );
                    geo1.display();
                });
            } else {

            }
        },
        insertControl: function(){
            // 지도 컨트롤 추가
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            geo1.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            geo1.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        },
        markerInfo: function() {
            // 지도 마커 표시
            // 마커가 표시될 위치입니다
            var markerPosition = new kakao.maps.LatLng(geo1.lat, geo1.lng);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: this.map,
                position: markerPosition
            });

            var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                iwRemoveable = true; //인포윈도우 표시 위치입니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent,
                removable: iwRemoveable
            });

            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(this.map, marker);

            // 마커에 마우스오버 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function () {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(geo1.map, marker);
            });

            // 마커에 마우스아웃 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function () {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });
        },
        display: function(){

            geo1.insertControl();
            geo1.markerInfo();

        }
    }
    $(function(){
        geo1.init();
    })
</script>
<div class="container" id="geo1">
    <h2>Geo1 Page</h2>
    <div id="map"></div>
</div>
