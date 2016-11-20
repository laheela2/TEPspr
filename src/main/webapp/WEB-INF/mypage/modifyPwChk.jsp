<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script language="javascript">
	function check() {
		if (document.modifyPwChk.password.value == "") {
			alert("비밀번호를 입력하세요");
			document.modifyPwChk.m_password.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>
	<div class="col-md-9">
	<form name="modifyPwChk" action="mypageModifyForm" method="post" onsubmit="return check();">
		<div class="heading">
			<h3>회원정보수정</h3>
		</div>
		<br>

		<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

			<tr bgcolor="#FF2929">
				<td height="1"></td>
			</tr>

			<tr height="20">
				<td></td>
			</tr>

			<tr align="center">
				<td align="center">
					<font size="2">비밀번호를 입력하세요</font><br>
					<br>
					<input type="password" name="m_password" maxlength="20" />
				</td>
			</tr>

			<tr height="20">
				<td></td>
			</tr>

			<tr bgcolor="#FF2929">
				<td height="1"></td>
			</tr>

		</table>

		<br>

		<div class="text-center">
			<button type="submit" class="btn btn-template-main"><i class="fa fa-sign-in"></i> Next </button>
		</div>
</form>
</div>
</div>
</div>
</body>
</html>