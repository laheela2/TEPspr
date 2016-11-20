<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
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

                    <p class="text-muted">등록한 이름과 전화번호를 입력해주세요.</p>

					<hr>

					<spring:hasBindErrors name="email"/>
					<c:if test="${fn:length(email.message) > 0}">
						<div class="alert alert-info alert-dismissible" role="alert">
						    <button type="button" class="close" data-dismiss="alert">
						    	<span aria-hidden="true">×</span>
						    	<span class="sr-only">Close</span>
						    </button>
						    ${email.message }
						</div>
					</c:if>
                    <form action="<c:url value="/find/account/email"/>" method="post">
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
                            <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i> 찾기</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box">
                    <h2 class="text-uppercase">비번 찾기</h2>

					<p class="text-muted">등록한 이름, 이메일, 전화번호를 입력해주세요.</p>

					<hr>

					<spring:hasBindErrors name="pw"/>
					<c:if test="${fn:length(pw.message) > 0}">
						<div class="alert alert-info alert-dismissible" role="alert">
						    <button type="button" class="close" data-dismiss="alert">
						    	<span aria-hidden="true">×</span>
						    	<span class="sr-only">Close</span>
						    </button>
						    ${pw.message }
						</div>
					</c:if>	
                    <form action="<c:url value="/find/account/pw"/>" method="post">
                        <div class="form-group">
                            <label for="name-login">이름</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="pw.m_name"/>
                            <input type="text" class="form-control" id="name-login" name="m_name" value="${pw.m_name }"/>
                        </div>
                        <div class="form-group">
                            <label for="email-login">이메일</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="pw.m_email"/>
                            <input type="text" class="form-control" id="email-login" name="m_email" value="${pw.m_email }"/>
                        </div>
                        <div class="form-group">
                            <label for="phone-login">전화번호</label>&nbsp;&nbsp;&nbsp;
                            <form:errors cssClass="text-danger bg-danger small" path="pw.m_phone"/>
                            <input type="text" class="form-control" id="phone-login" name="m_phone" value="${pw.m_phone }"/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i> 찾기</button>
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