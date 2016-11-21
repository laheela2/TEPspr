<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.list.css"/>">
<script src="<c:url value="/resources/js/meetings.list.js"/>"></script>

</head>

<body>


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

		<c:choose>
			<c:when test="${fn:length(list) > 0 }">
				<c:forEach items="${list}" var="row" varStatus="status">
					
					<c:if test="${status.index%3 == 0}">
					<tr>
					</c:if>
					
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
                                      
                  
<tr>
<td colspan="3" class="paging">${pagingHtml }</td>
</tr>  

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