<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.detail.css"/>">
</head>
<body>
	<center>
		<table width=900>
			<tr>
				<td align="center">
					<c:choose>
						<c:when test="${data.V_LIST_ID != null || fn:length(data.V_LIST_ID) > 0 }">
							<c:set var="videoID" value="${data.V_VIDEO_ID}?list=${data.V_LIST_ID}"/>
						</c:when>
						<c:otherwise>
							<c:set var="videoID" value="${data.V_VIDEO_ID}"/>
						</c:otherwise>
					</c:choose>
					<iframe width="860" height="615" src="https://www.youtube.com/embed/${videoID}" frameborder="0" allowfullscreen></iframe>
				</td>
			</tr>
			<tr>
				<td style="background-color: red;height: 0.3px;">&nbsp;</td>
			</tr>
			<tr>
				<td>제목 : ${data.V_TITLE }</td>
			</tr>
			<tr>
				<td>내용 : ${data.V_CONTENT}</td>
			</tr>
			<tr>
				<td>게시자 : ${data.V_RECTURER}&nbsp;&nbsp;&nbsp;[${data.V_DATE}]</td>
			</tr>
			<tr>
				<td>조회수: ${data.V_READCOUNT}</td>
			</tr>
		</table>
		<table width=900>
		<tr>
		<td>
		<!-- 댓글 -->
		<div style="font-weight: bold;font-size:small;padding-top: 50px">댓글(${fn:length(cmtList)})</div>
		<hr class="md_hr">
		
		<form action="<c:url value="/videolec/insertcmt"/>" onsubmit="return cmt_check();" method="post">
			<input type="hidden" name="v_no" value="${data.V_NO }">
			<div style="padding-right:6px;padding-bottom:5px;">
				<textarea id="cmt_content" name="c_content"  class="md_comments"></textarea>
			</div>
			<div align="right"><input type="submit" value="내용입력"></div>
		</form>			
		
		<c:forEach items="${cmtList }" var="cmt">
			<hr class="md_hr">
			<div style="padding-left:13px;font-weight: bold;font-family: sans-serif;font-size: x-small;">
			${cmt.C_NAME }
			
			<!-- 댓글 삭제 -->
			<c:if test="${sessionScope.session_m_no != null && sessionScope.session_m_no == cmt.M_NO }">
				<span style="float:right;">
					<a href="#this" name="deleteCmtBtn">삭제</a>
					<input type="hidden" id="c_no" value="${cmt.C_NO}">
				</span>
			</c:if>
			
			</div>
			<div style="padding-top:5px; padding-left:13px;font-family: monospace;font-size: x-small;">${cmt.C_CONTENT }</div>
		</c:forEach>		
		</td>
		</tr>
		</table>

		
<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script>
	function cmt_check() {
		var area = document.getElementById('cmt_content');
	
		if(!isLoginCheck("${sessionScope.session_m_email}")){
			return false;
		}
		
		if (!area.value) {
			alertify.error("댓글에 내용이 입력되지 않았습니다.");
			area.focus();
			return false;
		}
	}
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $("a[name='deleteCmtBtn']").on("click", function(e){ // 코멘트 삭제
            e.preventDefault();
            fn_deleteCmt($(this));
        });
    });
    
    function fn_deleteCmt(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/videolec/deletecmt' />");
        cs.addParam("c_no", obj.parent().find("#c_no").val());
        cs.addParam("v_no", '${data.V_NO }');
        cs.submit();
    }
</script> 		
		
</body>
</html>