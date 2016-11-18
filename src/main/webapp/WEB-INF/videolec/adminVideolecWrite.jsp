<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript">
function valueChk(form){
	if(!form.v_category.value){alertify.error("분류 값이 없습니다."); return false;}
	if(!form.v_url.value){alertify.error("주소 값이 없습니다."); return false;}
	if(!form.v_title.value){alertify.error("제목 값이 없습니다."); return false;}
	if(!form.v_recturer.value){alertify.error("게시자 값이 없습니다."); return false;}
}
</script>
</head>
<body>

<div class="row">

		<div class="col-lg-12">
			<h1 class="page-header">동영상 등록</h1>
		</div>

		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form" action="<c:url value="/admin/videolec/write"/>" onsubmit="return valueChk(this)" method="post">
								<div class="form-group col-lg-12">
									<label class="col-sm-2">영상 분류</label>
									<div class="col-lg-6">
										<input class="form-control" name="v_category">
										<p class="help-block">프로그래밍 , 영상편집 , 음악 , 운동</p>
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">영상 주소</label>
									<div class="col-lg-6">
										<input class="form-control" name="v_url">
										<label>
											<input type="checkbox" name="v_url_chk" value="true">리스트
										</label>
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">영상 제목</label>
									<div class="col-lg-6">
										<input class="form-control" name="v_title">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">영상 게시자</label>
									<div class="col-lg-6">
										<input class="form-control" name="v_recturer">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-lg-2">영상 내용</label>
									<div class="col-lg-6">
										<textarea class="form-control" rows="3" name="v_content"></textarea>
									</div>
								</div>

								<div class="col-sm-7 col-lg-6" align="right">
									<button type="submit" class="btn btn-default">저장하기</button>
									<button type="reset" class="btn btn-default">지우기</button>
								</div>
							</form>
						</div>
					</div>
					<!-- /.row (nested) -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>

	</div>

</body>
</html>