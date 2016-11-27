<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-body.jspf"%>
<script type="text/javascript">
	function fn_lendplaceApplyfor() {
		if (isLoginCheck("${sessionScope.session_m_email}")) {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/lendplace/applyform' />");
			cs.addParam("l_no", '${data.L_NO}');
			cs.submit();
		}
	}
</script>
</head>


<body>

	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>장소 상세보기</h1>
				</div>
				<div class="col-md-6">
					<ul class="breadcrumb">
						<li><a href="<c:url value='/main'/>">홈</a></li>
						<li><a href="<c:url value='/lendplace'/>">장소</a></li>
						<li>장소 상세보기</li>
					</ul>

				</div>
			</div>
		</div>
	</div>

	<div id="content">
		<div class="container">

			<div class="row portfolio-project">

				<section>
					<div class="col-sm-8">
						<div class="project owl-carousel">
							<div class="item">
								<img src="${data.L_IMAGE1 }" alt="" class="img-responsive">
							</div>
							<div class="item">
								<img class="img-responsive" src="${data.L_IMAGE2 }" alt="">
							</div>
							<div class="item">
								<img class="img-responsive" src="${data.L_IMAGE3 }" alt="">
							</div>
							<div class="item">
								<img class="img-responsive" src="${data.L_IMAGE4 }" alt="">
							</div>
						</div>
						<!-- /.project owl-slider -->

					</div>

					<div class="col-sm-4">
						<div class="project-more">
							<h4>장소명</h4>
							<p>${data.L_TITLE }</p>
							<h4>주소</h4>
							<p>${data.L_ADDR }</p>
							<h4>수용인원</h4>
							<p>${data.L_PNUM }명</p>
							<h4>대관시간</h4>
							<p>${data.L_SDATE} ~ ${data.L_EDATE}</p>
						</div>
						<p>
							<button type="button" class="btn btn-template-main" onclick="location.href='<c:url value="/lendplace?currentPageNo=${currentPageNo}"/>'">
								<i class="fa fa-list-ul"></i> 목록보기
							</button>
							<button type="submit" class="btn btn-template-main" onclick="fn_lendplaceApplyfor()">
								<i class="fa fa-check"></i> 장소신청
							</button>
						</p>
					</div>

				</section>


				<section>

					<div class="col-sm-12">

						<div class="heading">
							<h3>장소정보</h3>
						</div>

						<p>${data.L_CONTENT }</p>

					</div>
				</section>


			</div>


			<section>
				<div class="row portfolio">

					<div class="col-md-12">
						<div class="heading">
							<h3>지도보기</h3>
						</div>
						<div id="map" style="width: 100%; height: 350px;" class="md_contet_map"></div>
						<br> <b>※&nbsp;${data.L_ADDR }&nbsp;(${data.L_TITLE })</b> <br>

						<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services" onerror="alertify.log('지도 로드중 에러!')"></script>
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
					geocoder.addr2coord('${data.L_ADDR }', function(status, result) {

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
							content: '<div style="width:150px;text-align:center;padding:6px 0;">${data.L_TITLE }</div>'
						});
						infowindow.open(map, marker);

						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
					} 
					});



					</script>
					</div>


				</div>
			</section>

			<section>
				<div class="row portfolio">

					<div class="col-md-12">
						<div class="heading">
							<h3>모임장소 추천안내</h3>
						</div>
						<p>
							* TEP에서 소규모의 미팅이나 스터디, 세미나 그리고 대규모의 강연까지 가능한 모임장소를 추천해 드립니다.<br> * 모임의 목적에 맞는 규모와 장소, 시간, 편의시설, 지원장비 등을 꼼꼼히 확인하시고 목록에서 장소를 신청해 주세요.<br>
						</p>
					</div>


				</div>
			</section>

		</div>
		<!-- /.container -->


	</div>
	<!-- /#content -->



</body>

</html>