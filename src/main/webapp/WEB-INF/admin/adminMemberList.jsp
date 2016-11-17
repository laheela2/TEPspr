<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<div class="row">

		<div class="col-lg-12">
			<h1 class="page-header">회원목록</h1>
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
											<th style="width: 118.2px;">번호</th>
											<th style="width: 218.2px;">이름</th>
											<th style="width: 265.2px;">이메일</th>
											<th style="width: 242.2px;">비밀번호</th>
											<th style="width: 191.2px;">전화번호</th>
											<th style="width: 145px;">가입일</th>
											<th style="width: 145px;">수정/삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list }" var="row" varStatus="stat">
										<c:url var="viewURL" value="/admin/members/modifyForm" >
											<c:param name="m_no" value="${row.M_NO }" />							
										</c:url>
										<c:url var="viewURL2" value="" >
											<c:param name="m_no" value="${row.M_NO }" />							
										</c:url>
											<c:choose>
												<c:when test="${stat.index%2==0 }">
													<tr class="gradeA even" role="row">
														<td>${row.M_NO }</td>
														<td>${row.M_NAME }</td>
														<td>${row.M_EMAIL }</td>
														<td>${row.M_PASSWORD }</td>
														<td>${row.M_PHONE }</td>
														<td>${row.M_DATE }</td>
														<td>
															<a href="${viewURL}">수정</a>/<a href="${viewURL2}">삭제</a>
														</td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr class="gradeA odd" role="row">
														<td>${row.M_NO }</td>
														<td>${row.M_NAME }</td>
														<td>${row.M_EMAIL }</td>
														<td>${row.M_PASSWORD }</td>
														<td>${row.M_PHONE }</td>
														<td>${row.M_DATE }</td>
														<td>
															<a href="${viewURL}">수정</a>/<a href="${viewURL2}">삭제</a>
														</td>
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