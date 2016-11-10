<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board.write.css"/>">
<script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('B_CONTENT');
	}
	
	function fn_validation(){
		var subject = document.getElementById("b_subject");
		var content = CKEDITOR.instances.b_content;
		
		if(!subject.value){
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

<form id="writeForm" action="<c:url value="/board/write"/>" method="post" onsubmit="return fn_validation();">
<table class="boardwrite" align=center border="0">

<tr>
<td class="bw_title">종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</td>
<td>
<select name="B_KIND">
	<option value="0">일반게시물</option>
	<option value="1">스승찾아요</option>
	<option value="2">제자찾아요</option>
</select>
</td>
</tr>

<tr>
<td class="bw_title">카테고리</td>
<td>
<select name="B_CATEGORY">
	<option value="교육">교육</option>
	<option value="강연">강연</option>
	<option value="세미나/컨퍼런스">세미나/컨퍼런스</option>
	<option value="문화/예술">문화/예술</option>
	<option value="방송/연예">방송/연예</option>
	<option value="취미활동">취미활동</option>
	<option value="소모임/친목행사">소모임/친목행사</option>
	<option value="공모전">공모전</option>
	<option value="전시/박람회">전시/박람회</option>
	<option value="패션/뷰티">패션/뷰티</option>
	<option value="이벤트/파티">이벤트/파티</option>
	<option value="여행">여행</option>
	<option value="후원금모금">후원금모금</option>
	<option value="기타">기타</option>
</select>
</td>
</tr>

<tr>
<td class="bw_title">관심분야</td>
<td>
<select name="B_FAV_FIELD">
	<option value="프로그래밍">프로그래밍</option>
	<option value="네일아트">네일아트</option>
	<option value="공예">공예</option>
	<option value="작곡/작사">작곡/작사</option>
	<option value="번역/통역">번역/통역</option>
	<option value="디자인">디자인</option>
	<option value="분석">분석</option>
	<option value="운동">운동</option>
	<option value="기타">기타</option>
</select>
</td>
</tr>

<tr>
<td class="bw_title">관심지역</td>
<td>
<select name="B_FAV_AREA">
	<option value="서울">서울</option>
	<option value="부산/울산/경남">부산/울산/경남</option>
	<option value="인천/경기">인천/경기</option>
	<option value="대전/충청/세종">대전/충청/세종</option>
	<option value="광주/전라">광주/전라</option>
	<option value="강원">강원</option>
	<option value="대구/경북">대구/경북</option>
	<option value="제주">제주</option>
	<option value="기타">기타</option>
</select>
</td>
</tr>

<tr>
<td class="bw_title">비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
<td><input type="number" name="B_PAYMENT" value="0" maxlength="10"><b style="font-size: xx-small;font-family:monospace;color: gray;">&nbsp;&nbsp;*값을 0원으로 설정하면, 무료로 표시됩니다.</b></td>
</tr>

<tr>
<td class="bw_title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td><input id="b_subject" type="text" name="B_SUBJECT" maxlength="50"></td>
</tr>

<tr>
<td colspan="2"><textarea id="b_content" name="B_CONTENT"></textarea></td>
</tr>

<tr>
<td colspan="2" align="right" style="border:none;">
<input type="submit" value="저장">
<input type="button" value="취소" onclick="location.href='<c:url value="/board"/>'">
</td>
</tr>

</table>
</form>

</body>
</html>