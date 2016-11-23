<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script src="<c:url value="/resources/js/lendplace.write.js"/>"></script>
<script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
<script type="text/javascript">

</script>
</head>
<body>

<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>장소 신청하기</h1>
            </div>
            <div class="col-md-6">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a></li>
                    <li><a href="<c:url value="/lendplace"/>">장소</a></li>
                    <li><a href="javascript:history.back();">장소 상세보기</a></li>
                    <li>장소 신청하기</li>
                </ul>

            </div>
        </div>
    </div>
</div>


<div id="content">
    <div class="container">
    
<section>

	<div class="row text-center">


		<div class="col-md-8 col-md-offset-2">
			
			<form name="applyForm" action="<c:url value="/lendplace/applyfor"/>" method="post" enctype="multipart/form-data" theme="simple">
				<div class="row">
					<input type="hidden" name="l_no" value="${applyData.L_NO}">
					<div class="col-sm-6">
						<div class="box payment-method">

								<h4>신청장소</h4>

							<p>${applyData.L_TITLE }</p>

						</div>
					</div>	
					
					<div class="col-sm-6">
						<div class="col-sm-6">
							<div class="box payment-method">
	
								<h4>신청 시작시간</h4>
	
								<input type="text" class="form-control dtpicker" name="la_sdate" id="startdt">
	
							</div>
						</div>	
						<div class="col-sm-6">
							<div class="box payment-method">
	
								<h4>신청 종료시간</h4>
	
								<input type="text" class="form-control dtpicker" name="la_edate" id="enddt">
	
							</div>
						</div>	
					</div>
					
					<div class="col-sm-6">
						<div class="box payment-method">

							<h4>신청자 이름</h4>

							<p>${applyData.M_NAME }</p>

						</div>
					</div>	
					<div class="col-sm-6">
						<div class="box payment-method">

							<h4>신청자 이메일</h4>

							<p>${applyData.M_EMAIL }</p>

						</div>
					</div>	
					

					<div class="col-sm-12 text-center">
						<button type="button" class="btn btn-template-main" onclick="javascript:history.back();"><i class="fa fa-reply"></i> 취소</button>
						<button type="button" class="btn btn-template-main" onclick="return valueCheck2();"><i class="fa fa-star"></i> 접수완료</button>
					</div>
				</div>
				<!-- /.row -->
			</form>

		</div>
	</div>
	<!-- /.row -->

</section>

        <div class="row portfolio-project">
        
			<section>

				<div class="col-sm-8">
					<div class="project owl-carousel">
						<div class="item">
							<img src="<c:url value="/resources/bootstrap/uni/img/main-slider1.jpg"/>" alt="" class="img-responsive">
						</div>
						<div class="item">
							<img class="img-responsive" src="<c:url value="/resources/bootstrap/uni/img/main-slider2.jpg"/>" alt="">
						</div>
						<div class="item">
							<img class="img-responsive" src="<c:url value="/resources/bootstrap/uni/img/main-slider3.jpg"/>" alt="">
						</div>
						<div class="item">
							<img class="img-responsive" src="<c:url value="/resources/bootstrap/uni/img/main-slider4.jpg"/>" alt="">
						</div>
					</div>
					<!-- /.project owl-slider -->

				</div>

				<div class="col-sm-4">
					<div class="project-more">
						<h4>장소명</h4>
						<p>${applyData.L_TITLE }</p>
						<h4>주소</h4>
						<p>${applyData.L_ADDR }</p>
						<h4>수용인원</h4>
						<p>${applyData.L_PNUM }명</p>
						<h4>대관시간</h4>
						<p>${applyData.L_DATE }</p>
					</div>
				</div>

			</section>        
        

			<section>

				<div class="col-sm-12">

					<div class="heading">
						<h3>장소정보</h3>
					</div>

					<p>${applyData.L_CONTENT }</p>
					
				</div>
			</section>


        </div>

    </div>
    <!-- /.container -->


</div>
<!-- /#content -->




</body>
</html>