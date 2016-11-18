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
		
		if(join.m_password.value != join.m_password2.value){
			alertify.error("입력한 비밀번호가 서로 다릅니다.");
			join.m_password2.focus();
			return false;
		}
		
		if (join.m_phone.value == "") {
			alertify.error("전화번호를 입력해주세요");
			join.m_phone.focus();
			return false;
		}

		if(!join.m_phone.value.match(phone_check1) && !join.m_phone.value.match(phone_check2)){
			alertify.error("전화번호 형식이 잘못되었습니다. 다시 입력해주세요.");
			alertify.log("예) 010-1234-1234<br> 또는 02-123-1234");
			join.m_phone.focus();
			return false;
		}

		join.submit();
	}
</script>

<style type="text/css">
.memform_table input{
	width: 250px;
}
.memform_table td {
	text-align: right;
}
table.memform_table {
	border:1px solid red;
	padding:1%;
}
</style>
</head>
<body>
<br>
<table align="center" width="920" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;회원 수정</strong></td>
	</tr>

</table>
<br>
<form action="mypageModifyResult" name="userinput" method="post">
	<table class="memform_table" border="0" cellpadding="6" cellspacing="0" align="center">
		<tr>
			<td>
				<font color="red">*</font> ID(이메일)
			</td>
			<td>
				<input type="text" name="m_email" id="m_email" disabled="disabled" value="${mData.M_EMAIL}">
			</td>
		</tr>
		<tr>
			<td>
				<font color="red">*</font> 이름
			</td>
			<td>
				<input type="text" name="m_name" id="m_name" value="${mData.M_NAME}" maxlength="9">
			</td>
		</tr>
		<tr>
			<td>
				<font color="red">*</font> 패스워드
			</td>
			<td>
				<input type="password" name="m_password" id="m_password" value="${mData.M_PASSWORD}" maxlength="15">
			</td>
		</tr>
		<tr>
			<td>
				<font color="red">*</font> 패스워드 확인
			</td>
			<td>
				<input type="password" name="m_password2" id="m_password2" maxlength="15">
			</td>
		</tr>
		<tr>
			<td>
				<font color="red">*</font> 전화번호
			</td>
			<td>
				<input type="text" name="m_phone" id="m_phone" value="${mData.M_PHONE}" maxlength="13">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="reset" style="width: 113px" value="리  셋">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" style="width: 113px" value="수  정" onclick="modify();">
			</td>
		</tr>
	</table>
</form>


</body>
</html>