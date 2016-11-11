<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>

<script type="text/javascript">
	function check_agree(form) {
		if (!form.agree.checked) {
			alertify.error('이용 약관에 동의 후 회원가입을 진행하실 수 있습니다.');
			form.agree.focus();
			return false;
		}
		
		if (!form.agree2.checked) {
			alertify.error('개인 정보 수집에 동의 후 회원가입을 진행하실 수 있습니다.');
			form.agree2.focus();
			return false;
		}
	}
</script>

<style type="text/css">
input.agree_btn {
	width: 200px;
	height: 50px;
}

textarea {
	border: 1px solid red;
}
</style>

</head>

<body>

<form action="<c:url value="/members/form"/>" method="post" onsubmit="return check_agree(this);">
	<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3">
				<strong>&nbsp;&nbsp;이용 약관</strong>
			</td>
		</tr>
		<tr height="25">
			<td></td>
		</tr>
	</table>

	<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">
		<tr align="center">
			<td align="center">
				<textarea rows="10" cols="90" readonly><%@ include file="/WEB-INF/include/agreeDocument1.jspf"%></textarea>
			</td>
		</tr>
		<tr height="20">
			<td></td>
		</tr>
		<tr align="center">
			<td align="center">
				<input type="checkbox" name="agree" value="anything">
				<font size="2"> 위 이용 약관에 동의합니다.</font>
			</td>
		</tr>

		<tr height="20">
			<td></td>
		</tr>

		<tr align="center" bgcolor="#FF2929" height="1">
			<td colspan="4"></td>
		</tr>
	</table>

	<br>

	<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3">
				<strong>&nbsp;&nbsp;개인 정보 수집</strong>
			</td>
		</tr>
		<tr height="25">
			<td></td>
		</tr>
	</table>
	
	<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">
		<tr align="center">
			<td align="center">
				<textarea rows="10" cols="90" readonly><%@ include file="/WEB-INF/include/agreeDocument1.jspf"%></textarea>
			</td>
		</tr>
		<tr height="20">
			<td></td>
		</tr>
		<tr align="center">
			<td align="center">
				<input type="checkbox" name="agree2" value="anything">
				<font size="2"> 위 개인 정보 수집에 동의합니다.</font>
			</td>
		</tr>
		<tr height="20">
			<td></td>
		</tr>
		<tr align="center" bgcolor="#FF2929" height="1">
			<td colspan="4"></td>
		</tr>
	</table>

	<br>

	<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">
		<tr align="center">
			<td align="center">
				<input type="button" value="회원 가입 취소" class="agree_btn" onclick="location.href='<c:url value="/meetings"/>'" />
			</td>
			<td align="center">
				<input type="submit" value="회원 가입 진행" class="agree_btn"/>
			</td>
		</tr>
	</table>
</form>

</body>
</html>