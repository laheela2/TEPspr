<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	window.onload = function () {
		var msg = [
		           '오늘은 날씨가 좋네요 ^_^',
		           '건강 조심하세요~♡',
		           '오늘도 행복하세요!!',
		           '힘내서 파이팅 하세요!',
		           '언제나 처럼 행복하게~♡',
		           '기적은 일어난답니다!!',
		           '자신을 믿어보세요!! 으쌰!!',
		           '자신을 사랑해주세요~♡',
		           ];
		var rnum = Math.floor(Math.random() * msg.length);
		
		document.getElementById("login_msg").innerHTML = msg[rnum];
	}
</script>

</head>
<body>
	
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1>로그인</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a>
                    </li>
                    <li>회원가입 / 로그인</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div id="content">
    <div class="container" id="contact">
        <section>
            <div class="row">
                <div class="col-md-12">
                    <section>
                        <div class="heading col-md-12" align="center">
                            <h2>${sessionScope.session_m_name }님</h2>
                        </div>
                        <p class="lead col-md-12" id="login_msg" align="center"></p>
                    </section>
                </div>
            </div>
        </section>

		<c:set var="savePageURI" value="${sessionScope.save_current_page_uri}"/>
        <section>
            <div class="row">
                <div class="${savePageURI != null ? 'col-md-4':'col-md-6' }">
                    <div class="box-simple">
                        <div class="icon" onclick="location.href='<c:url value="/mypage/view"/>'">
                            <i class="fa fa-pencil-square-o"></i>
                        </div>
                        <h3>마이페이지</h3>
                    </div>
                </div>

                <div class="${savePageURI != null ? 'col-md-4':'col-md-6' }">
                    <div class="box-simple">
                        <div class="icon" onclick="location.href='<c:url value="/main"/>'">
                            <i class="fa fa-home"></i>
                        </div>
                        <h3>홈</h3>
                    </div>
                </div>
               	
               	<c:if test="${savePageURI != null }">
	                <div class="col-md-4">
	                    <div class="box-simple">
	                        <div class="icon" onclick="location.href='<c:url value="${savePageURI}"/>'">
	                            <i class="fa fa-reply"></i>
	                        </div>
	                        <h3>이전페이지</h3>
	                    </div>
	                </div>
                </c:if>
            </div>

        </section>

    </div>
    <!-- /#contact.container -->
</div>
<!-- /#content -->	

</body>
</html>
