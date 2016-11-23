<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/include/common-header.jspf"%>
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/meetings.write.css"/>"> --%>
<script src="<c:url value="/resources/js/lendplace.write.js"/>"></script>
<script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
<%-- <script>
	window.onload = function() {
		CKEDITOR.replace('l_content');
	}
</script> --%>
</head>

<body>
<table border="0" width=890px align=center>
<tr>
<td style="font-weight: bold;font-size: x-large;font-family: sans-serif;">관리자 장소 등록</td>
</tr>
</table>
<form name="omf_form" action="<c:url value="/lendplace/write"/>" method="post" enctype="multipart/form-data" theme="simple">
	<table class="mw_borderstyle" border="0" width=890px align=center>
		<tr>
			<td width="200px" class="td_title">장소명</td>
			<td style="padding: 0;">
				<table cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<input type="text" name="l_title" size="73%" placeholder="장소명을 입력 해주세요." maxlength="32">
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td class="td_title">수용인원</td>
			<td>
				<div>
					<input type="number" name="l_pnum" size="5" maxlength="6">
					명
				</div>
			</td>
		</tr>

		<tr>
			<td class="td_title">대관 가능시간</td>
			<td>
				<input type="text" class="dtpicker" name="l_sdate" id="startdt" size="13">
				&nbsp;&nbsp;~&nbsp;
				<input type="text" class="dtpicker" name="l_edate" id="enddt" size="13">
			</td>
		</tr>

		<tr>
			<td></td>
			<td>
				<b style="font-size: xx-small; font-family: monospace; color: navy;">*기간선택을 잘못한 경우 새로고침 하시면 됩니다.</b>
			</td>
		</tr>
		
		<tr>
			<td class="td_title">업체 이름</td>
			<td>
				<input type="text" name="l_name" size="20%">
			</td>
		</tr>
		
		<tr>
			<td class="td_title">업체 이메일</td>
			<td>
				<input type="text" name="l_email" size="20%">
			</td>
		</tr>
		<tr>
			<td class="td_title">업체 전화번호</td>
			<td>
				<input type="text" name="l_phone" size="20%">
			</td>
		</tr>
		<tr>
			<td class="td_title">대여된 횟수</td>
			<td>
				<input type="text" name="l_use_num" size="20%">
			</td>
		</tr>		
		<tr>
			<td colspan="2">
				<hr>
			</td>
		</tr>

		<tr>
			<td class="td_title">&nbsp;</td>
			<td style="padding: 0;">
				<table cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<input id="search_keyword_addr" type="text" name="" size="53%" placeholder="장소명, 주소를 검색해 주세요." onkeypress="searchAddrEnterKey();" maxlength="25">
						</td>
						<td>
							<input type="button" value="검색" onclick="searchAddrEnterKey('13');">
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
			<td>
				<div class="map_wrap">
					<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				</div>
			</td>
		</tr>

		<tr>
			<td class="td_title">장소 상세주소</td>
			<td>
				<div>
					<input id="detail_addr" type="text" name="l_addr" size="73%" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30">
				</div>
			</td>
		</tr>

		<tr>
			<td class="td_title">장소 대표 이미지</td>
			<td>
				<input type="file" name="file" accept=".gif, .jpg, .jpeg, .png">
			</td>
		</tr>

		<tr>
			<td colspan="2">
				<hr>
			</td>
		</tr>

		<tr>
			<td colspan="2" align="center">
				<textarea name="l_content"></textarea>
			</td>
		</tr>

		<tr>
			<td colspan="2">
				<hr>
			</td>
		</tr>

		<tr>
			<td colspan="2" align="center" style="padding-bottom: 11px;">
				<input type="button" value="장소등록" onclick="return valueCheck();">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소하기" onclick="location.href='<c:url value="/lendplace"/>'">
			</td>
		</tr>

	</table>
</form>


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