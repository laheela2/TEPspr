<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>" type="text/css">
</head>
<body>

<div class="loginBar">
	<span style="float:left;padding-left:10px;">
	<a href="<c:url value="/meetings"/>">모임</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	<a href="<c:url value="/lendplace"/>">장소</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	<a href="<c:url value="/board"/>">게시판</a>
	</span>
	<span>
		<c:if test="${sessionScope.session_m_email == null }">
			<a href="<c:url value="/login"/>">로그인</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${sessionScope.session_m_email != null }">
			<a href="<c:url value="/logout"/>">로그아웃</a>&nbsp;&nbsp;|&nbsp;&nbsp;	
			<a href="<c:url value="/mypageView"/>">마이페이지</a>&nbsp;&nbsp;
		</c:if>
	</span>
</div>

<form name="search_form" action="<c:url value="/search"/>" method="post">
	<table class="searchBar" align=center>
		<tr>
			<td class="logo">
				<a href="<c:url value="/meetings"/>">
					<img border="0" width="90px" src="<c:url value='/resources/image/tep_logo_red.png'/>"/>
				</a>
			</td>
			<td style="padding-right: 10px; padding-left: 20px;">
				<input type="text" name="searchWord" size="50">
			</td>
			<td>
				<input class="search_btn" type="submit" value="검  색">
			</td>
		</tr>
	</table>
</form>

<hr color=red>
<br>
</body>
</html>