<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.list.css"/>">
</head>
<body>
<center>
<table border="0" width=900 cellpadding=5>
<tr>
<td colspan="3"><font style="font-weight: bold;font-size: x-large;">모임</font></td>
</tr>

<c:choose>
	<c:when test="${fn:length(list) > 0 }">
		<c:forEach items="${list}" var="row" varStatus="status">
			
			<c:if test="${status.index%3 == 0}">
			<tr>
			</c:if>
			
			<td width="33%" align="center">
				<table class="om_img_base">
					<tr>
						<td colspan="2">
							<a href="#this" id="title" onclick="fn_videolecDetail($(this))"><img id="repIMG" src="https://img.youtube.com/vi/${row.V_VIDEO_ID}/sddefault.jpg"/></a>
							<input type="hidden" id="v_no" value="${row.V_NO}">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="om_view_title">
							<a href="#this" id="title" onclick="fn_videolecDetail($(this))">${row.V_TITLE }</a>
							<input type="hidden" id="v_no" value="${row.V_NO }">
						</td>
					</tr>
				</table>
			</td>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td width=100%><h3>등록된 게시물이 없습니다.</h3></td>
		</tr>
	</c:otherwise>
</c:choose>


<!-- 페이징 -->
<tr>
	<td colspan="3" class="paging">${pagingHtml }
	</td>
</tr>

</table>

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    function fn_videolecDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/videolec/detail' />");
        cs.addParam("v_no", obj.parent().find("#v_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 

</body>
</html>