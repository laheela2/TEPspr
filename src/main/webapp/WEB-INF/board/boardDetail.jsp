<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet" href="<c:url value='/resources/css/boardwrite.css'/>" type="text/css">
<script src="<c:url value='/resources/css/boardwrite.css'/>/TEP/static/js/ckeditor/ckeditor.js"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('b_content');
	}
</script>
<script type="text/javascript">
function form_action(val){
	var f = document.detail_form;
	if(val == 0){
		f.action="boardModify";
		f.submit();
	} else if(val == 1){
		f.action="boardDelete";
		f.submit();
	}
}

function cmt_check(kind) {
	var session_id = '${sessionScope.session_m_email}';
	var area = document.getElementById('cmt_content');

	if (session_id == null || session_id.length <= 0) {
		alertify.error("로그인 상태가 아닙니다.");
		return false;
	}
	if (kind == 1 && !area.value) {
		alertify.error("댓글에 내용이 입력되지 않았습니다.");
		area.focus();
		return false;
	}
}
</script>
</head>
<body>

<form name="detail_form" method="post">
<input type="hidden" name="B_NO" value='${data.B_NO }'>
</form>

<table style="width:890px;" border="0" align=center>
<tr>
<td style="font-weight: bold;font-size: large;font-family: sans-serif;">게시판</td>
<td align="right"><input type="button" value="목록보기" onclick="history.back();"></td>
</tr>
</table>

<table class="boardwrite" align=center border="0">

<tr>
<td class="bw_title">종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</td>
<td  class="bw_content">
<c:if test="${data.B_KIND == 0 }">
일반
</c:if>
<c:if test="${data.B_KIND == 1 }">
스승찾기
</c:if>
<c:if test="${data.B_KIND == 2 }">
제자찾기
</c:if>
</td>
</tr>

<tr>
<td class="bw_title">카테고리</td>
<td  class="bw_content">
${data.B_CATEGORY }
</td>
</tr>

<tr>
<td class="bw_title">관심분야</td>
<td class="bw_content">
${data.B_FAV_FIELD }
</td>
</tr>

<tr>
<td class="bw_title">관심지역</td>
<td class="bw_content">
${data.B_FAV_AREA }
</td>
</tr>

<tr>
<td class="bw_title">비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
<td class="bw_content">
<c:choose>
	<c:when test="${data.B_PAYMENT == 0 }">무료</c:when>
	<c:otherwise>${data.B_PAYMENT }원</c:otherwise>
</c:choose>
<c:if test="${data.B_PAYMENT == 0}">
</c:if>
</td>
</tr>

<tr>
<td class="bw_title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td class="bw_content">${data.B_SUBJECT }</td>
</tr>

<tr>
<td colspan="2">
<textarea id="b_content" disabled="disabled">${data.B_CONTENT }</textarea>
</td>
</tr>

<c:if test="${sessionScope.session_m_no != null && sessionScope.session_m_no == data.M_NO }">
<tr>
<td colspan="2" align="right" style="border:none;">
<input type="button" value="수정" onclick="form_action('0');">
<input type="button" value="삭제" onclick="form_action('1');">
</td>
</tr>
</c:if>

<tr>
<td colspan="2">
<!-- 댓글 -->
<div style="font-weight: bold;font-size:small;padding-top: 10px">댓글(${fn:length(cmtData)})</div>
<hr class="om_detail_hr">
<form action="insertComment" onsubmit="return cmt_check('1');" method="post">
<input type="hidden" name="B_NO" value="${data.B_NO }">
<div style="padding-right:6px;padding-bottom:5px;"><textarea id="cmt_content" name="C_CONTENT" class="om_detail_comments"></textarea></div>
<div align="right"><input type="submit" value="내용입력"></div>
</form>

<form action="deleteComment" method="post" name="cmt_delete_form">
<c:forEach items="${cmtData }" var="cmt">
<hr class="om_detail_hr">
<div style="padding-left:13px;font-weight: bold;font-family: sans-serif;font-size: x-small;">
${cmt.C_NAME }

<!-- 댓글 삭제 -->
<input type="hidden" name="C_NO" value="${cmt.C_NO }">
<input type="hidden" name="B_NO" value="${cmt.B_NO }">
<c:if test="${sessionScope.session_m_no != null && sessionScope.session_m_no == cmt.M_NO }">
<span style="float:right;">
<a href="#" onclick="document.cmt_delete_form.submit();">삭제</a>
</span>
</c:if>

</div>
<div style="padding-top:5px; padding-left:13px;font-family: monospace;font-size: x-small;">${cmt.C_CONTENT }</div>
</c:forEach>
</form>
</td>
</tr>

</table>

</body>
</html>