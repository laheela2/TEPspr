<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script>
	function check() {
		var join = document.userinput
		if (join.m_password.value == "") {
			alertify.error("비밀번호를 입력하세요");
			join.m_password.focus();
			return false;
		} else
			join.submit();
	}
</script>

</head>
<body>
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1>Mypage</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/mypageView"/>">마이페이지</a>
                    </li>
                    <li>패스워드 확인</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
	<div class="container features-buttons">
		<section>
			<div class="row">
<%@ include file="/WEB-INF/include/mypage2.jspf" %>
	<div class="col-md-9">
	<form name="userinput" action="mypageModifyForm" method="post">
		<div class="heading">
			<h3>회원정보수정</h3>
		</div>
		<br>

		<table class="table" align="center" width="265" >


			<tr align="center">
				<td align="center">
					<font size="2">비밀번호를 입력하세요</font><br>
					<br>
					<input type="password" name="m_password" maxlength="20" />
				</td>
			</tr>
		</table>
		<div class="text-center">
			<button type="button" class="btn btn-template-main" onclick="check();"><i class="fa fa-sign-in"></i> Next </button>
		</div>
		<table class="table"><td></td></table>
</form>
</div>
</div></section></div></div>
</body>
</html>