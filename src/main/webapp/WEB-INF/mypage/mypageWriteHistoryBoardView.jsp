<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/board.list.css'/>">
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
							<strong>&nbsp;&nbsp;게시판내역</strong>
						</td>
					</tr>
				</table>
				<br>

<table class="board" align=center cellspacing=0 border="0">
	<tr class="board_head_tr">
		<td>번호</td>
		<td>종류</td>
		<td width="55%">제목</td>
		<td>작성자</td>
		<td>등록일</td>
		<td>조회수</td>
	</tr>

	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.B_NO}</td>
					<td class="board_kind">
						<c:if test="${row.B_KIND == 1 }">
							<font class="board_subject_kind">[스승찾아요]</font>
						</c:if>
						<c:if test="${row.B_KIND == 2 }">
							<font class="board_subject_kind">[제자찾아요]</font>
						</c:if>
						<c:if test="${row.B_KIND != 1 || row.B_KIND != 2}">
							<font class="board_subject_kind">[일반게시물]</font>
						</c:if>
					</td>					
					<td class="board_title">
						<a href="#" name="title">${row.B_TITLE}</a>
						<input type="hidden" id="b_no" value="${row.B_NO}">
					</td>
					<td>${sessionScope.session_m_name }</td>
					<td><fmt:formatDate value="${row.B_DATE}" pattern="yyyy.MM.dd"/></td>
					<td>${row.B_READCOUNT}</td>
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
							<form method="post" action="<c:url value='/writeHistoryBoard'/>">
								<table>
									<tr>
										<td>
											<select name="searchKeyB">
												<option value="0" selected="selected">제목</option>
												<option value="1">제목+내용</option>
											</select>
										</td>
										<td>
											<input type="text" name="searchWordB" size="33" maxlength="15" />
										</td>
										<td>
											<input type="submit" value="검색" />
										</td>
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
            fn_boardDetail($(this));
        });
    });
    
    function fn_boardDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/mypageBoardDetail' />");
        cs.addParam("b_no", obj.parent().find("#b_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 


</body>
</html>