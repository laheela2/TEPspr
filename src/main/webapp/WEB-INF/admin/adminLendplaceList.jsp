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
			<h1 class="page-header">장소 리스트</h1>
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
											<th style="width: 90.2px;">번호</th>
											<th style="width: 128px;">장소명</th>
											<th style="width: 298.2px;">제목</th>
											<th style="width: 141.2px;">주소</th>
											<th style="width: 90px;">작성일</th>
											<th style="width: 85px;">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="row" varStatus="stat">
											<c:choose>
												<c:when test="${stat.index%2==0 }">
													<tr class="gradeA even" role="row">
														<td>${row.L_NO }</td>
														<td>${row.L_NAME }</td>
														<td>${row.L_TITLE }</td>
														<td>${row.L_ADDR }</td>
														<td><fmt:formatDate value="${row.L_DATE}" pattern="yyyy.MM.dd"/></td>
														<td><button type="button" class="btn btn-outline btn-danger" onclick="fn_delete('${row.L_NO }');">삭제</button></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr class="gradeA odd" role="row">
														<td>${row.L_NO }</td>
														<td>${row.L_NAME }</td>
														<td>${row.L_TITLE }</td>
														<td>${row.L_ADDR }</td>
														<td><fmt:formatDate value="${row.L_DATE}" pattern="yyyy.MM.dd"/></td>
														<td><button type="button" class="btn btn-outline btn-danger" onclick="fn_delete('${row.L_NO }');">삭제</button></td>
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
<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
	function fn_delete(lno){
		var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/admin/lendplace/delete' />");
        cs.addParam("l_no", lno);
        cs.submit();
	}
</script> 
</body>
</html>