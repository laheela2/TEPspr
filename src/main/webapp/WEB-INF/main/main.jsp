<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript">
	$(function(){
		  $('#navigation').find('#nav_main').addClass('active');
	});
</script>
</head>
<body>



<section>
	<!-- *** HOMEPAGE CAROUSEL ***
_________________________________________________________ -->

	<div class="home-carousel">

		<div class="dark-mask"></div>

		<div class="container">
			<div class="homepage owl-carousel">
				<div class="item">
					<div class="row">
						<div class="col-sm-5 right">
							<h1>문화, <br>VR을 만나다</h1>
							<p>
								VR(가상현실)기술이 그려갈 <br />문화계 미래의 청사진을 그려본다.
							</p>
						</div>
						<div class="col-sm-7">
							<img class="img-responsive" src="<c:url value="/resources/image/temp_1.png"/>" alt="">
						</div>
					</div>
				</div>
				<div class="item">
					<div class="row">

						<div class="col-sm-7 text-center">
							<img class="img-responsive" src="<c:url value="/resources/image/temp_2.png"/>" alt="">
						</div>

						<div class="col-sm-5">
							<h2>몸을 통한 관점의<br> 확장과 전환</h2>
							<ul class="list-style-none">
								<li>몸을 통해 소통하고자 하는 예술가</li>
								<li>관점의 확장이 필요한 문화예술교육자</li>
								<li>문화예술을 즐기는 국공립기관 종사자</li>
							</ul>
						</div>

					</div>
				</div>
				<div class="item">
					<div class="row">
						<div class="col-sm-5 right">
							<h1>Dance with R</h1>
							<p>
								R(프로그래밍 언어)을 기반으로 한<br />빅데이터 분석 특강
							</p>
						</div>
						<div class="col-sm-7">
							<img class="img-responsive" src="<c:url value="/resources/image/temp_3.png"/>" alt="">
						</div>
					</div>
				</div>
				<div class="item">
					<div class="row">
						<div class="col-sm-7">
							<img class="img-responsive" src="<c:url value="/resources/image/temp_4.png"/>" alt="">
						</div>
						<div class="col-sm-5">
							<h2>구글 [스프린트] 의 모든것!</h2>
							<ul class="list-style-none">
								<li>기획부터 실행까지 단 5일.</li>
								<li>세상에서 가장 혁신적인 프로젝트 수행법</li>
								<li>지메일, 구글서치, 크롬을 탄생시킨<br> 스프린트!</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- /.project owl-slider -->
		</div>
	</div>

	<!-- *** HOMEPAGE CAROUSEL END *** -->
</section>

<section class="bar background-white no-mb">
	<div class="container" data-animate="fadeInUp">
		<div class="row">
			<div class="col-md-12">

				<div class="heading text-center">
					<h2>추천 동영상</h2>
				</div>

				<div class="row">
					<div class="portfolio-showcase clearfix">
						<div class="col-sm-6">
							<div class="image">
								<img src="https://img.youtube.com/vi/${data.V_VIDEO_ID}/0.jpg" alt="" class="img-responsive">
							</div>
						</div>

						<div class="col-sm-6">
							<h3>
								<a href="#" onclick="fn_videolecDetailLink()">${data.V_TITLE }</a>
							</h3>
							<p class="lead">${data.V_CONTENT}</p>
							<p>게시자 : ${data.V_RECTURER }</p>
							<p class="buttons">
								<a href="#" class="btn btn-template-main" onclick="fn_videolecDetailLink('${data.V_NO}')">보기</a>
							</p>
						</div>
					</div>
				</div>

				<div class="heading text-center">
					<h3>추천 모임</h3>
				</div>

				<div class="row portfolio no-space">
					
					<c:forEach items="${list }" var="row">
						<div class="col-sm-4">
							<div class="box-image">
								<div class="image">
									<img src="${row.MT_REP_IMG }" alt="" class="img-responsive">
								</div>
								<div class="bg"></div>
								<div class="name">
									<h3>
										<a href="#" onclick="fn_meetingsDetailLink('${row.MT_NO}')">${row.MT_TITLE }</a>
									</h3>
								</div>
								<div class="text">
									<p class="hidden-sm">${row.MT_SUBJECT }</p>
									<p class="buttons">
										<a href="#" class="btn btn-template-transparent-primary" onclick="fn_meetingsDetailLink('${row.MT_NO}')">보기</a>
										<c:choose>
											<c:when test="${row.MT_PERMIT_PNUM <= 0 }">
												<a href="#" class="btn btn-template-transparent-primary" onclick="fn_meetingsApplyforDisable()">신청</a>
											</c:when>
											<c:otherwise>
												<a href="#" class="btn btn-template-transparent-primary" onclick="fn_meetingsApplyfor('${row.MT_NO}')">신청</a>
											</c:otherwise>
										</c:choose>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>

				<div class="see-more">
					<a href="<c:url value="/meetings"/>" class="btn btn-template-main">모임 목록 더보기</a>
				</div>

			</div>

		</div>
	</div>
</section>

<section class="bar background-gray no-mb">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="owl-carousel customers">
					<li class="item"><img src="<c:url value="/resources/bootstrap/uni/img/customer-1.png"/>" alt="" class="img-responsive"></li>
					<li class="item"><img src="<c:url value="/resources/bootstrap/uni/img/customer-2.png"/>" alt="" class="img-responsive"></li>
					<li class="item"><img src="<c:url value="/resources/bootstrap/uni/img/customer-3.png"/>" alt="" class="img-responsive"></li>
					<li class="item"><img src="<c:url value="/resources/bootstrap/uni/img/customer-4.png"/>" alt="" class="img-responsive"></li>
					<li class="item"><img src="<c:url value="/resources/bootstrap/uni/img/customer-5.png"/>" alt="" class="img-responsive"></li>
					<li class="item"><img src="<c:url value="/resources/bootstrap/uni/img/customer-6.png"/>" alt="" class="img-responsive"></li>
				</ul>
				<!-- /.owl-carousel -->
			</div>

		</div>
	</div>
</section>


<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    function fn_meetingsApplyforDisable(){
    	alertify.error("신청 마감된 모임입니다.");
    }
    
    function fn_meetingsApplyfor(mt_no){
    	if(isLoginCheck("${sessionScope.session_m_email}")){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/meetings/applyfor' />");
	        cs.addParam("mt_no", mt_no);
	        cs.submit();
        }
    }
    
    function fn_videolecDetailLink(){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/videolec/detail' />");
        cs.addParam("v_no", '${data.V_NO}');
        cs.submit();
    }
    
    function fn_meetingsDetailLink(mt_no){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/meetings/detail' />");
        cs.addParam("mt_no", mt_no);
        cs.submit();
    }
</script> 


</body>
</html>