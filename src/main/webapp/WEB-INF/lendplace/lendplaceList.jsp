<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.list.css"/>">
<script src="<c:url value="/resources/js/meetings.list.js"/>"></script>

<!-- 여기부터 기존헤드 안에 부트스트랩 헤드부분 복붙함 --> 
    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Universal - All In 1 Template</title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,700,800' rel='stylesheet' type='text/css'>

    <!-- Bootstrap and Font Awesome css -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Css animations  -->
    <link href="resources/bootstrap/uni/css/animate.css" rel="stylesheet">

    <!-- Theme stylesheet, if possible do not edit this stylesheet -->
    <link href="resources/bootstrap/uni/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- Custom stylesheet - for your changes -->
    <link href="resources/bootstrap/uni/css/custom.css" rel="stylesheet">

    <!-- Responsivity for older IE -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

    <!-- Favicon and apple touch icons-->
    <link rel="shortcut icon" href="resources/bootstrap/uni/img/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="resources/bootstrap/uni/img/apple-touch-icon.png" />
    <link rel="apple-touch-icon" sizes="57x57" href="resources/bootstrap/uni/img/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="resources/bootstrap/uni/img/apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="resources/bootstrap/uni/img/apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="resources/bootstrap/uni/img/apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="resources/bootstrap/uni/img/apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="resources/bootstrap/uni/img/apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="resources/bootstrap/uni/img/apple-touch-icon-152x152.png" />

    <!-- owl carousel css -->

    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">

</head>

<body>
<table border="0" cellpadding=15 width=900px align=center>
<tr>

<!-- 장소 리스트 -->
<td width="80%">
<table border="0" width=100% cellpadding=5>
<tr>
<td colspan="3"><font style="font-weight: bold;font-size: x-large;">장소</font></td>
</tr>

<c:choose>
	<c:when test="${fn:length(list) > 0 }">
		<c:forEach items="${list}" var="row" varStatus="status">
			
			<c:if test="${status.index%3 == 0}">
			<tr>
			</c:if>
			
			<td width="33%" align="center">
				<table class="om_img_base">
					<tr>
						<td colspan="2">
							<a href="#this" id="title" onclick="fn_lendplaceDetail($(this))"><img id="repIMG" src='${row.L_REP_IMG }'/></a>
							<input type="hidden" id="l_no" value="${row.L_NO }">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="om_view_title">
							<a href="#this" id="title" onclick="fn_lendplaceDetail($(this))">${row.L_TITLE }</a>
							<input type="hidden" id="l_no" value="${row.L_NO }">
						</td>
					</tr>
					
				</table>
			</td>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td width=100%><h3>등록된 게시물이 없습니다.</h3></td>
		</tr>
	</c:otherwise>
</c:choose>




<!-- 페이징 -->
<tr>
<td colspan="3" class="paging">${pagingHtml }</td>
</tr>

</table>

<td width="20%" valign="top">

<div class="title" style="padding-top:53px;">장소 키워드검색</div>
<div style="padding-left:2.2px;padding-right:2.2px;">
<form name="search_form" action="<c:url value="/lendplace"/>" method="post">
<input id="search_people" type="hidden" name="search_people">
<input id="search_area" type="hidden" name="search_area">
<input id="search_payment" type="hidden" name="search_payment">
<input id="searchbox" type="text" name="searchWord" value="${searchWord }" maxlength="13" placeholder="예)역삼동,음향,주차 등" title="예)역삼동,음향,주차 등"/>
<input type="image" src="/TEP/static/image/btnEventSearch.gif" class="btnEventSearch" alt="검색" onmouseover="this.src='/TEP/static/image/btnEventSearchOn_red.gif'" onmouseout="this.src='/TEP/static/image/btnEventSearch.gif'">
</form>
</div>
<br>

<div class="title">수용인원</div>
<table class="people">
<tr>
<td>0~20명</td>
<td>20~50명</td>
</tr>
<tr>
<td>50~100명</td>
<td>100명이상</td>
</tr>
</table>

<br>

<div class="title">지역</div>
<table class="area">
<tr>
<td>서울</td>
<td>부산|울산|경남</td>
</tr>
<tr>
<td>인천|경기</td>
<td>대전|충정|세종</td>
</tr>
<tr>
<td>광주|전라</td>
<td>강원</td>
</tr>
<tr>
<td>대구|경북</td>
<td>제주</td>
</tr>
</table>

<br>

<div class="title">유/무료</div>
<table class="payment">
<tr>
<td>유료</td>
<td>무료</td>
</tr>
</table>



</table>


<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("#write").on("click", function(e){ // 모임 개설
            e.preventDefault();
	        if(isLoginCheck("${sessionScope.session_m_email}")){
            	fn_meetingsWrite();
	        }
        });
    });
     
    
    function fn_lendplaceDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/lendplace/detail' />");
        cs.addParam("l_no", obj.parent().find("#l_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 

<!-- 여기부터 부트스트랩  -->

        <div id="content">
            <div class="container">

                <div class="row">

                    <!-- *** LEFT COLUMN ***
			_________________________________________________________ -->

						<div class="col-md-9">
                            <div class="heading">
                                <h2>장소</h2>
                            </div>

                            <p class="lead">모임 목적에 맞는 장소를 선택해 보세요.</p>
                       
                       
 <div class="row portfolio no-space">

                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-1.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->

                        </div>

                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-2.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->

                        </div>

                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-3.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->

                        </div>

                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-4.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->
                        </div>

                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-5.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->
                        </div>

                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-6.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->
                        </div>

                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-7.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->
                        </div>
                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-9.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->
                        </div>
                        <div class="col-sm-4">
                            <div class="box-image">
                                <div class="image">
                                    <img src="resources\bootstrap\uni\img/portfolio-8.jpg" alt="" class="img-responsive">
                                </div>
                                <div class="bg"></div>
                                <div class="name">
                                    <h3><a href="portfolio-detail.html">Portfolio box-image</a></h3> 
                                </div>
                                <div class="text">
                                    <p class="hidden-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                                    <p class="buttons">
                                        <a href="portfolio-detail.html" class="btn btn-template-transparent-primary">View</a>
                                        <a href="#" class="btn btn-template-transparent-primary">Website</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-image -->
                        </div>

                    </div>                      
                       
                       
                       
                       <ul class="pagination">
                                    <li><a href="#">«</a>
                                    </li>
                                    <li><a href="#">1</a>
                                    </li>
                                    <li><a href="#">2</a>
                                    </li>
                                    <li><a href="#">3</a>
                                    </li>
                                    <li><a href="#">4</a>
                                    </li>
                                    <li><a href="#">5</a>
                                    </li>
                                    <li><a href="#">»</a>
                                    </li>
                                </ul>
                       
                       
                       
                       
                       
                        </div>




                    <!-- *** LEFT COLUMN END *** -->

                    <!-- *** RIGHT COLUMN ***
				_________________________________________________________ -->

                    <div class="col-md-3">

                        <!-- *** MENUS AND WIDGETS ***
 _________________________________________________________ -->
                        <div class="panel panel-default sidebar-menu">

                            <div class="panel-heading">
                                <h3 class="panel-title">장소 키워드 검색</h3>
                            </div>

                            <div class="panel-body">
                                <form role="search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="예) 역삼동, 음향, 주차 등">
                                        <span class="input-group-btn">

		    <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button>

		</span>
                                    </div>
                                </form>
                            </div>
                        </div>


                        <div class="panel sidebar-menu">
                            <div class="panel-heading">
                                <h3 class="panel-title">수용인원</h3>
                            </div>

                            <div class="panel-body">
                                <ul class="tag-cloud">
                                    <li><a href="#"><i class="fa fa-tags"></i> 0~20명</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 20~50명</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 50~100명</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 100명이상</a> 
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="panel sidebar-menu">
                            <div class="panel-heading">
                                <h3 class="panel-title">지역</h3>
                            </div>

                            <div class="panel-body">
                                <ul class="tag-cloud">
                                    <li><a href="#"><i class="fa fa-tags"></i> 서울</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 부산|울산|경남</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 인천|경기</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 대전|충청|세종</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 광주|전라</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 강원</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 대구|경북</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 제주</a> 
                                    </li>
                                </ul>
                            </div>
                        </div>                        
                        
                        <div class="panel sidebar-menu">
                            <div class="panel-heading">
                                <h3 class="panel-title">유/무료</h3>
                            </div>

                            <div class="panel-body">
                                <ul class="tag-cloud">
                                    <li><a href="#"><i class="fa fa-tags"></i> 유료</a> 
                                    </li>
                                    <li><a href="#"><i class="fa fa-tags"></i> 무료</a> 
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- *** MENUS AND FILTERS END *** -->

                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** RIGHT COLUMN END *** -->


                </div>
                <!-- /.row -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->



</body>
</html>