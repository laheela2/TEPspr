<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('q_content');
		
		var f = document.mForm;
		f.q_category1.value='${data.Q_CATEGORY1}';
		f.q_category2.value='${data.Q_CATEGORY2}';
		f.q_title.value='${data.Q_TITLE}';
	}
	
	function fn_validation(){
		var title = document.getElementById("q_title");
		var content = CKEDITOR.instances.q_content;
		
		if(!title.value){
			alertify.error("제목이 입력되지 않았습니다.");
			subject.focus();
			return false;
		}
		
		if(!content.getData()){
			alertify.error("내용이 입력되지 않았습니다.");
			content.focus();
			return false;
		}
	}
</script>
</head>
<body>
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1>Q&A</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a>
                    </li>
                    <li>Q&A 수정</li>
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
				<h3>Q&A 수정</h3>
			</div>
<form name="mForm" action='<c:url value="/qna/modify"/>' method="post" onsubmit="return fn_validation();">
<input type="hidden" name="q_no" value="${data.Q_NO}">
<table class="table" align=center border="0">

<tr>
<td><h5>카테고리</h5></td>
<td>
<select name="q_category1" class="form-control">
	<option value="문의하기">문의하기</option>
	<option value="신고하기">신고하기</option>
</select>
</td>
</tr>

<tr>
<td><h5>세부 카테고리</h5></td>
<td>
<select name="q_category2" class="form-control">
	<optgroup label="문의하기">
	<option value="광고">광고</option>
	<option value="기능">기능</option>
	<option value="오류">오류</option>
	<option value="제안">제안</option>
	<option value="장소">장소</option>
	<option value="기타">기타</option>
	</optgroup>
	<optgroup label="신고하기">
	<option value="허위광고">허위광고</option>
	<option value="명예훼손/욕설/음란">명예훼손/욕설/음란</option>
	<option value="개인정보노출">개인정보노출</option>
	<option value="저작권위반">저작권위반</option>
	<option value="기타">기타</option>
	</optgroup>
</select>
</td>
</tr>

<tr>
<td><h5>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</h5></td>
<td ><input id="b_title" type="text" name="q_title" size="100%" class="form-control"></td>
</tr>

<tr>
<td><h5>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</h5></td>
<td><textarea name="q_content">${data.Q_CONTENT }</textarea></td>
</tr>

<tr>
<td colspan="2" align="right" style="border:none;">
<input type="submit" value="저장">
<input type="button" value="취소" onclick="history.back();">
</td>
</tr>

</table>
</form>
</div></div></div></div>
</body>
</html>