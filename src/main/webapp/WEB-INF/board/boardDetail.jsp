<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_meetings').addClass('active'); });</script>
<script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('b_content');
	}
</script>
</head>
<body>

	<div id="heading-breadcrumbs">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-6">
	                <h1>게시판</h1>
	            </div>
	            <div class="col-md-6">
	                <ul class="breadcrumb">
	                    <li><a href="<c:url value="/meetings"/>">모임</a></li>
	                    <li><a href="javascript:history.back();">게시판</a></li>
	                    <li>상세</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>

	<div id="content">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="col-md-12">

                        <div class="form-group">
                        	<div class="col-md-6">
                        		<div class="col-md-12">
		                            <h5>종류</h5>
	                            </div>
	                            <p class="col-md-12">
									<c:if test="${data.B_KIND == 0 }">
										<input type="text" class="form-control" value="일반게시물" disabled="disabled">
									</c:if>
									<c:if test="${data.B_KIND == 1 }">
										<input type="text" class="form-control" value="스승찾아요" disabled="disabled">
									</c:if>
									<c:if test="${data.B_KIND == 2 }">
										<input type="text" class="form-control" value="제자찾아요" disabled="disabled">
									</c:if>
								</p>
                        	</div>
                        	<div class="col-md-6">
                        		<div class="col-md-12">
		                            <h5>카테고리</h5>
	                            </div>
	                            <p class="col-md-12"><input type="text" class="form-control" value="${data.B_CATEGORY}" disabled="disabled"></p>
                        	</div>
                        </div>
                        
                        <div class="form-group">
                        	<div class="col-md-6">
                        		<div class="col-md-12">
		                            <h5>관심분야</h5>
	                            </div>
	                            <p class="col-md-12"><input type="text" class="form-control" value="${data.B_FAV_FIELD}" disabled="disabled"></p>
                        	</div>
                        	<div class="col-md-6">
                        		<div class="col-md-12">
		                            <h5>관심지역</h5>
	                            </div>
	                            <p class="col-md-12"><input type="text" class="form-control" value="${data.B_FAV_AREA}" disabled="disabled"></p>
                        	</div>
                        </div>
                        
                       	<div class="col-md-12">
                       		<div class="col-md-12">
	                            <h5>제목</h5>
                            </div>
                            <p class="col-md-12"><input type="text" class="form-control" value="${data.B_TITLE}" disabled="disabled"></p>
                       	</div>
                       
                       	<div class="col-md-12">
                       		<div class="col-md-12">
	                            <h5>내용</h5>
                            </div>
                       		<p class="col-md-12">
	                            <textarea name="b_content" disabled="disabled">${data.B_CONTENT}</textarea>
	                            <br/>
                            </p>
                       	</div>

						<c:if test="${sessionScope.session_m_no != null && sessionScope.session_m_no == data.M_NO }">
							<div class="text-center">
								<button type="button" class="btn btn-template-main" onclick="fn_boardModify();">
									<i class="fa fa-edit"></i> 수 정 하 기
								</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-template-main" onclick="fn_boardDelete();">
									<i class="fa fa-trash"></i> 삭 제 하 기
								</button>
							</div>
							<br/>
						</c:if>


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
									<form action="<c:url value="/board/insertcmt"/>" onsubmit="return cmt_check();" method="post">
									<input type="hidden" name="b_no" value="${data.B_NO }">
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

				</div>
				<!-- /#blog-post -->

			</div>
			<!-- /.row -->

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
		
		function fn_deleteCmt(c_no) {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/board/deletecmt' />");
			cs.addParam("c_no", c_no);
			cs.addParam("b_no", '${data.B_NO }');
			cs.submit();
		}

		function fn_boardModify() {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/board/modify' />");
			cs.addParam("b_no", '${data.B_NO }');
			cs.submit("GET");
		}

		function fn_boardDelete() {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/board/delete' />");
			cs.addParam("b_no", '${data.B_NO }');
			cs.submit();
		}
	</script>


</body>
</html>