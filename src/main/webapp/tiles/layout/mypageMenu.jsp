<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/menubar.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/boardview.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/root.css'/>" type="text/css">
<title></title>
</head>
<body>
<center>
<nav id="topMenu">
   <ul>
      <li class="topMenuLi">
      	<a class="menuLink" href="mypageView">마이페이지 홈</a>
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="modifyPwChk">회원정보수정</a>
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="writeHistoryBoard">내가쓴글보기</a>
      		<ul class="submenu">
      			<li><a href="writeHistoryBoard" class="submenuLink">게시판내역</a></li>
      			<li><a href="cmtHistory" class="submenuLink">답글내역</a></li>
      			<li><a href="writeHistoryOmeet" class="submenuLink">모임개설내역</a></li>
      		</ul>	
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="meetHistory">모임참여내역</a>
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="qnaHistory">문의내역</a>
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="mypageDeleteForm">회원탈퇴</a>
      </li>
   </ul>
</nav>
</body>
</html>
