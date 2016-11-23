<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_videolec').addClass('active'); });</script>
</head>
<body>

	<div id="heading-breadcrumbs">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-6">
	                <h1>동영상 목록</h1>
	            </div>
	            <div class="col-md-6">
	                <ul class="breadcrumb">
	                    <li><a href="<c:url value="/videolec"/>">영상목록</a></li>
	                    <li>영상 상세보기</li>
	                </ul>
	
	            </div>
	        </div>
	    </div>
	</div>

	<div id="content">
		<div class="container">

			<section class="no-mb">
				<div class="row">
					<div class="col-md-12">
						<!-- <p class="lead">.</p> -->
					</div>
				</div>
			</section>

			<section>
				<div class="project owl-carousel">
					<c:choose>
						<c:when test="${data.V_LIST_ID != null || fn:length(data.V_LIST_ID) > 0 }">
							<c:set var="videoID" value="${data.V_VIDEO_ID}?list=${data.V_LIST_ID}"/>
						</c:when>
						<c:otherwise>
							<c:set var="videoID" value="${data.V_VIDEO_ID}"/>
						</c:otherwise>
					</c:choose>
					<iframe width="100%" height="650" src="https://www.youtube.com/embed/${videoID}" frameborder="0" allowfullscreen></iframe>
				</div>
				<!-- /.project owl-slider -->
			</section>

			<section>
				<div class="row portfolio-project">
					<div class="col-md-8">
						<div class="heading">
							<h3>${data.V_TITLE }</h3>
						</div>

						<p>${data.V_CONTENT}</p>

					</div>
					<div class="col-md-4 project-more">
						<div class="heading">
							<h3>More</h3>
						</div>
						<h4>게시자</h4>
						<p>${data.V_RECTURER}</p>
						<h4>게시일</h4>
						<p>${data.V_DATE}</p>
						<h4>조회수</h4>
						<p>${data.V_READCOUNT}</p>
					</div>
				</div>
			</section>

			<section>
				<div class="row portfolio">

					<div class="col-md-12">
						<div class="heading">
							<h3>추천 동영상</h3>
						</div>
					</div>

					<c:forEach items="${recList }" var="row">
						<div class="col-sm-6 col-md-3">
							<div class="box-image">
								<div class="image">
									<img src="https://img.youtube.com/vi/${row.V_VIDEO_ID}/0.jpg"" alt="" class="img-responsive">
								</div>
								<div class="bg"></div>
								<div class="name">
									<h3>
										<a href="#this" onclick="fn_videolecDetail('${row.V_NO }')">${row.V_TITLE }</a>
									</h3>
								</div>
								<div class="text">
									<p class="buttons">
										<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_videolecDetail('${row.V_NO }')"><i class="fa fa-eye"></i> 보기</a>
										<a href="https://www.youtube.com/watch?v=${row.V_VIDEO_ID}&list=${row.V_LIST_ID}" target="_blank" class="btn btn-template-transparent-primary"><i class="fa fa-youtube"></i>유튜브</a>
									</p>
								</div>
							</div>
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
						<form action="<c:url value="/videolec/insertcmt"/>" onsubmit="return cmt_check();" method="post">
						<input type="hidden" name="v_no" value="${data.V_NO }">
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

<%@ include file="/WEB-INF/include/common-body.jspf" %>
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
		
    function fn_videolecDetail(v_no){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/videolec/detail' />");
        cs.addParam("v_no", v_no);
        cs.submit();
    }
    
	function fn_deleteCmt(c_no) {
		var cs = new CustomSubmit();
		cs.setUrl("<c:url value='/videolec/deletecmt' />");
		cs.addParam("c_no", c_no);
		cs.addParam("v_no", '${data.V_NO }');
		cs.submit();
	}
	
    function fn_videlecoLikeit(){
        if(isLoginCheck("${sessionScope.session_m_email}")){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/videolec/likeit' />");
	        cs.addParam("v_no", '${data.V_NO }');
	        cs.submit();
        }
    }	
</script> 

</body>
</html>