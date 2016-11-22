<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_meetings').addClass('active'); });</script>
</head>

<body>


	<div id="heading-breadcrumbs">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-6">
	                <h1>모임 상세정보</h1>
	            </div>
	            <div class="col-md-6">
	                <ul class="breadcrumb">
	                    <li><a href="<c:url value="/main"/>">홈</a></li>
	                    <li><a href="<c:url value="/meetings"/>">모임목록</a></li>
	                    <li>모임 상세보기</li>
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
						<h2>${data.MT_TITLE }</h2>
					</div>

					<p class="lead">${data.MT_SUBJECT }</p>
				</div>
			</div>
			<div class="row portfolio-project">

				<section>
					<div class="col-sm-5">
						<p>
							<img src="${data.MT_REP_IMG }" class="img-responsive" alt="">
						</p>
					</div>

					<div class="col-sm-7">
						<div class="project-more">
							<h4>개설자 정보</h4>
							<p>
								<i class="fa fa-github-alt"></i>&nbsp;&nbsp;&nbsp;${data.MT_NAME }<br/>
								<i class="fa fa-envelope-o"></i>&nbsp;&nbsp;&nbsp;${data.MT_EMAIL }<br/>
								<i class="fa fa-phone"></i>&nbsp;&nbsp;&nbsp;&nbsp;${data.MT_PHONE }
							</p>
							<hr>
							<h4>모임기간</h4>
							<p>${data.MT_MEETDATE }</p>
							<hr>
							<h4>모임장소</h4>
							<p>${data.MT_ADDR }</p>
							<hr>
							<h4>신청기간 및 인원</h4>
							<p>
								${data.MT_REGISTERDATE }<br>
								총${data.MT_TOTAL_PNUM }명&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<u>${data.MT_PERMIT_PNUM }명 신청가능</u>
							</p>
						</div>
                        <div class="text-center">
                        	<c:choose>
                        		<c:when test="${data.M_NO == sessionScope.session_m_no }">
                        			<button type="button" class="btn btn-template-main" onclick="fn_meetingsModify();">
                        				<i class="fa fa-edit"></i> 수정하기
                       				</button>
                        			<button type="button" class="btn btn-template-main" onclick="fn_meetingsDelete();">
                        				<i class="fa fa-trash-o"></i> 삭제하기
                       				</button>
                        		</c:when>
                        		<c:otherwise>
									<button type="button" class="btn ${data.MT_LIKEIT == null ? 'btn-default':(data.MT_LIKEIT == sessionScope.session_m_no ? 'btn-template-primary':'btn-default')}" onclick="fn_meetingsLikeit();" data-toggle="tooltip" data-placement="top" title="" data-original-title="좋아요">
										<i class="fa fa-thumbs-o-up"></i>
									</button>
									<c:choose>
										<c:when test="${data.MT_PERMIT_PNUM <= 0 }">
		                            		<button type="button" class="btn btn-template-main disabled">
		                            			<i class="fa fa-send-o"></i> 신청마감
	                            			</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-template-main" onclick="fn_meetingsApplyfor('${data.MT_NO}');">
												<i class="fa fa-send-o"></i> 신청하기
											</button>
										</c:otherwise>
									</c:choose>
                        		</c:otherwise>
                        	</c:choose>
                        
                        </div>						
					</div>
				</section>

				<section>
					<div class="col-sm-12">

						<div class="heading">
							<h3>세부내용</h3>
						</div>

						<p style="font-size: small;color:navy;">※ 접수 후에는 정식접수 안내를 위해 전화 또는 문자를 드리고 있습니다. (문의 070-4739-9697)</p>

						<p>${data.MT_CONTENT }</p>
					</div>
				</section>
				
				<section>
					<div class="col-sm-12">

						<div class="heading">
							<h3>위치</h3>
						</div>

						<div id="map" style="width:100%;height:350px;"></div>
						
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
					</div>
				</section>

			</div>

			<section>
				<div class="row portfolio">

					<div class="col-md-12">
						<div class="heading">
							<h3>추천 모임</h3>
						</div>
					</div>

					<c:forEach items="${recList }" var="row">
						<div class="col-sm-6 col-md-3">
							<div class="box-image">
								<div class="image">
									<img src="${row.MT_REP_IMG }" alt="" class="img-responsive">
								</div>
								<div class="bg"></div>
								<div class="name">
									<h3 style="font-size: medium;">
										<a href="#this" onclick="fn_meetingsDetailLink('${row.MT_NO}')">${row.MT_TITLE }</a>
									</h3>
								</div>
								<div class="text">
									<p class="hidden-sm small">${row.MT_SUBJECT }</p>
									<p class="buttons">
										<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_meetingsDetailLink('${row.MT_NO}')">보기</a>
										<c:choose>
											<c:when test="${row.MT_PERMIT_PNUM <= 0 }">
												<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_meetingsApplyforDisable()">신청</a>
											</c:when>
											<c:otherwise>
												<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_meetingsApplyfor('${row.MT_NO}')">신청</a>
											</c:otherwise>
										</c:choose>
									</p>
								</div>
							</div>
							<!-- /.box-image -->
						</div>
					</c:forEach>
					
				</div>
			</section>

			<section>
				<div class="col-sm-12">
					<div id="comments">
						<h4 class="text-uppercase">${fn:length(cmtList)} COMMENTS</h4>
						<hr>
						<c:forEach items="${cmtList }" var="cmt">
							<div class="row comment">
								<div class="col-sm-9 col-md-10">
									<h5 class="text-uppercase">
										${cmt.C_NAME }
										<c:if test="${sessionScope.session_m_no != null && sessionScope.session_m_no == cmt.M_NO }">
											<a href="#this" onclick="fn_deleteCmt('${cmt.C_NO}');"><i class="fa fa-trash-o"></i></a>
										</c:if>
									</h5>
									<p class="posted" style="font-size: x-small;">
										<i class="fa fa-clock-o"></i> <fmt:formatDate value="${cmt.C_DATE}" pattern="yy/MM/dd hh:mm:ss"/>
									</p>
									<p>${cmt.C_CONTENT }</p>
								</div>
							</div>
							<hr>
							<!-- /.comment -->
						</c:forEach>						
					</div>
					<!-- /#comments -->


					<div id="comment-form">
						<form action="<c:url value="/meetings/insertcmt"/>" onsubmit="return cmt_check();" method="post">
						<input type="hidden" name="mt_no" value="${data.MT_NO }">
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="comment">Comment <span class="required">*</span></label>
										<textarea class="form-control" id="comment" rows="4" name="c_content"></textarea>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12 text-right">
									<button class="btn btn-template-main">
										<i class="fa fa-comment-o"></i> 코멘트 남기기
									</button>
								</div>
							</div>
						</form>
						<br/><br/>
					</div>
					<!-- /#comment-form -->

				</div>
			</section>

		</div>
		<!-- /.container -->


	</div>
	<!-- /#content -->





	<%@ include file="/WEB-INF/include/common-body.jspf"%>
	<script type="text/javascript">
		function cmt_check() {
			var area = document.getElementById('comment');
			if (!isLoginCheck("${sessionScope.session_m_email}")) {
				return false;
			}
			if (!area.value) {
				alertify.error("댓글에 내용이 입력되지 않았습니다.");
				area.focus();
				return false;
			}
		}
		
	    function fn_meetingsDetailLink(mt_no){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/meetings/detail' />");
	        cs.addParam("mt_no", mt_no);
	        cs.submit();
	    }
		
	    function fn_meetingsApplyforDisable(){
	    	alertify.error("신청 마감된 모임입니다.");
	    }
		
		function fn_meetingsApplyfor(mt_no) {
			if (isLoginCheck("${sessionScope.session_m_email}")) {
				var cs = new CustomSubmit();
				cs.setUrl("<c:url value='/meetings/applyform' />");
				cs.addParam("mt_no", mt_no);
				cs.submit();
			}
		}

		function fn_deleteCmt(c_no) {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/meetings/deletecmt' />");
			cs.addParam("c_no", c_no);
			cs.addParam("mt_no", '${data.MT_NO }');
			cs.submit();
		}

		function fn_meetingsModify() {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/meetings/modify' />");
			cs.addParam("mt_no", '${data.MT_NO }');
			cs.submit("GET");
		}

		function fn_meetingsDelete() {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/meetings/delete' />");
			cs.addParam("mt_no", '${data.MT_NO }');
			cs.submit();
		}
		
	    function fn_meetingsLikeit(){
	        if(isLoginCheck("${sessionScope.session_m_email}")){
		        var cs = new CustomSubmit();
		        cs.setUrl("<c:url value='/meetings/likeit' />");
		        cs.addParam("mt_no", '${data.MT_NO }');
		        cs.submit();
	        }
	    }
	</script>

</body>
</html>