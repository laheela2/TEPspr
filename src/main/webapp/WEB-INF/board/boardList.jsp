<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_meetings').addClass('active'); });</script>
</head>
<body>

	<div id="heading-breadcrumbs">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-6">
	                <h1>게시판</h1>
	            </div>
	            <div class="col-md-6">
	                <ul class="breadcrumb">
	                    <li><a href="<c:url value="/meetings"/>">모임</a></li>
	                    <li>게시판</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">

				<div class="panel panel-default">
					<div class="panel-heading">스승과 제자 및 일반으로 게시물을 분리해 서로의 정보를 교환후 모임을 개설해 보세요.<i class="fa fa-smile-o"></i></div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>종류</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(list) > 0}">
											<c:forEach items="${list }" var="row">
												<tr>
													<td>${row.B_NO}</td>
													<td>
														<span class="label label-danger">
														<c:if test="${row.B_KIND == 0}">일반게시물</c:if>
														<c:if test="${row.B_KIND == 1 }">스승찾아요</c:if>
														<c:if test="${row.B_KIND == 2 }">제자찾아요</c:if>
														</span>
													</td>
													<td>
														<a href="#this" onclick="fn_boardDetail('${row.B_NO}');">${row.B_TITLE}</a>
													</td>
													<td>${row.B_NAME}</td>
													<td>
														<fmt:formatDate value="${row.B_DATE}" pattern="yyyy.MM.dd" />
													</td>
													<td>${row.B_READCOUNT}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">조회된 결과가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<!-- /.table-responsive -->
					</div>

					<div class="col-lg-12" align="center">
						<ul class="pagination">${pagingHtml}</ul>
					</div>
					
					<!-- /.panel-body -->
				</div>


				<div class="col-md-12" align="center">
					<form method="post" action="<c:url value='/board'/>">
						<table>
							<tr>
								<td>
									<select name="searchKey" class="form-control">
										<option value="0" selected="selected">제목</option>
										<option value="1">제목+내용</option>
										<option value="2">작성자</option>
									</select>
								</td>
								<td>
									<input type="text" name="searchWord" size="33" maxlength="15" value="${searchWord }"/>
								</td>
								<td>
									<input type="submit" value="검색" />
								</td>
							</tr>
						</table>
					</form>

					<form method="post" action="<c:url value='/board'/>">
						<div class="col-md-4">
							<select name="searchKey" class="form-control">
								<option value="0" selected="selected">제목</option>
								<option value="1">제목+내용</option>
								<option value="2">작성자</option>
							</select>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="searchbox" name="searchWord" value="${searchWord }" maxlength="15">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-template-main">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>						
					</form>				
				</div>
			</div>
		</div>
	</div>


<%@ include file="/WEB-INF/include/common-body.jspf"%>
<script type="text/javascript">
    $(document).ready(function(){
        $("#write").on("click", function(e){ // 글쓰기 버튼
            e.preventDefault();
            if(isLoginCheck('${sessionScope.session_m_email}')){
            	fn_boardWrite();
            };
        }); 
    });
     
    function fn_boardWrite(){
    	if(isLoginCheck('${sessionScope.session_m_email}')){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/board/write' />");
	        cs.addParam("currentPageNo", "${currentPageNo}");
	        cs.submit("GET");
        };
    }
    
    function fn_boardDetail(b_no){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/board/detail' />");
        cs.addParam("b_no", b_no);
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script>


</body>
</html>