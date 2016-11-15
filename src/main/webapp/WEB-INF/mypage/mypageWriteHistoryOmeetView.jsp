<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/board.list.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/root.css'/>" type="text/css">
</head>
<body>
<br>
	
	<table align="center" width="920" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td>
	
	<table width=100%>

		<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3">
				<strong>&nbsp;&nbsp;모임개설내역</strong>
			</td>
		</tr>

	</table>
	<br>

<table class="board" align=center cellspacing=0 border="0">

	<tr class="board_head_tr">
			<td>번호</td>
			<td width="55%">제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>조회수</td>
	</tr>
	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.MT_NO}</td>			
					<td class="board_title">
						<a href="#" name="title">${row.MT_SUBJECT}</a>
						<input type="hidden" id="mt_no" value="${row.MT_NO}">
					</td>
					<td>${sessionScope.session_m_name }</td>
					<td><fmt:formatDate value="${row.MT_DATE}" pattern="yyyy.MM.dd"/></td>
					<td>${row.MT_READCOUNT}</td>
				</tr>
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
<!-- 게시판 검색 -->
<tr>
<td colspan="6" align="center">
<form method="post" action="<c:url value='/writeHistoryOmeet'/>">
		<table>
		<tr>
		<td>
		<select name="searchKey">
			<option value="0" selected="selected">제목</option>
			<option value="1">제목+내용</option>
		</select>
		</td>
		<td><input type="text" name="searchWord" size="33" maxlength="15" /></td>
		<td><input type="submit" value="검색" /></td>
		</tr>
		</table>
	</form>
</td>
</tr>
</table>

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("a[name='title']").on("click", function(e){ // 글상세보기
            e.preventDefault();
            fn_omeetDetail($(this));
        });
    });
    
    function fn_omeetDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/mypageOmeetDetail' />");
        cs.addParam("mt_no", obj.parent().find("#mt_no").val());
        cs.submit();
    }
</script> 

</body>
</html>