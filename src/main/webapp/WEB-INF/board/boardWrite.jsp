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
	
	function fn_submit(){
		var f = document.boardWriteForm;
		var content = CKEDITOR.instances.b_content;
		
		if(!f.b_title.value){
			alertify.error("제목이 입력되지 않았습니다.");
			f.b_title.focus();
			return false;
		}
		
		if(!content.getData()){
			alertify.error("내용이 입력되지 않았습니다.");
			content.focus();
			return false;
		}
		
		if(isLoginCheck('${sessionScope.session_m_email}')){
			f.submit();
		}
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
	                    <li>글쓰기</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>

	<div id="content">
		<div class="container">
			<form name="boardWriteForm" action="<c:url value="/board/write"/>" method="post">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-12">
	
	                        <div class="form-group">
	                        	<div class="col-md-6">
	                        		<div class="col-md-12">
			                            <h5>종류</h5>
		                            </div>
		                            <p class="col-md-12">
										<select name="b_kind" class="form-control">
											<option value="0">일반게시물</option>
											<option value="1">스승찾아요</option>
											<option value="2">제자찾아요</option>
										</select>
									</p>
	                        	</div>
	                        	<div class="col-md-6">
	                        		<div class="col-md-12">
			                            <h5>카테고리</h5>
		                            </div>
		                            <p class="col-md-12">
										<select name="b_category" class="form-control">
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
	                        </div>
	                        
	                        <div class="form-group">
	                        	<div class="col-md-6">
	                        		<div class="col-md-12">
			                            <h5>관심분야</h5>
		                            </div>
		                            <p class="col-md-12">
										<select name="b_fav_field" class="form-control">
											<option value="프로그래밍">프로그래밍</option>
											<option value="네일아트">네일아트</option>
											<option value="공예">공예</option>
											<option value="작곡/작사">작곡/작사</option>
											<option value="번역/통역">번역/통역</option>
											<option value="디자인">디자인</option>
											<option value="분석">분석</option>
											<option value="운동">운동</option>
											<option value="기타">기타</option>
										</select>
		                            </p>
	                        	</div>
	                        	<div class="col-md-6">
	                        		<div class="col-md-12">
			                            <h5>관심지역</h5>
		                            </div>
		                            <p class="col-md-12">
										<select name="b_fav_area" class="form-control">
											<option value="서울">서울</option>
											<option value="부산/울산/경남">부산/울산/경남</option>
											<option value="인천/경기">인천/경기</option>
											<option value="대전/충청/세종">대전/충청/세종</option>
											<option value="광주/전라">광주/전라</option>
											<option value="강원">강원</option>
											<option value="대구/경북">대구/경북</option>
											<option value="제주">제주</option>
											<option value="기타">기타</option>
										</select>
		                            </p>
	                        	</div>
	                        </div>
	                        
	                       	<div class="col-md-12">
	                       		<div class="col-md-12">
		                            <h5>제목</h5>
	                            </div>
	                            <p class="col-md-12"><input type="text" class="form-control" name="b_title" maxlength="50"></p>
	                       	</div>
	                       
	                       	<div class="col-md-12">
	                       		<div class="col-md-12">
		                            <h5>내용</h5>
	                            </div>
	                       		<p class="col-md-12">
		                            <textarea name="b_content"></textarea>
		                            <br/>
	                            </p>
	                       	</div>
	
							<div class="text-center">
								<button type="button" class="btn btn-template-main" onclick="fn_submit();">
									<i class="fa fa-save"></i> 저 장 하 기
								</button>
							</div>
							<br/>
	
						</div>
	
					</div>
					<!-- /#blog-post -->
	
				</div>
				<!-- /.row -->
			</form>
		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->

</body>
</html>