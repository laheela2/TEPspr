<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>

<title>회원가입</title>
<script>
	var num_check = /^[0-9]*$/;
	var phone_check1 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var phone_check2 = /^\d{2,3}-\d{3,4}-\d{4}$/;

	function modify() {

		var join = document.userinput

		if (join.m_name.value == "") {
			alertify.error("이름을 입력해주세요");
			join.m_name.focus();
			return false;
		}

		if (join.m_name.value.match(num_check)) {
			alertify.error("이름에는 숫자가 포함될수 없습니다.");
			join.m_name.focus();
			return false;
		}

		if (join.m_password.value == "") {
			alertify.error("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		}

		if (join.m_password.value.length < 4) {
			alertify.error("최소 4자리 이상 입력해주세요!");
			join.m_password.focus();
			return false;
		}

		if (join.m_password.value != join.m_password2.value) {
			alertify.error("입력한 비밀번호가 서로 다릅니다.");
			join.m_password2.focus();
			return false;
		}

		if (join.m_phone.value == "") {
			alertify.error("전화번호를 입력해주세요");
			join.m_phone.focus();
			return false;
		}

		if (!join.m_phone.value.match(phone_check1)
				&& !join.m_phone.value.match(phone_check2)) {
			alertify.error("전화번호 형식이 잘못되었습니다. 다시 입력해주세요.");
			alertify.log("예) 010-1234-1234<br> 또는 02-123-1234");
			join.m_phone.focus();
			return false;
		}

		join.submit();
	}
</script>

</head>
<body>
<div class="container">
		<div class="row">
	<div class="col-md-3">
		<div class="panel panel-default sidebar-menu with-icons">

			<div class="panel-heading">
				<h3 class="panel-title">Categories</h3>
			</div>

			<div class="panel-body">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="mypageView">내 정보</a>
					</li>
					<li><a href="modifyPwChk">회원정보수정</a></li>
					<li><a href="writeHistoryBoard">게시판 내역</a></li>
					<li><a href="cmtHistory">답글내역</a></li>
					<li><a href="writeHistoryOmeet">모임개설내역</a></li>
					<li><a href="meetHistory">모임참여내역</a></li>
					<li><a href="qnaHistory">문의내역</a></li>
					<li><a href="mypageDeleteForm">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		<!-- *** MENUS AND FILTERS END *** -->
	</div>
	<div class="col-md-9">
	<div class="heading">
		<h3>회원정보수정</h3>
	</div>
	<br>
	<div class="box clearfix">
	<form action="mypageModifyResult" name="userinput" method="post">
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="firstname"><font color="red">*</font> ID(이메일) </label>
					<input type="text" class="form-control" name="m_email" id="m_email" disabled="disabled" value="${mData.M_EMAIL}">
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="company"><font color="red">*</font> 이름 </label>
					<input type="text" class="form-control" name="m_name" id="m_name" value="${mData.M_NAME}" maxlength="9">
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="company"><font color="red">*</font> 패스워드 </label>
					<input type="text" class="form-control" name="m_password" id="m_password" value="${mData.M_PASSWORD}" maxlength="15">
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="company"><font color="red">*</font> 패스워드 확인 </label>
					<input type="text" class="form-control" name="m_password2" id="m_password2" maxlength="15">
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="company"><font color="red">*</font> 전화번호 </label>
					<input type="text" class="form-control" name="m_phone" id="m_phone" value="${mData.M_PHONE}" maxlength="13">
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div class="col-sm-12 text-center">
			<button type="button" class="btn btn-template-main" onclick="modify();"><i class="fa fa-save"></i> Save changes</button>
		</div>
	</form>
</div>
</div>
</div>
</div>
	

	<br>

</body>
</html>