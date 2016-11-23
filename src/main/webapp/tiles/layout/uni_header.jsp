<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript">
	function fn_mypage_link(){
		if(isLoginCheck('${sessionScope.session_m_email}')){
			location.href='<c:url value="/mypage/view"/>';
		}
	}
</script>
</head>
<body>



<header>

	<!-- *** TOP ***-->
	<div id="top">
		<div class="container">
			<div class="row">
				<div class="col-xs-5 contact">
					<p class="hidden-sm hidden-xs">Contact us on +82 02 333 9999 or contact@tep.com</p>
				</div>
				<div class="col-xs-7">
					<div class="login">
						<c:if test="${sessionScope.session_m_email == null }">
							<a href="#" data-toggle="modal" data-target="#login-modal">
								<i class="fa fa-sign-in"></i> <span class="hidden-xs text-uppercase">로그인</span>
							</a>
							<a href="<c:url value="/login"/>">
								<i class="fa fa-user"></i> <span class="hidden-xs text-uppercase">회원가입</span>
							</a>
						</c:if>
						<c:if test="${sessionScope.session_m_email != null }">
							<a href="<c:url value="/logout"/>">
								<i class="fa fa-sign-out"></i> <span class="hidden-xs text-uppercase">로그아웃</span>
							</a>
							<a href="<c:url value="/mypage/view"/>">
								<i class="fa fa-pencil-square-o"></i> <span class="hidden-xs text-uppercase">마이페이지</span>
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- *** TOP END *** -->

	<!-- *** NAVBAR ***-->

	<div class="navbar-affixed-top" data-spy="affix" data-offset-top="200">

		<div class="navbar navbar-default yamm" role="navigation" id="navbar">

			<div class="container">
				<div class="navbar-header">

					<a class="navbar-brand home" href="<c:url value="/main"/>">
						<img src="<c:url value="/resources/bootstrap/uni/img/logo.png"/>" alt="Tep logo" class="hidden-xs hidden-sm">
						<img src="<c:url value="/resources/bootstrap/uni/img/logo.png"/>" alt="Tep logo" class="visible-xs visible-sm">
						<span class="sr-only">TEP - 홈으로</span>
					</a>
					<div class="navbar-buttons">
						<button type="button" class="navbar-toggle btn-template-main" data-toggle="collapse" data-target="#navigation">
							<span class="sr-only">토글 버튼</span> <i class="fa fa-align-justify"></i>
						</button>
					</div>
				</div>
				<!--/.navbar-header -->

				<div class="navbar-collapse collapse" id="navigation">

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown" id="nav_home">
                            <a href="javascript: void(0)" class="dropdown-toggle" data-toggle="dropdown" style="text-decoration: none;"><i class="fa fa-home"></i>홈 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                	<a href="<c:url value="/login"/>"><i class="fa fa-male"></i>회원가입 / 로그인</a>
                                </li>
                                <li>
                                	<a href="<c:url value="/find/account"/>"><i class="fa fa-envelope-o"></i>이메일 / 비번 찾기</a>
                                </li>
                                <li>
                                	<a href="#this" onclick="fn_mypage_link();"><i class="fa fa-edit"></i>마이페이지</a>
                                </li>
                                <li>
                                	<a href="<c:url value="/qna"/>"><i class="fa fa-question-circle"></i>Qna</a>
                               	</li>
                            </ul>
                        </li>
						<li class="dropdown" id="nav_meetings">
                            <a href="javascript: void(0)" class="dropdown-toggle" data-toggle="dropdown" style="text-decoration: none;"><i class="fa fa-users"></i>모임 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                	<a href="<c:url value="/meetings"/>"><i class="fa fa-list"></i>목록으로 보기</a>
                                </li>
                                <li>
                                	<a href=""><i class="fa fa-map-marker"></i>지도로 보기</a>
                                </li>
                                <li>
                                	<a href="<c:url value="/board"/>"><i class="fa fa-table"></i>게시판</a>
                                </li>
                                <li>
                                	<a href="#" onclick="fn_meetingsWrite();"><i class="fa fa-send"></i>모임 개설하기</a>
                                </li>
                            </ul>
                        </li>					
						<li id="nav_lendplace">
							<a href="<c:url value="/lendplace"/>" style="text-decoration: none;"><i class="fa fa-building"></i>장소</a>
						</li>
						<li id="nav_videolec">
							<a href="<c:url value="/videolec"/>" style="text-decoration: none;"><i class="fa fa-youtube-play"></i>영상</a>
						</li>
						
						<!-- ========== FULL WIDTH MEGAMENU ================== -->
						<li class="dropdown use-yamm yamm-fw" id="nav_all">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200" style="text-decoration: none;">
								<i class="fa fa-info"></i>전체 <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li>
									<div class="yamm-content">
										<div class="row">
											<div class="col-lg-3">
												<h4><i class="fa fa-home"></i>  홈</h4>
												<ul>
													<li><a href="<c:url value="/login"/>"><i class="fa fa-male"></i>회원가입 / 로그인</a></li>
													<li><a href="<c:url value="/find/account"/>"><i class="fa fa-envelope-o"></i>이메일 / 비번 찾기</a></li>
													<li><a href="#this" onclick="fn_mypage_link();"><i class="fa fa-edit"></i>마이페이지</a></li>
													<li><a href="<c:url value="/qna"/>"><i class="fa fa-question-circle"></i>Qna</a></li>
												</ul>
											</div>
											<div class="col-lg-3">
												<h4><i class="fa fa-users"></i>  모임</h4>
												<ul>
													<li><a href="<c:url value="/meetings"/>"><i class="fa fa-list"></i>목록으로 보기</a></li>
													<li><a href=""><i class="fa fa-map-marker"></i>지도로 보기</a></li>
													<li><a href="<c:url value="/board"/>"><i class="fa fa-table"></i>게시판</a></li>
													<li><a href="#" onclick="fn_meetingsWrite();"><i class="fa fa-send"></i>모임 개설하기</a></li>
												</ul>
											</div>
											<div class="col-lg-3">
												<h4><i class="fa fa-building"></i>  장소</h4>
												<ul>
													<li><a href="<c:url value="/lendplace"/>" style="text-decoration: none;"><i class="fa fa-list"></i>장소목록</a></li>
												</ul>
											</div>
											<div class="col-lg-3">
												<h4><i class="fa fa-youtube-play"></i>  영상</h4>
												<ul>
													<li><a href="<c:url value="/videolec"/>" style="text-decoration: none;"><i class="fa fa-list"></i>영상목록</a></li>
												</ul>
											</div>
											</div>
										</div>
									</div> <!-- /.yamm-content -->
								</li>
							</ul></li>
						<!-- ========== FULL WIDTH MEGAMENU END ================== -->

					</ul>

				</div>
				<!--/.nav-collapse -->



				<div class="collapse clearfix" id="search">

					<form class="navbar-form" role="search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search">
							<span class="input-group-btn">

								<button type="submit" class="btn btn-template-main">
									<i class="fa fa-search"></i>
								</button>

							</span>
						</div>
					</form>

				</div>
				<!--/.nav-collapse -->

			</div>


		</div>
		<!-- /#navbar -->

	</div>

	<!-- *** NAVBAR END *** -->

</header>

<!-- *** LOGIN MODAL *** -->

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
	<div class="modal-dialog modal-sm">

		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="Login">로그인</h4>
			</div>
			<div class="modal-body">
				<form action="<c:url value="/login"/>" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="email_modal" placeholder="이메일" name="m_email">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password_modal" placeholder="비밀번호" name="m_password">
					</div>

					<p class="text-center">
						<button class="btn btn-template-main">
							<i class="fa fa-sign-in"></i> 로그인
						</button>
					</p>
				</form>

				<p class="text-center text-muted">아직 회원이 아니신가요?</p>
				<p class="text-center text-muted">
					<a href="<c:url value="/login"/>"><strong>지금 등록하세요.</strong></a>
					<br>다양한 모임이 당신을 기다리고 있습니다.
				</p>

			</div>
		</div>
	</div>
</div>

<!-- *** LOGIN MODAL END *** -->

	<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
	function fn_meetingsWrite() {
		if (isLoginCheck("${sessionScope.session_m_email}")) {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/meetings/write' />");
			cs.submit("GET");
		}
	}
</script>


</body>
</html>