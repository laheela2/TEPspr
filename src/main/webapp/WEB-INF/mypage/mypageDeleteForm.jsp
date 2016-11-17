<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" href="<c:url value='/resources/css/root.css'/>" type="text/css">
<script>
	function check() {
		var join = document.userinput
		
		if (join.m_password.value == "") {
			alertify.error("비밀번호를 입력하세요");
			join.m_password.focus();
			return false;
		} else {
			alertify.set({ buttonReverse: true, 
				labels: {
				    ok     : "회원탈퇴",
				    cancel : "취소하기"
				}	
			});
			alertify.confirm("모든 데이터가 삭제됩니다. 그래도 진행 하시겠습니까?<br><br>", function (e) {
			    if (e) {
			        join.submit();
			    }
			});
		}
	}
</script>
</head>
<body>

		<br>
		<table align="center" width="920" border="0" cellspacing="0" cellpadding="0">
			<tr height="25">
				<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
				<td align="left" colspan="3">
					<strong>&nbsp;&nbsp;회원 탈퇴</strong>
				</td>
			</tr>

		</table>

		<br>
	<form name="userinput" action="mypageDeleteResult" method="post">
		<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

			<tr bgcolor="#FF2929">
				<td height="1"></td>
			</tr>

			<tr height="20">
				<td></td>
			</tr>

			<tr align="center">
				<td align="center">
					<font size="2">비밀번호를 입력하세요</font><br> <br>
					<input type="text" name="m_password" maxlength="20" />
				</td>
			</tr>

			<tr height="20">
				<td style="font-family: sans-serif;font-size: xx-small;color: navy;font-weight: bold;padding-top:13px;padding-bottom:13px;">*비밀번호를 입력하는 즉시 회원탈퇴가 진행됨으로 신중하게 입력하시기 바랍니다.</td>
			</tr>

			<tr bgcolor="#FF2929">
				<td height="1"></td>
			</tr>

		</table>

		<br>
	
		<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center">
					<!-- <input type="submit" value="탈 퇴"> -->
					<input type="button" value="탈   퇴" style="width: 130px;" onclick="check();"/>
				</td>
			</tr>
		</table>
	</form>

		<br> <br>
</body>
</html>