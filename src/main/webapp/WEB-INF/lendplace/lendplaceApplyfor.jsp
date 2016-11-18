<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.detail.css"/>">
<script src="<c:url value="/resources/js/lendplace.write.js"/>"></script>
<script type="text/javascript">

</script>
</head>
<body>
<table width=930px border="0" align=center>
<tr>
<td>

<table style="width:100%;" border="0">
	<tr>
		<td style="font-weight: bold;font-size: large;font-family: sans-serif;">장소 상세보기</td>
		<td align="right"><input type="button" value="목록보기" onclick="location.href='<c:url value="/lendplace?currentPageNo=${currentPageNo}"/>'"></td>
	</tr>
</table>

<table class="md_header_table">
<tr>

<td width="15%" class="md_header_table_td1">
<div><img class="md_header" src="${applyData.L_REP_IMG }" ></div>
</td>

<td width="85%" class="md_header_table_td2">

<div class="md_header_subject">${applyData.L_TITLE }</div>
<br>
<table border="0">
<tr>
<td>주소 : ${applyData.L_ADDR }</td>
</tr>
<tr>
<td>수용인원 : ${applyData.L_PNUM }명</td>
</tr>
<tr>
<td>대관시간 : ${applyData.L_SDATE }~${applyData.L_EDATE }</td>
</tr>
<tr>
<td>대관금액 : 원</td>
</tr>
<tr>
<td>대여횟수 : ${applyData.L_USE_NUM }번</td>
</tr>
</table>
<hr class="md_hr">



<table  align="right">
</table>

</td>
</tr>
</table>

<!-- 위쪽과 아래쪽 테이블 분기선 -->
<hr class="md_hr">

<form name="applyForm" action="<c:url value="/lendplace/applyfor"/>" method="post" theme="simple">
<table class="md_content">
<tr><td>

		<table border="0" align=center cellpadding=5 width=500px>
		<input type="hidden" name="l_no" value="${applyData.L_NO}">
			<tr>
				<td align=right><font color="red">*</font> 신청하는 장소&nbsp;&nbsp; </td>
				<td><b>${applyData.L_TITLE}</b></td>
			</tr>
			
			<tr>
				<td align=right><font color="red">*</font> 신청시간&nbsp;&nbsp;</td>
				<td><input type="text" class="dtpicker" name="la_sdate" id="startdt" size="13" />&nbsp;~&nbsp;<input type="text" class="dtpicker" name="la_edate" id="enddt" size="13"  />
				</td>
			</tr>

			<tr>
				<td align=right><font color="red">*</font> 신청자 이름&nbsp;&nbsp;</td>
				<td><input type="text" value="${applyData.M_NAME }" /></td>
			</tr>
			<tr>
				<td align=right><font color="red">*</font> 신청자 전화번호&nbsp;&nbsp;</td>
				<td><input type="number" value="${applyData.M_PHONE }" /></td>
			</tr>
			<tr>
				<td align=right><font color="red">*</font> 신청자 이메일&nbsp;&nbsp;</td>
				<td><input type="text" value="${applyData.M_EMAIL }" /></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="button" value="취소" onclick="javascript:history.back();">&nbsp;&nbsp;&nbsp;
				<input type="submit" value="접수완료" style="width:130px;">
				</td>
			</tr>
		</table>

</td></tr>
</table>
</form>


</td>
</tr>
</table>
</body>
</html>