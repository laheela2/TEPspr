<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_meetings').addClass('active'); });</script>
<script src="<c:url value="/resources/js/meetings-list.js"/>"></script>
</head>

<body>

<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>모임목록</h1>
            </div>
            <div class="col-md-6">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a></li>
                    <li><a href="<c:url value="/meetings"/>">모임</a></li>
                    <li>목록으로 보기</li>
                </ul>

            </div>
        </div>
    </div>
</div>

<div id="content">
    <div class="container">
        <div class="row">
            <!-- *** LEFT COLUMN ***-->

            <div class="col-md-9" id="blog-listing-small">
				<div class="row portfolio no-space">
				    
			    <c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list }" var="row">
							<div class="col-sm-4">
								<div class="box-image">
									<div class="image">
										<img src="${row.MT_REP_IMG }" alt="" class="img-responsive">
									</div>
									<div class="bg"></div>
									<div class="name">
										<h3>
											<a href="#this" onclick="fn_meetingsDetailLink('${row.MT_NO}')">${row.MT_TITLE }</a>
										</h3>
									</div>
									<div class="text">
										<p class="hidden-sm">${row.MT_SUBJECT }</p>
										<p class="buttons">
											<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_meetingsDetailLink('${row.MT_NO}')">보기</a>
											<c:choose>
												<c:when test="${row.MT_PERMIT_PNUM <= 0 }">
													<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_meetingsApplyforDisable()">신청</a>
												</c:when>
												<c:otherwise>
													<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_meetingsApplyform('${row.MT_NO}')">신청</a>
												</c:otherwise>
											</c:choose>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-sm-12" align="center">
							<h4>등록된 게시물이 없습니다.</h4>
						</div>
					</c:otherwise>
				</c:choose>
				    
				</div>

				<div class="col-lg-12" align="center">
					<ul class="pagination">${pagingHtml}</ul>
				</div>

			</div>
            <!-- /.col-md-9 -->
            <!-- *** LEFT COLUMN END *** -->


            <!-- *** RIGHT COLUMN *** -->
			<div class="col-md-3">

				<!-- *** MENUS AND WIDGETS *** -->
				<div class="panel panel-default sidebar-menu">
					<button type="button" class="btn btn-lg btn-template-primary" onclick="fn_meetingsWrite();"> 모 임 개 설 하 기 </button>
				</div>
	
				<div class="panel panel-default sidebar-menu">
					<div class="panel-heading">
						<h3 class="panel-title">검색</h3>
					</div>
		
					<div class="panel-body">
						<form name="search_form" action="<c:url value="/meetings"/>" method="post" role="search" onsubmit="searchSubmit();">
							<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
							<input id="searchCate" type="hidden" name="searchCategory" value="${searchCategory }">
							<input id="searchAddr" type="hidden" name="searchAddr" value="${searchAddr }">
							<input id="searchMStart" type="hidden" name="searchMStart" value="${searchMStart }">
							<input id="searchMEnd" type="hidden" name="searchMEnd" value="${searchMEnd }">
							<div class="input-group">
								<input type="text" class="form-control" id="searchbox" name="searchWord" value="${searchWord }" placeholder="키워드 검색">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-template-main">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</form>
					</div>
				</div>

                <div class="panel sidebar-menu">
                    <div class="panel-heading">
                        <h3 class="panel-title">분류</h3>
                    </div>
					<div class="panel-body">
						<table class="category">
							<tr><td>교육</td><td>강연</td></tr>
							<tr><td>세미나|컨퍼런스</td><td>문화|예술</td></tr>
							<tr><td>방송|연예</td><td>취미활동</td></tr>
							<tr><td>소모임|친목행사</td><td>공모전</td></tr>
							<tr><td>전시|박람회</td><td>패션|뷰티</td></tr>
							<tr><td>이벤트|파티</td><td>여행</td></tr>
							<tr><td>후원금모금</td><td>기타</td></tr>
						</table>
                    </div>
                </div>

                <div class="panel sidebar-menu">
                    <div class="panel-heading">
                        <h3 class="panel-title">지역</h3>
                    </div>
                    <div class="panel-body">
						<table class="area">
							<tr><td>서울</td><td>부산|울산|경남</td></tr>
							<tr><td>인천|경기</td><td>대전|충정|세종</td></tr>
							<tr><td>광주|전라</td><td>강원</td></tr>
							<tr><td>대구|경북</td><td>제주</td></tr>
						</table>
                    </div>
                </div>

				<div class="panel sidebar-menu">
					<div class="panel-heading">
						<h3 class="panel-title">기간</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<input type="text" class="form-control dtpicker" id="startdt" placeholder="시작 날짜를 선택해 주세요.">
						</div>
						<div class="form-group">
							<input type="text" class="form-control dtpicker" id="enddt" placeholder="종료 날짜를 선택해 주세요.">
						</div>
						<p class="text-primary" style="font-size: x-small;font-weight: bold;">시작과 종료를 모두 선택해야 검색됩니다.</p>
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

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
	function fn_meetingsWrite(){
		if(isLoginCheck("${sessionScope.session_m_email}")){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/meetings/write' />");
	        cs.submit("GET");
		}
	}
	
    function fn_meetingsApplyforDisable(){
    	alertify.error("신청 마감된 모임입니다.");
    }
    
    function fn_meetingsApplyform(mt_no){
		if(isLoginCheck("${sessionScope.session_m_email}")){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/meetings/applyform' />");
	        cs.addParam("mt_no", mt_no);
	        cs.submit();
        }
    }
    
    function fn_meetingsDetailLink(mt_no){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/meetings/detail' />");
        cs.addParam("mt_no", mt_no);
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script>

</body>
</html>