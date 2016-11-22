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
					<div class="panel-heading">이곳은 재능을 나누고자 하는 사람, 배움을 얻고 싶은 사람 사이를 이어주는 매칭 게시판 입니다.<i class="fa fa-smile-o"></i></div>
					<br/>
					<div class="text-right">
					<button type="button" class="btn btn-template-main" onclick="fn_boardWrite();">
						<i class="fa fa-pencil"></i> 글쓰기
					</button>
					</div>
					
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

				<div class="col-lg-12" align="center">
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
									<input type="text" name="searchWord" size="19" maxlength="15" value="${searchWord }" class="form-control"/>
								</td>
								<td>
									<button type="submit" class="btn btn-template-main">
										<i class="fa fa-search"></i>
									</button>
								</td>
							</tr>
						</table>
						<br/>
					</form>
				</div>
				
			</div>
		</div>
	</div>


<%@ include file="/WEB-INF/include/common-body.jspf"%>
<script type="text/javascript">
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