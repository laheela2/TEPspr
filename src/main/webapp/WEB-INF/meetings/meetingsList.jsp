<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.list.css"/>">
<script src="<c:url value="/resources/js/meetings.list.js"/>"></script>
</head>

<body>
<table border="0" width=900px cellpadding=15 align=center>
<tr>

<!-- 모임 리스트 -->
<td width="80%">

<table border="0" width=100% cellpadding=5>
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
							<a href="#this" id="title" onclick="fn_meetingsDetail($(this))"><img id="repIMG" src='${row.MT_REP_IMG }'/></a>
							<input type="hidden" id="mt_no" value="${row.MT_NO }">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="om_view_title">
							<a href="#this" id="title" onclick="fn_meetingsDetail($(this))">${row.MT_TITLE }</a>
							<input type="hidden" id="mt_no" value="${row.MT_NO }">
						</td>
					</tr>
					<tr>
						<td align="center" id="likeitBtnTd">
							<input type="hidden" id="mt_no" value="${row.MT_NO }">
							<a href="#this" id="likeitBtn" onclick="fn_meetingsLikeit($(this))">♡</a>
							<span id="likeitCount">
								<c:choose>
									<c:when test="${row.MT_LIKEIT == null || row.MT_LIKEIT <= 0}">0</c:when>
									<c:otherwise>${row.MT_LIKEIT}</c:otherwise>
								</c:choose>
							</span>
						</td>
						
						<td align="right" style="border-left:0;">
							<c:choose>
								<c:when test="${row.MT_PERMIT_PNUM <= 0 }">
									<input id="applyforBtnDisabled" type="button" value="신청마감" disabled="disabled">
								</c:when>
								<c:otherwise>
									<input id="applyforBtn" type="button" value="${row.MT_PERMIT_PNUM }명 신청가능"" onclick="fn_meetingsApplyfor($(this))">
									<input type="hidden" id="mt_no" value="${row.MT_NO }">
								</c:otherwise>
							</c:choose>
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
		<input type="button" value="글쓰기" id="write" style="float:right;margin-top: -6px;">
	</td>
</tr>

</table>

<td width="20%" valign="top">
<!-- 모임개설 검색 카테고리 -->
<div class="title" style="padding-top:53px;">모임제목 / 본문</div>
<div style="padding-left:2.2px;padding-right:2.2px;">
	<form name="search_form" action="<c:url value="/meetings"/>" method="post">
		<input type="hidden" name="currentPageNo" value="${currentPageNo }">
		<input id="searchCate" type="hidden" name="searchCategory" value="${searchCategory }">
		<input id="searchAddr" type="hidden" name="searchAddr" value="${searchAddr }">
		<input id="searchMStart" type="hidden" name="searchMStart" value="${searchMStart }">
		<input id="searchMEnd" type="hidden" name="searchMEnd" value="${searchMEnd }">
		<input id="searchbox" type="text" name="searchWord" value="${searchWord }" maxlength="13" 
		placeholder="키워드로 모임을 검색하세요" title="키워드로 모임을 검색하세요">
		<input type="image" class="btnEventSearch" alt="검색" 
		src='<c:url value="/resources/image/btnEventSearch.gif"/>' 
		onmouseover="this.src='<c:url value="/resources/image/btnEventSearchOn_red.gif"/>'" 
		onmouseout="this.src='<c:url value="/resources/image/btnEventSearch.gif"/>'">
	</form>
</div>

<br>

<div class="title">카테고리</div>
<table class="category">
	<tr>
		<td>교육</td>
		<td>강연</td>
	</tr>
	<tr>
		<td>세미나|컨퍼런스</td>
		<td>문화|예술</td>
	</tr>
	<tr>
		<td>방송|연예</td>
		<td>취미활동</td>
	</tr>
	<tr>
		<td>소모임|친목행사</td>
		<td>공모전</td>
	</tr>
	<tr>
		<td>전시|박람회</td>
		<td>패션|뷰티</td>
	</tr>
	<tr>
		<td>이벤트|파티</td>
		<td>여행</td>
	</tr>
	<tr>
		<td>후원금모금</td>
		<td>기타</td>
	</tr>
</table>

<br>

<div class="title">지역</div>
<table class="area">
	<tr>
		<td>서울</td>
		<td>부산|울산|경남</td>
	</tr>
	<tr>
		<td>인천|경기</td>
		<td>대전|충정|세종</td>
	</tr>
	<tr>
		<td>광주|전라</td>
		<td>강원</td>
	</tr>
	<tr>
		<td>대구|경북</td>
		<td>제주</td>
	</tr>
</table>

<br>

<div class="title">모임기간</div>
<div style="text-align: center;">
	<input type="text" class="dtpicker" id="startdt" size="5">&nbsp;&nbsp;~&nbsp;
	<input type="text" class="dtpicker" id="enddt" size="5">
</div>
<div class="hint">*시작과 종료를 모두 선택해야 검색됩니다.</div>

</table>

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("#write").on("click", function(e){ // 모임 개설
            e.preventDefault();
	        if(isLoginCheck("${sessionScope.session_m_email}")){
            	fn_meetingsWrite();
	        }
        });
    });
     
    function fn_meetingsWrite(){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/meetings/write' />");
        cs.submit("GET");
    }
    
    function fn_meetingsLikeit(obj){
        if(isLoginCheck("${sessionScope.session_m_email}")){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/meetings/likeit' />");
	        cs.addParam("mt_no", obj.parent().find("#mt_no").val());
	       	cs.addParam("currentPageNo", "${currentPageNo}");
	        cs.submit();
        }
    }
    
    function fn_meetingsApplyfor(obj){
    	if(isLoginCheck("${sessionScope.session_m_email}")){
	        var cs = new CustomSubmit();
	        cs.setUrl("<c:url value='/meetings/applyfor' />");
	        cs.addParam("mt_no", obj.parent().find("#mt_no").val());
	        cs.addParam("currentPageNo", "${currentPageNo}");
	        cs.submit();
        }
    }
    
    function fn_meetingsDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/meetings/detail' />");
        cs.addParam("mt_no", obj.parent().find("#mt_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 

</body>
</html>