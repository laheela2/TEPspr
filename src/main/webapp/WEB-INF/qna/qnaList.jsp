<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_home').addClass('active'); });</script>
</head>
<body>

	<div id="heading-breadcrumbs">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-7">
	                <h1>Q&A</h1>
	            </div>
	            <div class="col-md-5">
	                <ul class="breadcrumb">
	                    <li><a href="<c:url value="/main"/>">홈</a>
	                    </li>
	                    <li>Q&A 리스트</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">
				<div class="col-md-12 clearfix">
					<section>
						<div class="heading"><h4>문의 사항에 대한 질문을 확인 하실수 있습니다. 제목을 누르면 내용이 보입니다.<i class="fa fa-heart"></i></h4></div>
						<div class="col-md-12 text-right">
							<button type="button" class="btn btn-template-main" onclick="fn_qnaWrite();">
								<i class="fa fa-pencil"></i> 문의하기
							</button>
							<p/>
						</div>
						<div class="panel-group" id="accordion">

							<c:forEach items="${list }" var="row">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#${row.Q_NO }" style="font-weight: bold;">
											 <i class="fa ${row.Q_LOCK == 'N' ? 'fa-unlock':'fa-lock' }"></i>&nbsp;&nbsp;&nbsp;${row.Q_TITLE } 
											 </a>
										</h4>
									</div>
									<div id="${row.Q_NO }" class="panel-collapse collapse">
										<div class="panel-body">
											<c:choose>
												<c:when test="${row.Q_LOCK == 'N' || row.M_NO == sessionScope.session_m_no}"><p>${row.Q_CONTENT }</p></c:when>
												<c:otherwise><code><i class="fa fa-lock"></i>&nbsp;작성자가 내용을 비공개로 설정 하였습니다.</code></c:otherwise>
											</c:choose>
											<hr>
											
											<div class="col-md-12">
												<p>
													<c:if test="${row.Q_ANSWER != 'N' }">
													 	<i class="fa fa-share"></i>&nbsp;&nbsp;&nbsp;${row.Q_ANSWER}
													 </c:if>
												</p>
												<c:if test="${row.M_NO == sessionScope.session_m_no }">
													<div class="col-md-12 text-right">
					                        			<button type="button" class="btn btn-template-main" onclick="fn_qnaModify('${row.Q_NO}');">
					                        				<i class="fa fa-edit"></i> 수정
					                       				</button>
					                        			<button type="button" class="btn btn-template-main" onclick="fn_qnaDelete('${row.Q_NO}');">
					                        				<i class="fa fa-trash-o"></i> 삭제
					                       				</button>
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</section>

					<section>
						<div class="col-md-12 text-center">
							<ul class="pagination pagination-lg">${pagingHtml}</ul>
						</div>
						<br />
					</section>
				</div>
			</div>
		</div>
	</div>


<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    function fn_qnaWrite(){
        if(isLoginCheck('${sessionScope.session_m_email}')){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/qna/write' />");
	        cs.addParam("currentPageNo", "${currentPageNo}");
	        cs.submit("GET");
        };
    }
    
    function fn_qnaModify(q_no){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/qna/modify' />");
        cs.addParam("q_no", q_no);
        cs.submit();
    }
    
    function fn_qnaDelete(q_no){
    	 var cs = new CustomSubmit();
         cs.setUrl("<c:url value='/qna/delete' />");
         cs.addParam("q_no", q_no);
         cs.submit();
    }
</script> 
	
</body>
</html>