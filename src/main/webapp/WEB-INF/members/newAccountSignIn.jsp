<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_home').addClass('active'); });</script>
</head>
<body>

<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1>회원가입 / 로그인</h1>
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
    <div class="container">

        <div class="row">
            <div class="col-md-6">
                <div class="box">
                    <h2 class="text-uppercase">회원가입</h2>

                    <p class="lead">아직 회원등록을 하지 않으셨나요?</p>
                    <p>재능을 공유 해보세요. <br>개인이 가지고 있는 다양한 재능을 펼칠 수 있습니다.</p>

					<spring:hasBindErrors name="mem"/>
                    <form action="<c:url value="/register"/>" method="post">
                        <div class="form-group">
                            <label for="name-login">이름</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="mem.m_name"/>
                            <input type="text" class="form-control" id="name-login" name="m_name" value="${mem.m_name }"/>
                        </div>
                        <div class="form-group">
                            <label for="email-login">이메일</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="mem.m_email"/>
                            <input type="text" class="form-control" id="email-login" name="m_email" value="${mem.m_email }"/>
                        </div>
                        <div class="form-group">
                            <label for="password-login">비밀번호</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="mem.m_password"/>
                            <input type="password" class="form-control" id="password-login" name="m_password" value="${mem.m_password }"/>
                        </div>
                        <div class="form-group">
                            <label for="phone-login">전화번호</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="mem.m_phone"/>
                            <input type="text" class="form-control" id="phone-login" name="m_phone" value="${mem.m_phone }"/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-template-main"><i class="fa fa-user-md"></i> 가입</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box">
                    <h2 class="text-uppercase">로그인</h2>

                    <p class="lead">이미 회원 인가요?</p>
                    <p class="text-muted">다양한 활동이 많이 준비되어있습니다. 많은 참여부탁드립니다.</p>

					<spring:hasBindErrors name="login"/>
                    <form action="<c:url value="/login"/>" method="post">
                        <div class="form-group">
                            <label for="email">이메일</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="login.m_email"/>
                            <input type="text" class="form-control" id="email" name="m_email" value="${login.m_email }">
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="login.m_password"/>
                            <input type="password" class="form-control" id="password" name="m_password" value="${login.m_password }">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-template-main"><i class="fa fa-sign-in"></i> 로그인</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
</div>
<!-- /#content -->

</body>
</html>