<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board.write.css"/>">
<script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('b_content');
	}
</script>
<script type="text/javascript">
function cmt_check() {
	var area = document.getElementById('cmt_content');

	sessionCheck("${sessionScope.session_m_email}");
	
	if (!area.value) {
		alertify.error("댓글에 내용이 입력되지 않았습니다.");
		area.focus();
		return false;
	}
}
</script>
</head>
<body>

<table style="width:890px;" border="0" align=center>
<tr>
<td style="font-weight: bold;font-size: large;font-family: sans-serif;">게시판</td>
<td align="right"><input type="button" value="목록보기" id="backBoardListBtn"></td>
</tr>
</table>

<table class="boardwrite" align=center border="0">

<tr>
<td class="bw_title">종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</td>
<td  class="bw_content">
<c:if test="${data.b_kind == 0 }">
일반
</c:if>
<c:if test="${data.b_kind == 1 }">
스승찾기
</c:if>
<c:if test="${data.b_kind == 2 }">
제자찾기
</c:if>
</td>
</tr>

<tr>
<td class="bw_title">카테고리</td>
<td  class="bw_content">
${data.b_category}
</td>
</tr>

<tr>
<td class="bw_title">관심분야</td>
<td class="bw_content">
${data.b_fav_field}
</td>
</tr>

<tr>
<td class="bw_title">관심지역</td>
<td class="bw_content">
${data.b_fav_area}
</td>
</tr>

<tr>
<td class="bw_title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td class="bw_content">${data.b_title }</td>
</tr>

<tr>
<td colspan="2">
<textarea id="b_content" disabled="disabled">${data.b_content }</textarea>
</td>
</tr>

<c:if test="${sessionScope.session_m_no != null && sessionScope.session_m_no == data.m_no }">
<tr>
<td colspan="2" align="right" style="border:none;">
<input type="button" value="수정" id="modifyBtn">
<input type="button" value="삭제" id="deleteBtn">
</td>
</tr>
</c:if>

<tr>
<td colspan="2">
<!-- 댓글 -->
<div style="font-weight: bold;font-size:small;padding-top: 10px">댓글(${fn:length(cmtList)})</div>
<hr class="om_detail_hr">

<form action="<c:url value="/board/insertcmt"/>" onsubmit="return cmt_check();" method="post">
	<input type="hidden" name="b_no" value="${data.b_no }">
	<div style="padding-right:6px;padding-bottom:5px;"><textarea id="cmt_content" name="c_content"></textarea></div>
	<div align="right"><input type="submit" value="내용입력"></div>
</form>

<c:forEach items="${cmtList }" var="cmt">
<hr />
<div style="padding-left:13px;font-weight: bold;font-family: sans-serif;font-size: x-small;">
${cmt.c_name }&nbsp;&nbsp;&nbsp;<font style="font-size: xx-small;"><fmt:formatDate value="${cmt.c_date}" pattern="yyyy년MM월dd일 hh:mm:ss"/></font>

<!-- 댓글 삭제 -->
<c:if test="${sessionScope.session_m_no != null && sessionScope.session_m_no == cmt.m_no }">
	<span style="float:right;">
		<a href="#" name="deleteCmtBtn">삭제</a>
		<input type="hidden" id="c_no" value="${cmt.c_no}">
	</span>
</c:if>

</div>
<div style="padding-top:5px; padding-left:13px;font-family: monospace;font-size: x-small;">${cmt.c_content }</div>
</c:forEach>

</td>
</tr>

</table>

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("a[name='deleteCmtBtn']").on("click", function(e){ // 코멘트 삭제
            e.preventDefault();
            fn_deleteCmt($(this));
        });
        
        $("#modifyBtn").on("click", function(e){ // 수정버튼
            e.preventDefault();
            fn_boardModify();
        });
        
        $("#deleteBtn").on("click", function(e){ // 삭제버튼
            e.preventDefault();
            fn_boardDelete();
        });
        
        $("#backBoardListBtn").on("click",function(e){ // 목록버튼
        	e.preventDefault();
        	var url = "<c:url value='/board?currentPageNo=${currentPageNo}'/>";
        	$(location).attr("href",url);
        });
    });
    
    function fn_deleteCmt(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/board/deletecmt' />");
        cs.addParam("c_no", obj.parent().find("#c_no").val());
        cs.addParam("b_no", '${data.b_no }');
        cs.submit();
    }
    
	function fn_boardModify(){
		var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/board/modify' />");
        cs.addParam("b_no", '${data.b_no }');
        cs.submit("GET");
	}
	
	function fn_boardDelete(){
		var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/board/delete' />");
        cs.addParam("b_no", '${data.b_no }');
        cs.submit();
	}
</script> 

</body>
</html>