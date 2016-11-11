<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.list.css"/>">
<script src="<c:url value="/resources/js/meetings.list.js"/>"></script>
</head>
<body>
<br>

<table align="center" width="920" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>

<table width=100%>

	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="5"><strong>&nbsp;&nbsp;모임참여내역</strong></td>
	</tr>

</table>
<br>

<table class="board" align=center cellspacing=0 border="0">
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
							<a href="#" id="subject"><img id="repIMG" src='${row.MT_REP_IMG }'/></a>
							<input type="hidden" id="O_NO" value="${row.MT_NO }">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="om_view_subject">
							<a href="#" id="subject">${row.MT_SUBJECT }</a>
							<input type="hidden" id="O_NO" value="${row.MT_NO }">
						</td>
					</tr>
				</table>
			</td>
		</c:forEach>
	</c:when>
		
		<c:otherwise>
			<tr>
				<td colspan="4">조회된 결과가 없습니다.</td>
			</tr>
		</c:otherwise>
	
	</c:choose>

<!-- 페이징 -->
	<tr>
		<td colspan="6" width="100%" align="center" style="padding-top:20px;padding-bottom:10px">
			${pagingHtml }
		</td>
	</tr>


</table>
</body>
</html>