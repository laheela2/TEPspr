<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/board.list.css'/>">
</head>
<body>
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
					<td class="board_subject">
						<a href="#" name="subject">${row.B_SUBJECT}</a>
						<input type="hidden" id="B_NO" value="${row.B_NO}">
					</td>
					<td>${row.B_NAME }</td>
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
			<c:if test="${sessionScope.session_m_email != null}">
				<input type="button" value="글쓰기" id="write" style="float:right;margin-top: -6px;">
			</c:if>
		</td>
	</tr>

<!-- 게시판 검색 -->
<tr>

<td colspan="6" align="center">
	<form method="post" action="<c:url value='board'/>">
		<table>
		<tr>
		<td>
		<select name="searchKey">
			<option value="0" selected="selected">제목</option>
			<option value="1">제목+내용</option>
			<option value="2">작성자</option>
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
        $("#write").on("click", function(e){ // 글쓰기 버튼
            e.preventDefault();
            fn_boardWrite();
        }); 
         
        $("a[name='subject']").on("click", function(e){ // 글상세보기
            e.preventDefault();
            fn_boardDetail($(this));
        });
    });
     
    function fn_boardWrite(){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='boardWrite' />");
        cs.submit();
    }
    
    function fn_boardDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='boardDetail' />");
        cs.addParam("B_NO", obj.parent().find("#B_NO").val());
        cs.submit();
    }
</script> 


</body>
</html>