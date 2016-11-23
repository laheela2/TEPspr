<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%-- <link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.list.css"/>"> --%>
<script src="<c:url value="/resources/js/lendplace-list.js"/>"></script>

</head>

<body>


<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    
    function fn_lendplaceDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/lendplace/detail' />");
        cs.addParam("l_no", obj.parent().find("#l_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 

<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>장소</h1>
            </div>
            <div class="col-md-6">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a></li>
                    <li>장소</li>
                </ul>

            </div>
        </div>
    </div>
</div>

<div id="content">
	<div class="container">
		<div class="row">

                    <!-- *** LEFT COLUMN ***
			_________________________________________________________ -->


<div class="col-md-9">

	<p class="lead">모임 목적에 맞는 장소를 선택해 보세요.</p>
                       
                       
<div class="row portfolio no-space">

		<c:choose>
			<c:when test="${fn:length(list) > 0 }">
				<c:forEach items="${list }" var="row">	
					
					<div class="col-sm-4">
						<div class="box-image">
							<div class="image">
								<img src="resources\bootstrap\uni\img/portfolio-4.jpg" alt="" class="img-responsive">
							</div>
							<div class="bg"></div>
							<div class="name">
								<h3><a href="#this" onclick="fn_lendplaceDetail($(this))">${row.L_TITLE }</a>
									<input type="hidden" id="l_no" value="${row.L_NO }"></h3> 
							</div>
							<div class="text">
								<p class="hidden-sm">${row.L_ADDR }</p>
								<p class="buttons">
									<a href="#this" onclick="fn_lendplaceDetail($(this))" class="btn btn-template-transparent-primary">View</a>
									<a href="#" class="btn btn-template-transparent-primary">Website</a>
									<input type="hidden" id="l_no" value="${row.L_NO }">
								</p>
							</div>
						</div>
							<!-- /.box-image -->
					</div>
					
					
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<tr>
					<td width=100%><h3>등록된 게시물이 없습니다.</h3></td>
				</tr>
			</c:otherwise>
		</c:choose>
                        
</div>                      
                                      
	<div class="col-lg-12" align="center">
		<ul class="pagination">${pagingHtml}</ul>
	</div>


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
			<form role="search" name="search_form" action="<c:url value="/lendplace"/>" method="post"  onsubmit="searchSubmit();">		
				<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
				<input id="searchCate" type="hidden" name="searchCategory" value="${searchCategory }">
				<input id="searchAddr" type="hidden" name="searchAddr" value="${searchAddr }">
				
				<div class="input-group">
					<input type="text" class="form-control" id="searchbox" name="searchWord" value="${searchWord }" placeholder="예) 강남, 마이크, 주차 등">
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
			<table class="category">
				<tr><td>0~20명</td><td>20~50명</td></tr>
				<tr><td>50~100명</td><td>100명이상</td></tr>
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
				<tr><td>인천|경기</td><td>대전|충청|세종</td></tr>
				<tr><td>광주|전라</td><td>강원</td></tr>
				<tr><td>대구|경북</td><td>제주</td></tr>
			</table>
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