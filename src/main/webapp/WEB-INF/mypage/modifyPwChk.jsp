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
		<br><br><br><br><br><br><br><br><br><br>
</body>
</html>