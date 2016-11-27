<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script type="text/javascript">
	function fn_lendplaceDetail(l_no) {
		var cs = new CustomSubmit();
		cs.setUrl("<c:url value='/lendplace/detail' />");
		cs.addParam("l_no", l_no);
		cs.addParam("currentPageNo", "${currentPageNo}");
		cs.submit();
	}
</script>
</head>

<body>


	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>장소</h1>
				</div>
				<div class="col-md-6">
					<ul class="breadcrumb">
						<li><a href="<c:url value="/main"/>">홈</a></li>
						<li>장소</li>
					</ul>

				</div>
			</div>
		</div>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<div class="heading">
						<h3>
							모임 목적에 맞는 장소를 검색해 보세요.<i class="fa fa-heart"></i>
						</h3>
					</div>
				</div>

				<div class="panel-body">
					<form role="search" name="search_form" action="<c:url value="/lendplace"/>" method="post" onsubmit="searchSubmit();">
						<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
						<div class="input-group">
							<input type="text" class="form-control" id="searchbox" name="searchWord" value="${searchWord }" 
							placeholder="특정한 장소명이나 키워드로 검색해보세요.^^   ex) 강남, 마이크, 주차 등">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-template-main">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</div>

				<!-- row space -->
				<div class="col-md-12">

					<div class="row portfolio no-space">

						<c:forEach items="${list }" var="row">
							<div class="col-sm-4">
								<div class="box-image">
									<div class="image">
													<img src="${row.L_IMAGE1 }" alt="" class="img-responsive" width="440" height="440">
									</div>
									<div class="bg"></div>
									<div class="name">
										<h3>
											<a href="#this" onclick="fn_lendplaceDetail('${row.L_NO }')">${row.L_TITLE }</a>
										</h3>
									</div>
									<div class="text">
										<p class="hidden-sm">${row.L_ADDR }</p>
										<p class="buttons">
											<a href="#this" onclick="fn_lendplaceDetail('${row.L_NO }')" class="btn btn-template-transparent-primary">상세보기</a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

					<div class="col-lg-12" align="center">
						<ul class="pagination pagination-lg">${pagingHtml}</ul>
					</div>

				</div>

				<!-- *** row space end*** -->

			</div>
		</div>
	</div>


</body>
</html>