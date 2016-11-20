<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.list.css"/>">
<script src="<c:url value="/resources/js/meetings.list.js"/>"></script>
</head>
<body>
<div class="col-md-9">
<div class="table-responsive">
	<div class="heading">
		<h3>모임참여내역</h3>
	</div>
<br>
<table>
<c:choose>
	<c:when test="${fn:length(list) > 0 }">
		<c:forEach items="${list}" var="row" varStatus="status">
			
			<c:if test="${status.index%3 == 0}">
			<tr></tr>
			</c:if>

	<div class="col-sm-4">
		<div class="box-image">
			<div class="image">
				<a href="#this" id="title" onclick="fn_meetingsDetail($(this))"><img id="repIMG" src='${row.MT_REP_IMG }'/></a>
				<input type="hidden" id="mt_no" value="${row.MT_NO }">
			</div>
		<div class="bg"></div>
		<div class="name">
			<h3><a href="#this" id="title" onclick="fn_meetingsDetail($(this))">${row.MT_TITLE }</a></h3>
			<input type="hidden" id="mt_no" value="${row.MT_NO }"> 
		</div>
 		<div class="text">
			<p class="buttons">
				<a href="#this" onclick="fn_meetingsDetail($(this))" class="btn btn-template-transparent-primary">View</a>
				<a href="#this" onclick="fn_meetingsDetail($(this))" class="btn btn-template-transparent-primary">Website</a>
				<input type="hidden" id="mt_no" value="${row.MT_NO }"> 
			</p>
		</div>
		</div>
	<!-- /.box-image -->
	</div>
</c:forEach></c:when>
<%-- <c:choose>
	<c:when test="${fn:length(list) > 0 }">
		<c:forEach items="${list}" var="row" varStatus="status">
			
			<c:if test="${status.index%3 == 0}">
			<tr>
			</c:if>
			
			<td width="33%" align="center">
				<table class="om_img_base">
					<tr>
						<td colspan="2">
							<a href="#this" id="title" onclick="fn_meetingsDetail($(this))"><img id="repIMG" src='${row.MT_REP_IMG }'/></a>
							<input type="hidden" id="mt_no" value="${row.MT_NO }">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="om_view_title">
							<a href="#this" id="title" onclick="fn_meetingsDetail($(this))">${row.MT_TITLE }</a>
							<input type="hidden" id="mt_no" value="${row.MT_NO }">
						</td>
					</tr>
					<tr>
						<td align="center" id="likeitBtnTd">
							<input type="hidden" id="mt_no" value="${row.MT_NO }">
							<a href="#this" id="likeitBtn">♡</a>
							<span id="likeitCount">
								<c:choose>
									<c:when test="${row.MT_LIKEIT == null || row.MT_LIKEIT <= 0}">0</c:when>
									<c:otherwise>${row.MT_LIKEIT}</c:otherwise>
								</c:choose>
							</span>
						</td>
						
					</tr>
				</table>
			</td>
		</c:forEach>
	</c:when> --%>
	<c:otherwise>
		<tr align="center">
			<td width=100%><h3>조회된 게시물이 없습니다.</h3></td>
		</tr>
	</c:otherwise>
</c:choose>
<!-- 페이징 -->
	<%-- <tr>
		<td colspan="6" width="100%" align="center" style="padding-top:20px;padding-bottom:10px">
			${pagingHtml }
		</td>
	</tr> --%>
	</table><br><br>
</div>
</div>
</div>
</div>



<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("#title").on("click", function(e){ // 모임 상세보기
            e.preventDefault();
            fn_meetingsDetail($(this));
        });
    });
    
    function fn_meetingsDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/mypageOmeetDetail' />");
        cs.addParam("mt_no", obj.parent().find("#mt_no").val());
        cs.submit();
    }
</script> 

</body>
</html>