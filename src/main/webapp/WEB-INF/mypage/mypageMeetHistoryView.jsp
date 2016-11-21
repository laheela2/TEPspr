<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_meetings').addClass('active'); });</script>
<script src="<c:url value="/resources/js/meetings-list.js"/>"></script>
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
                    <li><a href="<c:url value="/main"/>">홈</a>
                    </li>
                    <li>모임참여내역</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
	<div class="container features-buttons">
		<section>
			<div class="row">
<%@ include file="/WEB-INF/include/mypage2.jspf" %>
<div class="col-md-9">
<div class="table-responsive">
	<div class="heading">
		<h3>모임참여내역</h3>
	</div>
<table>
<c:choose>
	<c:when test="${fn:length(list) > 0 }">
		<c:forEach items="${list }" var="row">
			<div class="col-sm-4">
				<div class="box-image">
					<div class="image">
						<img src="${row.MT_REP_IMG }" alt="" class="img-responsive">
					</div>
					<div class="bg"></div>
					<div class="name">
						<h3>
							<a href="#this" onclick="fn_meetingsDetail('${row.MT_NO}')">${row.MT_TITLE }</a>
						</h3>
					</div>
					<div class="text">
						<p class="hidden-sm">${row.MT_SUBJECT }</p>
						<p class="buttons">
						<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_meetingsDetail('${row.MT_NO}')">보기</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="col-sm-12" align="center">
			<h4>등록된 게시물이 없습니다.</h4>
		</div>
	</c:otherwise>
</c:choose>
				
	<!-- 페이징 -->
	<div class="col-lg-12" align="center">
		<ul class="pagination">${pagingHtml}</ul>
	</div>
</table>
<br>
</div>
</div>
</div></section></div></div>


<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
function fn_meetingsDetail(mt_no){
    var cs = new CustomSubmit();
    cs.setUrl("<c:url value='/mypageOmeetDetail' />");
    cs.addParam("mt_no", mt_no);
    cs.addParam("currentPageNo", "${currentPageNo}");
    cs.submit();
}
</script> 

</body>
</html>