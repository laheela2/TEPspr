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

<table border="0" width=900px cellpadding=15 align=center>
<tr>
<td>

<table width=100%>

	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="5"><strong>&nbsp;&nbsp;모임참여내역</strong></td>
	</tr>

</table>
<br>
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
							<a href="#" id="title"><img id="repIMG" src='${row.mt_rep_img }'/></a>
							<input type="hidden" id="mt_no" value="${row.mt_no }">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="om_view_title">
							<a href="#" id="title">${row.mt_title }</a>
							<input type="hidden" id="mt_no" value="${row.mt_no }">
						</td>
					</tr>
					<tr>
						<td align="center" id="likeitBtnTd">
							<a href="#" id="likeitBtn">♡</a>
							<input type="hidden" id="mt_no" value="${row.mt_no }">
							<span id="likeitCount">${row.mt_likeit}</span>
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

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("#likeitBtn").on("click", function(e){ // 좋아요
            e.preventDefault();
            sessionCheck("${sessionScope.session_m_email}");
            fn_meetingsLikeit($(this));
        }); 
        $("#title").on("click", function(e){ // 모임 상세보기
            e.preventDefault();
            fn_meetingsDetail($(this));
        });
    });
     
    function fn_meetingsLikeit(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/meetings/likeit' />");
        cs.addParam("mt_no", obj.parent().find("#mt_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
    
    function fn_meetingsDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/mypageOmeetDetail' />");
        cs.addParam("mt_no", obj.parent().find("#mt_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 

</body>
</html>