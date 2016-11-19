<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript">
	window.onload = function () {
		var msg = [
		           '모임을 개설하여 친구들을 만나보세요~!',
		           'TEP에서 좋은인연 만들어 보세요!',
		           '모두에게 재능을 전파해보세요^^',
		           '모임은 또다른 친구 입니다!',
		           '모임 개설을 망설이지 마세요^-^',
		           ];
		var rnum = Math.floor(Math.random() * msg.length);
		document.getElementById("register_msg").innerHTML = msg[rnum];
	}
</script>
</head>
<body>


<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1>회원가입 / 로그인</h1>
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
                        <div class="heading col-lg-12" align="center">
                            <h2>가입을 환영 합니다.</h2>
                        </div>

                        <p class="lead col-lg-12" id="register_msg" align="center"></p>
                    </section>
                </div>
            </div>

        </section>

        <section>

            <div class="row">
                <div class="col-md-6">
                    <div class="box-simple">
                        <div class="icon" onclick="location.href='<c:url value="/mypageView"/>'">
                            <i class="fa fa-pencil-square-o"></i>
                        </div>
                        <h3>마이페이지</h3>
                        <p>자신의 정보를 확인하거나 변경 할수 있습니다.</p>
                    </div>
                    <!-- /.box-simple -->
                </div>


                <div class="col-md-6">

                    <div class="box-simple">
                        <div class="icon" onclick="location.href='<c:url value="/meetings"/>'">
                            <i class="fa fa-group"></i>
                        </div>
                        <h3>모임</h3>
                        <p>다양한 모임에 참가하거나, 자신의 모임을 개설할수 있습니다.</p>
                    </div>
                    <!-- /.box-simple -->

                </div>
                
            </div>

        </section>

    </div>
    <!-- /#contact.container -->
</div>
<!-- /#content -->


</body>
</html>
