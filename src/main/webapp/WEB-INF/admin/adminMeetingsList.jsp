<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
</head>
<body>

	<div class="row">

		<div class="col-lg-12">
			<h1 class="page-header">모임 리스트</h1>
		</div>

		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row">
							<div class="col-sm-12">
								<table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
									<thead>
										<tr role="row">
											<th style="width: 100.2px;">번호</th>
											<th style="width: 128px;">카테고리</th>
											<th style="width: 238.2px;">제목</th>
											<th style="width: 231.2px;">소제목</th>
											<th style="width: 151.2px;">작성자</th>
											<th style="width: 125px;">작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="row" varStatus="stat">
											<c:choose>
												<c:when test="${stat.index%2==0 }">
													<tr class="gradeA even" role="row">
														<td>${row.MT_NO }</td>
														<td>${row.MT_CATEGORY }</td>
														<td>${row.MT_TITLE }</td>
														<td>${row.MT_SUBJECT }</td>
														<td>${row.MT_NAME }</td>
														<td><fmt:formatDate value="${row.MT_DATE}" pattern="yyyy.MM.dd"/></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr class="gradeA odd" role="row">
														<td>${row.MT_NO }</td>
														<td>${row.MT_CATEGORY }</td>
														<td>${row.MT_TITLE }</td>
														<td>${row.MT_SUBJECT }</td>
														<td>${row.MT_NAME }</td>
														<td><fmt:formatDate value="${row.MT_DATE}" pattern="yyyy.MM.dd"/></td>
													</tr>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12" align="center">
								<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
									<ul class="pagination">${pagingHtml }</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>

</body>
</html>