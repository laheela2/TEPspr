<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script>
function valueChk(form){
	if(!form.m_name.value){
		alertify.error("이름 값이 없습니다."); return false;
	}
	if(!form.m_email.value){
		alertify.error("메일 값이 없습니다."); return false;
	}
	if(!form.m_phone.value){
		alertify.error("전화번호 값이 없습니다."); return false;
	}
	if(!form.m_password.value){
		alertify.error("비밀번호 값이 없습니다."); return false;
	}
}
</script>
</head>
<body>

	<div class="row">

		<div class="col-lg-12">
			<h1 class="page-header">회원정보수정</h1>
		</div>

		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form" action="<c:url value="/admin/members/modify"/>" onsubmit="return valueChk(this)" method="post" enctype="multipart/form-data" theme="simple">
								<div class="form-group col-lg-12">
									<label class="col-sm-2">회원번호</label>
									<div class="col-lg-6">
										<input class="form-control" name="m_no" id="m_no" value="${data.M_NO}">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">이메일</label>
									<div class="col-lg-6">
										<input class="form-control" type="text" name="m_email" id="m_email" value="${data.M_EMAIL}">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">이름</label>
									<div class="col-lg-6">
										<input class="form-control" name="m_name" id="m_name" value="${data.M_NAME}">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">비밀번호</label>
									<div class="col-lg-6">
										<input class="form-control" name="m_password" id="m_password" value="${data.M_PASSWORD}">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">전화번호</label>
									<div class="col-lg-6">
										<input class="form-control" name="m_phone" id="m_phone" value="${data.M_PHONE}">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">가입일</label>
									<div class="col-lg-6">
										<input class="form-control" name="m_date" id="m_date" value="${data.M_DATE}">
									</div>
								</div>
								<div class="col-sm-7 col-lg-6" align="right">
									<button type="submit" class="btn btn-default">수정하기</button>
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