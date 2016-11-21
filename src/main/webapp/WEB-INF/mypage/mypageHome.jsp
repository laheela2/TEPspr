<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
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
                    <li><a href="<c:url value="/main"/>">홈</a>
                    </li>
                    <li>내 정보</li>
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
	</section>
</div>
</div>
</body>
</html>