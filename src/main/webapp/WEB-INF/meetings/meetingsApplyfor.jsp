<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_meetings').addClass('active'); });</script>
<script type="text/javascript">
	function valueChk(){
		var f = document.apply_form;
		var limit = '${data.MT_PERMIT_PNUM}';
		var num = document.getElementById("ma_snum");

		if(!num.value){
			alertify.error("신청 인원이 입력되지 않았습니다.");
			num.focus();
			return false;
		}
		if(num.value > parseInt(limit)){
			alertify.error("신청가능 인원이 초과되었습니다.");
			num.value = "";
			num.focus();
			return false;
		}
	}
</script>
</head>
<body>

	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>모임 신청 정보</h1>
				</div>
				<div class="col-md-6">
					<ul class="breadcrumb">
	                    <li><a href="<c:url value="/main"/>">홈</a></li>
	                    <li><a href="<c:url value="/meetings"/>">모임목록</a></li>
	                    <li><a href="javascript:history.back();">모임상세</a></li>
	                    <li>모임 신청하기</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<section class="post">
						<div class="row">
							<div class="col-md-5">
								<div class="image">
									<a href="blog-post.html">
										<img src="${data.MT_REP_IMG }" class="img-responsive" alt="">
									</a>
								</div>
							</div>
							<form name="apply_form" action="<c:url value="/meetings/applyfor"/>" method="post" onsubmit="return valueChk();">
							<div class="col-md-7">
								<div class="heading">
									<h3>${data.MT_TITLE }</h3>
								</div>
								<p>${data.MT_SUBJECT }</p>
								<hr>
								<h5>모임기간</h5>
								<p>${data.MT_MEETDATE }</p>
								<h5>모임주소</h5>
								<p>${data.MT_ADDR }</p>
								<h5>신청인원</h5>
								<p>총${data.MT_TOTAL_PNUM }명&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${data.MT_PERMIT_PNUM}명 신청가능
									<input type="number" id="ma_snum" name="ma_snum" size="1" maxlength="4">명
								</p>
								<h5>신청자 정보</h5>
								<p>
									<i class="fa fa-github-alt"></i>&nbsp;&nbsp;${data.MT_NAME }&nbsp;/&nbsp;
									<i class="fa fa-envelope-o"></i>&nbsp;&nbsp;${data.MT_EMAIL }&nbsp;/&nbsp;
									<i class="fa fa-phone"></i>&nbsp;&nbsp;${data.MT_PHONE }
								</p>
								<input type="hidden" name="mt_no" value="${data.MT_NO}" />
								<p class="read-more">
									<button type="submit" class="btn btn-template-main">
                        				<i class="fa fa-send-o"></i> 신청하기
                       				</button>
								</p>
							</div>
							</form>
						</div>
					</section>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>