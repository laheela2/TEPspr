<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="<c:url value='/resources/css/root.css'/>" type="text/css">
<script type="text/javascript">

function validation(){
	if(document.findId.m_name.value==""){
		alert("이름을 입력해주세요.");
		document.findId.m_name.focus();
		return false;
	}
	if(document.findId.m_phone.value==""){
		alert("핸드폰번호를 입력해주세요");
		document.findId.m_phone.focus();
		return false;
	}
}

</script>
<style type="text/css">
body.find_pw_body{
	font-family: sans-serif;
}
</style>
</head>
<body class="find_Id_body">

<form action="findId" name="findId" method="post" onsubmit="return validation();">

<table align="center" width="100%" border="0" cellspacing="0" cellpadding="0">
	
	<tr height="25">
			<td bgcolor="red" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;ID 찾기</strong></td>
	</tr>
	
</table>

<br>

<table align="center" width="100%" border="0" cellspacing="0" cellpadding="0">

	<tr bgcolor="red">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#ffe9e9" width="100"><font size="2"><strong>이름</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="m_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="red">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#ffe9e9" width="100"><font size="2"><strong>핸드폰 번호</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="m_phone" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="red">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="15">
		<td></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="submit" value="ID 찾기" class="login1"/></td>
	</tr>
</table>

</form>

<br>

<body>

</body>
</html>