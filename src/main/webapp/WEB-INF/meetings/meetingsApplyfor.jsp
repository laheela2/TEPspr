<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.applyfor.css"/>">
<script type="text/javascript">
	function valueChk(){
		var f = document.oms_form;
		var limit = '${applyData.MT_PERMIT_PNUM}';
		var num = document.getElementById("ma_snum");

		if(!num.value){
			alertify.error("신청 인원이 입력되지 않았습니다.");
			num.focus();
			return false;
		}
		if(num.value > parseInt(limit)){
			alertify.error("신청가능 인원이 초과되었습니다.");
			num.value = "";
			num.focus();
			return false;
		} 
	}
</script>
</head>
<body>
<table width=930px border="0" align=center>
<tr>
<td>

<form name="oms_form" action="<c:url value="/meetings/applyfor"/>" method="post" onsubmit="return valueChk();">
<input type="hidden" name="mt_no" value="${applyData.MT_NO}"/>
<div class="omds_title">신청하기</div>
<table class="omds_header_table">
<tr>

<td width="15%" class="omds_header_table_td1">
<div><img class="omds_header" src="${applyData.MT_REP_IMG }"></div>
</td>

<td width="85%" class="omds_header_table_td2">
<div class="omds_header_subject">${applyData.MT_TITLE }</div>
<br>
<table border="0">
<tr>
<td>모임기간 : ${applyData.MT_MEETDATE }</td>
</tr>
<tr>
<td>모임소개 : ${applyData.MT_SUBJECT }</td>
</tr>
<tr>
<td>모임주소 : ${applyData.MT_ADDR }</td>
</tr>
<tr>
<td>신청인원 : 총${applyData.MT_TOTAL_PNUM }명&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${applyData.MT_PERMIT_PNUM}명 신청가능

<input type="number" id="ma_snum" name="ma_snum" size="1" maxlength="4">명

</td>
</tr>
</table>
</td>
</tr>
</table>

<div class="omds_title">신청자 정보</div>
<table class="omds_member_info">
	<tr>
		<td width="80px" align="center" class="omds_title_td">이름</td>
		<td><input type="text" value="${applyData.MT_NAME }" disabled="disabled"></td>
		<td width="80px" align="center" class="omds_title_td">이메일</td>
		<td><input type="text" value="${applyData.MT_EMAIL}" disabled="disabled"></td>
		<td width="80px" align="center" class="omds_title_td">전화번호</td>
		<td><input type="text" value="${applyData.MT_PHONE}" disabled="disabled"></td>
	</tr>
</table>
 
<div class="omds_btn">
<input type="submit" value="신청완료">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="취소하기" onclick="javascript:history.back();">
</div>
</form>

</td>
</tr>
</table>
</body>
</html>