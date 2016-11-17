<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet"  type="text/css" href="<c:url value="/resources/css/meetings.list.css"/>">
<script src="<c:url value="/resources/js/meetings.list.js"/>"></script>
</head>

<body>
<table border="0" cellpadding=15 width=900px align=center>
<tr>

<!-- 장소 리스트 -->
<td width="80%">
<table border="0" width=100% cellpadding=5>
<tr>
<td colspan="3"><font style="font-weight: bold;font-size: x-large;">장소</font></td>
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
							<a href="#this" id="title" onclick="fn_lendplaceDetail($(this))"><img id="repIMG" src='${row.L_REP_IMG }'/></a>
							<input type="hidden" id="l_no" value="${row.L_NO }">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="om_view_title">
							<a href="#this" id="title" onclick="fn_lendplaceDetail($(this))">${row.L_TITLE }</a>
							<input type="hidden" id="l_no" value="${row.L_NO }">
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
<td colspan="3" class="paging">${pagingHtml }</td>
</tr>

</table>

<td width="20%" valign="top">

<div class="title" style="padding-top:53px;">장소 키워드검색</div>
<div style="padding-left:2.2px;padding-right:2.2px;">
<form name="search_form" action="<c:url value="/lendplace"/>" method="post">
<input id="search_people" type="hidden" name="search_people">
<input id="search_area" type="hidden" name="search_area">
<input id="search_payment" type="hidden" name="search_payment">
<input id="searchbox" type="text" name="searchWord" value="${searchWord }" maxlength="13" placeholder="예)역삼동,음향,주차 등" title="예)역삼동,음향,주차 등"/>
<input type="image" src="/TEP/static/image/btnEventSearch.gif" class="btnEventSearch" alt="검색" onmouseover="this.src='/TEP/static/image/btnEventSearchOn_red.gif'" onmouseout="this.src='/TEP/static/image/btnEventSearch.gif'">
</form>
</div>
<br>

<div class="title">수용인원</div>
<table class="people">
<tr>
<td>0~20명</td>
<td>20~50명</td>
</tr>
<tr>
<td>50~100명</td>
<td>100명이상</td>
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

<div class="title">유/무료</div>
<table class="payment">
<tr>
<td>유료</td>
<td>무료</td>
</tr>
</table>



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
     
    
    function fn_lendplaceDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/lendplace/detail' />");
        cs.addParam("l_no", obj.parent().find("#l_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 

</body>
</html>