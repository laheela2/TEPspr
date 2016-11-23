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
						<p class="lead">문의 사항에 대한 질문을 확인 하실수 있습니다. 제목을 누르면 내용이 보입니다.</p>

						<div class="panel-group" id="accordion">

							<c:forEach items="${list }" var="row">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#${row.Q_NO }"> ${row.Q_TITLE } </a>
										</h4>
									</div>
									<div id="${row.Q_NO }" class="panel-collapse collapse">
										<div class="panel-body">
											<c:if test="${row.Q_LOCK == 'N' }">
												<p>${row.Q_CONTENT }</p>
											</c:if>
											<hr>
											<ul>
												<li>
													<c:if test="${row.Q_ANSWER != 'N' }"> ${row.Q_ANSWER} </c:if>
												</li>
											</ul>
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
	
</body>
</html>