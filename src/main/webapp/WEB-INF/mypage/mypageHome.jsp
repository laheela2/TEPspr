<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<style type="text/css">
table.mapage_view_body {
	width: 450px;
	border: 1px solid red;
	border-collapse: collapse;
	border-spacing: 0;
}
table.mapage_view_body td {
	font-family: sans-serif;
	border: 1px solid red;
	padding: 2%;
}
td.myinfo_title {
	font-family: sans-serif;
	font-weight: bold;
	text-align: right;
	width: 130px
}
</style>
</head>
<body>
	<br>
	<table align="center" width="920" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3">
				<strong>&nbsp;&nbsp;회원정보</strong>
			</td>
		</tr>
	</table>

	<br>

	<table class="mapage_view_body" align=center>
		<tr>
			<td class="myinfo_title">ID(이메일) :</td>
			<td>${sessionScope.session_m_email }</td>
		</tr>
		<tr>
			<td class="myinfo_title">이름 :</td>
			<td>${mData.M_NAME}</td>
		</tr>
		<tr>
			<td class="myinfo_title">전화번호 :</td>
			<td>${mData.M_PHONE}</td>
		</tr>
		<tr>
			<td class="myinfo_title">가입일자 :</td>
			<td><fmt:formatDate value="${mData.M_DATE}" pattern="yyyy.MM.dd"/></td>
		</tr>
	</table>

	<br>
	<br>

</body>
</html>