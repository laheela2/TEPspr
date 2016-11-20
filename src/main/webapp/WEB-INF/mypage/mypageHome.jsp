<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
</head>
<body>
<!-- 	<div class="container">
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
					<li><a href="writeHistoryBoard">게시판내역</a></li>
					<li><a href="cmtHistory">답글내역</a></li>
					<li><a href="writeHistoryOmeet">모임개설내역</a></li>
					<li><a href="meetHistory">모임참여내역</a></li>
					<li><a href="qnaHistory">문의내역</a></li>
					<li><a href="mypageDeleteForm">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		*** MENUS AND FILTERS END ***
	</div> -->
<div class="col-md-9">
<div class="table-responsive">
	<div class="heading">
		<h3>회원정보</h3>
	</div>
	<br>

	
		<table class="table">
			<tbody>
				<tr>
					<td width="100" align="right">회원번호 :</td>
					<td>${mData.M_NO}</td>
				</tr>
				<tr>
					<td width="100" align="right">이 메	일 :</td>
					<td>${sessionScope.session_m_email }</td>
				</tr>
				<tr>
					<td width="100" align="right">이	름 :</td>
					<td>${mData.M_NAME}</td>
				</tr>
				<tr>
					<td width="100" align="right">전화번호 :</td>
					<td>${mData.M_PHONE}</td>
				</tr>
				<tr>
					<td width="100" align="right">가입날짜 :</td>
					<td>${mData.M_DATE}</td>
				</tr>
				<tr><td></td><td></td></tr>
			</tbody>
		</table>

	</div>
	</div>
	</div>
	</div>
</body>
</html>