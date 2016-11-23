<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('q_content');
	}

	function fn_validation() {
		var join = document.userinput
		var title = document.getElementById("q_title");
		var content = CKEDITOR.instances.q_content;
		$(document.getElementById("q_lock")).is("checked");

		if (join.q_title.value == "") {
			alertify.error("제목이 입력되지 않았습니다.");
			join.q_title.focus();
			return false;
		}

		if (!content.getData()) {
			alertify.error("내용이 입력되지 않았습니다.");
			content.focus();
			return false;
		}

		join.submit();
	}
</script>
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
						<li><a href="<c:url value="/mypage/view"/>">마이페이지</a></li>
						<li><a href="<c:url value="/mypage/qnaHistory"/>">문의내역</a></li>
						<li>Q&A 수정</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">
			<%@ include file="/WEB-INF/include/mypage2.jspf"%>
				<div class="col-md-9">
					<div class="heading">
						<h3>Q&A 수정</h3>
					</div>
					<form name="userinput" action='<c:url value="/mypage/qna/modify/result"/>' method="post">
						<input type="hidden" name="q_no" value="${data.Q_NO}">
						<table class="table" align="center" border="0">

							<tr>
								<td width="15%">
									<select name="q_lock" class="form-control">
										<option value="N">공개</option>
										<option value="Y">비공개</option>
									</select>
								</td>
								<td width="10%">
									<h5>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</h5>
								</td>
								<td>
									<input id="q_title" type="text" name="q_title" maxlength="50" class="form-control" value="${data.Q_TITLE }">
								</td>
							</tr>

							<tr>
								<td colspan="3">
									<textarea id="q_content" name="q_content">${data.Q_CONTENT }</textarea>
								</td>
							</tr>

							<tr>

								<td colspan="3" align="right" style="border: none;">
									<button type="button" class="btn btn-template-main" onclick="return fn_validation();">
										<i class="fa fa-save"></i> 수 정 하 기
									</button>
									<button type="button" class="btn btn-template-main" onclick="history.back();">
										<i class="fa fa-save"></i> 취 소 하 기
									</button>
								</td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>