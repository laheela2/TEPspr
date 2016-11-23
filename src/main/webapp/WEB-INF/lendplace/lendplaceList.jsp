<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<script src="<c:url value="/resources/js/lendplace-list.js"/>"></script>

</head>

<body>

	<%@ include file="/WEB-INF/include/common-body.jspf"%>
	<script type="text/javascript">
		function fn_lendplaceDetail(l_no) {
			var cs = new CustomSubmit();
			cs.setUrl("<c:url value='/lendplace/detail' />");
			cs.addParam("l_no", l_no);
			cs.addParam("currentPageNo", "${currentPageNo}");
			cs.submit();
		}
	</script>

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
							모임 목적에 맞는 장소를 선택해 보세요.<i class="fa fa-heart"></i>
						</h3>
					</div>
				</div>

				<div class="col-md-9">

					<div class="row portfolio no-space">

						<c:forEach items="${list }" var="row">
							<div class="col-sm-4">
								<div class="box-image">
									<div class="image">
										<img src="<c:url value="/resources/image/meetings_img_001.jpg"/>" alt="" class="img-responsive">
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

				<!-- *** LEFT COLUMN END *** -->



				<!-- *** RIGHT COLUMN ***  -->

				<div class="col-md-3">

					<!-- *** MENUS AND WIDGETS ***  -->
					<div class="panel panel-default sidebar-menu">
						<div class="panel-heading">
							<h3 class="panel-title">장소 키워드 검색</h3>
						</div>

						<div class="panel-body">
							<form role="search" name="search_form" action="<c:url value="/lendplace"/>" method="post" onsubmit="searchSubmit();">
								<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
								<input id="searchCate" type="hidden" name="searchCategory" value="${searchCategory }">
								<input id="searchAddr" type="hidden" name="searchAddr" value="${searchAddr }">

								<div class="input-group">
									<input type="text" class="form-control" id="searchbox" name="searchWord" value="${searchWord }" placeholder="예) 강남, 마이크, 주차 등">
									<span class="input-group-btn">

										<button type="submit" class="btn btn-template-main">
											<i class="fa fa-search"></i>
										</button>

									</span>
								</div>
							</form>
						</div>
					</div>

					<div class="panel sidebar-menu">
						<div class="panel-heading">
							<h3 class="panel-title">수용인원</h3>
						</div>
						<div class="panel-body">
							<table class="category">
								<tr>
									<td>0~20명</td>
									<td>20~50명</td>
								</tr>
								<tr>
									<td>50~100명</td>
									<td>100명이상</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="panel sidebar-menu">
						<div class="panel-heading">
							<h3 class="panel-title">지역</h3>
						</div>
						<div class="panel-body">
							<table class="area">
								<tr>
									<td>서울</td>
									<td>부산|울산|경남</td>
								</tr>
								<tr>
									<td>인천|경기</td>
									<td>대전|충청|세종</td>
								</tr>
								<tr>
									<td>광주|전라</td>
									<td>강원</td>
								</tr>
								<tr>
									<td>대구|경북</td>
									<td>제주</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /#content -->



</body>
</html>