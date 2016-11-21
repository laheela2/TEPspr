<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/include/common-header.jspf"%>
<script src="<c:url value="/resources/js/meetings-write.js"/>"></script>
<script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
<script type="text/javascript">
	$(function() {
		$('#navigation').find('#nav_meetings').addClass('active');
		CKEDITOR.replace('mt_content');
		document.meetingsWriteForm.mt_category.value='${meet.mt_category}';
	});
</script>
</head>

<body>

	<div id="heading-breadcrumbs">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-6">
	                <h1>모임 개설하기</h1>
	            </div>
	            <div class="col-md-6">
	                <ul class="breadcrumb">
	                    <li><a href="<c:url value="/main"/>">홈</a></li>
	                    <li>모임 개설하기</li>
	                </ul>
	
	            </div>
	        </div>
	    </div>
	</div>

	<div id="content">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<spring:hasBindErrors name="meet"/>
						<form name="meetingsWriteForm" action="<c:url value="/meetings/write"/>" method="post" enctype="multipart/form-data" theme="simple">
						
	                        <div class="form-group">
	                        	<div class="col-md-6">
	                        		<div class="col-md-12">
			                            <label>카테고리</label>&nbsp;&nbsp;&nbsp;
			                            <form:errors cssClass="text-danger bg-danger small" path="meet.mt_category"/>
		                            </div>
		                            <p class="col-md-12">
										<select name="mt_category" class="form-control">
											<option value="교육">교육</option>
											<option value="강연">강연</option>
											<option value="세미나/컨퍼런스">세미나/컨퍼런스</option>
											<option value="문화/예술">문화/예술</option>
											<option value="방송/연예">방송/연예</option>
											<option value="취미활동">취미활동</option>
											<option value="소모임/친목행사">소모임/친목행사</option>
											<option value="공모전">공모전</option>
											<option value="전시/박람회">전시/박람회</option>
											<option value="패션/뷰티">패션/뷰티</option>
											<option value="이벤트/파티">이벤트/파티</option>
											<option value="여행">여행</option>
											<option value="후원금모금">후원금모금</option>
											<option value="기타">기타</option>
										</select>
									</p>
	                        	</div>
	                        	<div class="col-md-6">
	                        		<div class="col-md-12">
			                            <label>모임이름</label>&nbsp;&nbsp;&nbsp;
			                            <form:errors cssClass="text-danger bg-danger small" path="meet.mt_title"/>
		                            </div>
		                            <p class="col-md-12"><input type="text" class="form-control" name="mt_title" maxlength="32" value="${meet.mt_title}"></p>
	                        	</div>
	                        </div>
	                        
							<div class="form-group">
								<div class="col-md-6">
									<div class="col-md-12">
										<label>신청기간</label>&nbsp;&nbsp;&nbsp;
			                            <form:errors cssClass="text-danger bg-danger small" path="meet.mt_rsdate"/>
		                            </div>
									<p class="col-sm-6"><input type="text" class="form-control dtpicker" id="startdt" name="mt_rsdate" maxlength="16" value="${meet.mt_rsdate }"></p>
									<p class="col-sm-6"><input type="text" class="form-control dtpicker" id="enddt" name="mt_redate" maxlength="16" value="${meet.mt_redate }"></p>
								</div>
								<div class="col-md-6">
									<div class="col-md-12">
										<label>모임기간</label>&nbsp;&nbsp;&nbsp;
			                            <form:errors cssClass="text-danger bg-danger small" path="meet.mt_msdate"/>
		                            </div>
									<p class="col-md-6"><input type="text" class="form-control dtpicker" id="startdt2" name="mt_msdate" maxlength="16" value="${meet.mt_msdate }"></p>
									<p class="col-md-6"><input type="text" class="form-control dtpicker" id="enddt2" name="mt_medate" maxlength="16" value="${meet.mt_medate }"></p>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="col-md-12">
								<div class="input-group col-md-12">
									<input id="search_keyword_addr" type="text" class="form-control" placeholder="장소명 또는 주소를 검색해 주세요." onkeypress="searchAddrEnterKey();" maxlength="25">
									<span class="input-group-btn">
										<button type="button" class="btn btn-template-main" onclick="searchAddrEnterKey('13');">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="col-md-12">
									<div id="map" style="width:100%;height:350px;"></div>
									<br/>
								</div>
							</div>
							
							<div class="col-md-12">
                        		<div class="col-md-12">
		                            <label>모임 상세주소</label>&nbsp;&nbsp;&nbsp;
		                            <form:errors cssClass="text-danger bg-danger small" path="meet.mt_addr"/>
	                            </div>
	                            <p class="col-md-12">
	                            	<input id="detail_addr" type="text" name="mt_addr" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30" class="form-control" value="${meet.mt_addr}">
                            	</p>
                        	</div>
							
							<div class="col-md-12">
                        		<div class="col-md-12">
		                            <label>모임 간략소개</label>&nbsp;&nbsp;&nbsp;
		                            <form:errors cssClass="text-danger bg-danger small" path="meet.mt_subject"/>
	                            </div>
	                            <p class="col-md-12">
	                            	<textarea class="form-control" id="comment" rows="3" name="mt_subject" maxlength="100">${meet.mt_subject}</textarea>
                            	</p>
                        	</div>
                        	
							<div class="form-group">
								<div class="col-md-6">
	                        		<div class="col-md-12">
			                            <label>총 모임인원</label>&nbsp;&nbsp;&nbsp;
			                            <form:errors cssClass="text-danger bg-danger small" path="meet.mt_total_pnum"/>
		                            </div>
		                            <p class="col-md-12">
		                            	<input type="number" name="mt_total_pnum" value="${meet.mt_total_pnum == null ? 2:meet.mt_total_pnum}" maxlength="6" class="form-control">
	                            	</p>
								</div>
								<div class="col-md-6">
									<div class="col-md-12">
			                            <label>대표 이미지</label>&nbsp;&nbsp;&nbsp;
			                            <form:errors cssClass="text-danger bg-danger small" path="meet.mt_rep_img"/>
		                            </div>
		                            <p class="col-md-12">
		                            	<input type="file" name="file" accept=".gif, .jpg, .jpeg, .png" class="form-control">
	                            	</p>
								</div>
                        	</div>
							<div class="col-md-12">
								<p class="col-md-12">
									<form:errors cssClass="text-danger bg-danger small" path="meet.mt_content"/>
									<textarea name="mt_content">${meet.mt_content}</textarea>
									<br/>
								</p>
							</div>
							
							
	                        <div class="text-center">
	                            <button type="button" class="btn btn-template-main" onclick="valueChk();"><i class="fa fa-group"></i> 모 임 개 설 하 기</button>
	                        </div>
	                    </form>
					</div>

				</div>
				<!-- /#blog-post -->

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->

<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();
	var searchAddr = document.getElementById('search_keyword_addr');
	function searchAddrEnterKey(btn) {
		if (event.keyCode == 13 || btn == 13) {
			ps.keywordSearch(searchAddr.value, placesSearchCB);
		}
	}

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(status, data, pagination) {
		if (status === daum.maps.services.Status.OK) {

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			var bounds = new daum.maps.LatLngBounds();

			for (var i = 0; i < data.places.length; i++) {
				displayMarker(data.places[i]);
				bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
			}
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
		// 마커를 생성하고 지도에 표시합니다
		var marker = new daum.maps.Marker({
			map : map,
			position : new daum.maps.LatLng(place.latitude, place.longitude)
		});

		daum.maps.event.addListener(marker, 'click', function() {
			searchDetailAddrFromCoords(new daum.maps.LatLng(place.latitude, place.longitude), function(status, result) {
				if (status === daum.maps.services.Status.OK) {
					var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
					document.getElementById('detail_addr').value = detailAddr;
					document.getElementById('mt_subject').value = place.title;
					// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
					infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
					infowindow.open(map, marker);
				}
			});
		});
	}

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var marker = new daum.maps.Marker() // 클릭한 위치를 표시할 마커입니다
	, infowindow = new daum.maps.InfoWindow({
		zindex : 1
	}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
				document.getElementById('detail_addr').value = detailAddr;

				// 마커를 클릭한 위치에 표시합니다 
				marker.setPosition(mouseEvent.latLng);
				marker.setMap(map);

				// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">' + detailAddr + '</div>');
				infowindow.open(map, marker);
			}
		});
	});

	function searchAddrFromCoords(coords, callback) {
		geocoder.coord2addr(coords, callback); // 좌표로 행정동 주소 정보를 요청합니다
	}

	function searchDetailAddrFromCoords(coords, callback) {
		geocoder.coord2detailaddr(coords, callback); // 좌표로 법정동 상세 주소 정보를 요청합니다
	}
</script>

</body>
</html>