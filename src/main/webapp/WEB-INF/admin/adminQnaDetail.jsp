<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
</head>
<body>

	<div class="row">

		<div class="col-lg-12">
			<h1 class="page-header">Q&A 상세보기</h1>
		</div>

<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form" enctype="multipart/form-data" theme="simple">
								<div class="form-group col-lg-12">
									<label class="col-sm-2">카테고리</label>
									<div class="col-lg-6">
										<input class="form-control" value="${data.Q_CATEGORY1}">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">세부카테고리</label>
									<div class="col-lg-6">
										<input class="form-control" value="${data.Q_CATEGORY2}">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">제목</label>
									<div class="col-lg-6">
										<input class="form-control" value="${data.Q_TITLE}">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">내용</label>
									<div class="col-lg-6">
										<input class="form-control" type="text" value="${data.Q_CONTENT}">
									</div>
								</div>
								<div class="col-sm-7 col-lg-6" align="right">
									<button type="button" class="btn btn-default">답변하기</button>
								</div>
							</form>
						</div>
					</div>
					<!-- /.row (nested) -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>

</body>
</html>