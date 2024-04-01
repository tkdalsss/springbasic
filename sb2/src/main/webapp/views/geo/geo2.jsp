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
    #geo2 > #map {
        width: 500px;
        height: 400px;
        border: 2px solid red;
    }
</style>
<script>
    let geo2 = {
        map: null,
        // initialization
        init: function(){
            this.mapdisplay();
            $('#btn_s').click(() => {
                this.go(37.5447611, 127.0564625);
            });
            $('#btn_b').click(() => {
                this.go(35.1290483, 129.0446982);
            });
            $('#btn_j').click(() => {
                this.go(33.3846216, 126.5534925);
            });
        },
        // map object
        mapdisplay: function(){
            geo2.map = new kakao.maps.Map(
                document.getElementById('map'),
                {
                    center: new kakao.maps.LatLng(37.5447611, 127.0564625), // 지도 중심좌표
                    level: 5 // 지도 확대 레벨
                }
            );

            let marker_position = new kakao.maps.LatLng(37.5447611, 127.0564625);
            this.displayGpsMarker(marker_position);

            // 우측 상단에 map control 추가
            var mapTypeControl = new kakao.maps.MapTypeControl();
            var zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        },
        // 이동
        go: function(lat, lng) {
            let moveLatLon = new kakao.maps.LatLng(lat,lng);
            this.map.panTo(moveLatLon);

            // 마커 새로고침
            this.displayGpsMarker(moveLatLon);
            this.getgeodata(moveLatLon);
        },
        displayGpsMarker:function(locPosition) {
            let marker = new kakao.maps.Marker({
                position: locPosition
            });
            marker.setMap(this.map);
        },
        displayStoreGpsMarker: function(place) {

            let overlay;
            let dataLoc = new kakao.maps.LatLng(place.y, place.x);
            var content = '<div class="wrap" style="position: absolute;left: 0;bottom: 40px;width: 200px;height: 100px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: \'Malgun Gothic\', dotum, \'돋움\', sans-serif;line-height: 1.5;">' +
                '<div class="info" style="width: 286px;height: 140px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;">' +
                '<div class="title" style="padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;">' +
                '<div>' + place.place_name + '</div>' +
                // '<div style="float:right;margin:15px 10px 0 0;font-size:12px;font-color:red;text-align:center">위생등급: <h2>' + hgAsgnLv + '</h2></div>' +
                '</div>' +
                '<div class="body" style="position: relative;overflow: hidden;">' +
                '<div class="desc" style="position: relative;margin: 10px 10px 10px 10px;height: 100px;">' +
                '<div class="ellipsis" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">주소)' + place.address_name + '</div>' +
                '<div class="jibun" style="font-size: 11px;color: #888;margin-top: -2px;">지번)' + place.road_address_name + '</div>' +
                // '<button type="button" onClick="window.location.href = \'' + place.place_url + '\'" style="margin:5px 0px 0px 10px;height:25px;width:150px;">카카오맵에서 보기</button>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';

            let marker = new kakao.maps.Marker({
                position: dataLoc
            });

            // let visible = true;

            marker.setMap(geo2.map);

            kakao.maps.event.addListener(marker, 'mouseover', function(){
                overlay = new kakao.maps.CustomOverlay({
                    content: content,
                    map: geo2.map,
                    position: dataLoc
                });
            });

            kakao.maps.event.addListener(marker, 'mouseout', function(){
                overlay.setMap(null);
            });

            kakao.maps.event.addListener(marker, 'click', function(){
                // window.location.href=place.place_url;
                window.open(place.place_url);
            })
        },
        // 이동하는 지역의 데이터를 가지고 온다
        // loc(s, b, j)
        getgeodata: function(loc) {
            let places = new kakao.maps.services.Places();
            // callback 함수
            let callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    console.log(result);
                    geo2.display(result);
                }
            };
            places.keywordSearch('맛집', callback, {location: loc});
        },
        display: function(geoData) {
            $(geoData).each(function(index, item){
                geo2.displayStoreGpsMarker(item);
            });
        }
    };
    $(function() {
        geo2.init();
    })
</script>
<div class="container" id="geo2">
    <h2>GEO2 Page</h2>
    <button id="btn_s" type="button" class="btn btn-primary">Seoul</button>
    <button id="btn_b" type="button" class="btn btn-primary">Busan</button>
    <button id="btn_j" type="button" class="btn btn-primary">Jeju</button>
    <div id="map"></div>
</div>
