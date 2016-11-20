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
                <h1>이메일 / 비번 찾기</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a>
                    </li>
                    <li>이메일 / 비번 찾기</li>
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
                    <h2 class="text-uppercase">이메일 찾기</h2>

                    <p class="lead">가입시에 등록했던 이름과 전화번호를 입력해주세요.</p>

					<spring:hasBindErrors name="email"/>
                    <form action="<c:url value="/register"/>" method="post">
                        <div class="form-group">
                            <label for="name-login">이름</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="email.m_name"/>
                            <input type="text" class="form-control" id="name-login" name="m_name" value="${email.m_name }"/>
                        </div>
                        <div class="form-group">
                            <label for="phone-login">전화번호</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="email.m_phone"/>
                            <input type="text" class="form-control" id="phone-login" name="m_phone" value="${email.m_phone }"/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-template-main"><i class="fa fa-user-md"></i> 찾기</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box">
                    <h2 class="text-uppercase">로그인</h2>

                    <p class="lead">이미 회원 인가요?</p>
                    <p class="text-muted">다양한 활동이 많이 준비되어있습니다. 많은 참여부탁드립니다.</p>

                    <hr>

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