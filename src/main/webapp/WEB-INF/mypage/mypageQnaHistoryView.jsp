<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
</head>
<body>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1>Mypage</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb">
						<li><a href="<c:url value="/mypage/view"/>">마이페이지</a></li>
						<li>Q&A 내역</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">
				<%@ include file="/WEB-INF/include/mypage2.jspf"%>
				<div class="col-md-9 clearfix">
					<section>
					<div class="heading">
						<h4>
							문의 사항에 대한 답변을 확인 하실수 있습니다. 제목을 누르면 내용이 보입니다.<i
								class="fa fa-heart"></i>
						</h4>
					</div>
					<div class="panel-group" id="accordion">

						<c:forEach items="${list }" var="row">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#${row.Q_NO }" style="font-weight: bold;"> <i
											class="fa ${row.Q_LOCK == 'N' ? 'fa-unlock':'fa-lock' }"></i>&nbsp;&nbsp;&nbsp;${row.Q_TITLE }
										</a>
									</h4>
								</div>
								<div id="${row.Q_NO }" class="panel-collapse collapse">
									<div class="panel-body">
										<c:choose>
											<c:when
												test="${row.Q_LOCK == 'N' || row.M_NO == sessionScope.session_m_no}">
												<p>${row.Q_CONTENT }</p>
											</c:when>
											<c:otherwise>
												<code>
													<i class="fa fa-lock"></i>&nbsp;작성자가 내용을 비공개로 설정 하였습니다.
												</code>
											</c:otherwise>
										</c:choose>
										<hr>

										<div class="col-md-9">
											<p>
												<c:if test="${row.Q_ANSWER != 'N' }">
													<i class="fa fa-share"></i>&nbsp;&nbsp;&nbsp;${row.Q_ANSWER}
													 </c:if>
											</p>
											<c:if test="${row.M_NO == sessionScope.session_m_no }">
												<div class="col-md-9" style="margin:auto; width:84%" align="right">
													<button type="button" class="btn btn-template-main"
														onclick="fn_qnaModify('${row.Q_NO}');">
														<i class="fa fa-edit"></i> 수정
													</button>
													<button type="button" class="btn btn-template-main"
														onclick="fn_qnaDelete('${row.Q_NO}');">
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
					<div class="col-md-9"  style="margin:auto; width:100%" align="center">
						<ul class="pagination pagination-lg">${pagingHtml}</ul>
					</div>
					<br />
					</section>

					<div class="col-md-9 text-center" style="margin:auto; width:100%" align="center">
						<form method="post" action="<c:url value='/mypage/qnaHistory'/>">
							<table align="center">
								<tr>
									<td><select name="searchKey" class="form-control"
										class="form-control">
											<option value="0" selected="selected">제목</option>
											<option value="1">제목+내용</option>
									</select></td>
									<td><input type="text" style="height: 32.3px;"
										name="searchWord" size="33" maxlength="15" /></td>
									<td>
										<button type="submit" class="btn btn-template-main">
											<i class="fa fa-search"></i>
										</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/include/common-body.jspf"%>
		<script type="text/javascript">
			$(document).ready(function() {
				$("a[name='title']").on("click", function(e) { // 글상세보기
					e.preventDefault();
					fn_qnaDetail($(this));
				});
			});

			function fn_qnaModify(q_no) {
				var cs = new CustomSubmit();
				cs.setUrl("<c:url value='/mypage/qna/modify' />");
				cs.addParam("q_no", q_no);
				cs.submit();
			}

			function fn_qnaDelete(q_no) {
				var cs = new CustomSubmit();
				cs.setUrl("<c:url value='/mypage/qna/delete' />");
				cs.addParam("q_no", q_no);
				cs.submit();
			}
		</script>
</body>
</html>