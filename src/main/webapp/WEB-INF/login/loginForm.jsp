<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script>
	function insert() {
		var join = document.userinput
		var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

		if (join.m_email.value == "") {
			alertify.error("이메일을 입력해주세요");
			join.m_email.focus();
			return false;
		}

		if (!join.m_email.value.match(regExp)) {
			alertify.error("이메일 형식과 맞지 않습니다.");
			userinput.m_email.focus();
			return false;
		}

		if (join.m_password.value == "") {
			alertify.error("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		}

		join.submit();
	}

	function enterkey() {
		if (event.keyCode == 13) {
			insert();
		}
	}

	function idFocus() {
		document.getElementById('id').focus();
	}

	function findId() {
		var url = "findId";
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=130");
	}
	
	function findPassword() {
		var url = "findPassword";
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=130");
	}
</script>

<style type="text/css">
table.loginform_border{
	border:1px solid red;
	padding:1%;
	margin:1%;
}

input.id, input.pw {
	width: 250px;
	height: 30px;
}

input.login_btn{
	width: 253px;
	height: 50px;
}
input.sub_btn{
	width: 100px;
}
input.sub_btn2{
	width: 69px;
}
</style>

</head>
<body onload="idFocus();">
<center>
<form action="<c:url value="/login"/>" method="post" name="userinput">
<table class="loginform_border" align=center>
<tr><td>
	<table class="loginform_inner_table" border="0" align=center cellspacing=10>
		<tr>
			<td colspan="2">
				<input class="id" id="id" type="text" name="m_email" maxlength="20" style="ime-mode: disabled" placeholder=" 이메일을 입력해주세요" onkeypress="enterkey();" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input class="pw" type="password" name="m_password" maxlength="20" placeholder=" 비밀번호를 입력해주세요" onkeypress="enterkey();" />
			</td>
		</tr>

		<tr>
			<td colspan="2" align="center">
				<input class="login_btn" type="button" value="로그인" onclick="insert()">
			</td>
		</tr>

		<tr>
			<td>
			<table style="margin:0; padding:0;">
				<tr align="center">
					<td><input class="sub_btn2" type="button" onclick="findId();" value="ID찾기" /></td>
					<td><input class="sub_btn2" type="button" onclick="findPassword();" value="PW찾기" /></td>
				</tr>
			</table>
			
			
				
			</td>
			<td align="right">
				<input class="sub_btn" type="button" onclick="location.href='<c:url value="agreement"/>'" value="회원가입" />
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
</form>
</body>
</html>