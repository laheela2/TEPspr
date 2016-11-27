<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>위치로 보는 모임</h1>
				</div>
				<div class="col-md-6">
					<ul class="breadcrumb">
						<li><a href="<c:url value="/meetings"/>">모임</a></li>
						<li>위치로 보는 모임</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading">
						<h3>
							위치로 모임을 검색해 보세요.<i class="fa fa-heart"></i>
						</h3>
					</div>
				</div>
			</div>

			<form role="search" name="search_form" action="<c:url value='/location'/>" method="post" onsubmit="searchSubmit();">
				<div class="input-group">
					<input type="text" class="form-control" id="searchbox" name="searchWord" value="${searchWord }" placeholder="위치명으로  모임을 검색해보세요.^^   ex) 강남, 사당 등">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-template-main">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>

			<div class="row">
				<div class="col-md-12">
					<div id="map" style="width: 100%; height: 600px;"></div>
					<br />
				</div>
			</div>

		</div>
	</div>



	<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
		
		//지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();
		
		//지도에 컨트롤을 추가해야 지도위에 표시됩니다
		//daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		
		//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		//주소로 좌표를 검색합니다
		geocoder.addr2coord('${data.MT_ADDR}', function(status, result) {
		
		// 정상적으로 검색이 완료됐으면 
		 if (status === daum.maps.services.Status.OK) {
		
		    var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		
		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new daum.maps.Marker({
		        map: map,
		        position: coords
		    });
		
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new daum.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:6px 0;">${data.MT_ADDR}</div>'
		    });
		    infowindow.open(map, marker);
		
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
		} 
		});
	</script>


</body>
</html>