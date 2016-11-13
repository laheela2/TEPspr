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
		<td>카테고리</td>
		<td width="55%">제목</td>
		<td>작성자</td>
		<td>등록일</td>
	</tr>

	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.Q_NO}</td>
					<td>${row.Q_CATEGORY1}</td>				
					<td class="board_title">
						<a href="#" name="title">${row.Q_TITLE}</a>
						<input type="hidden" id="q_no" value="${row.Q_NO}">
					</td>
					<td>${row.Q_NAME}</td>
					<td><fmt:formatDate value="${row.Q_DATE}" pattern="yyyy.MM.dd"/></td>
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
			<input type="button" value="글쓰기" id="write" style="float:right;margin-top: -6px;">
		</td>
	</tr>

<!-- 게시판 검색 -->
<tr>

<td colspan="6" align="center">
	<form method="post" action="<c:url value='/qna'/>">
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
            if(sessionCheck('${sessionScope.session_m_email}')){
            	fn_boardWrite();
            };
        }); 
         
        $("a[name='title']").on("click", function(e){ // 글상세보기
            e.preventDefault();
            fn_boardDetail($(this));
        });
    });
     
    function fn_boardWrite(){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/qna/write' />");
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit("GET");
    }
    
    function fn_boardDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/qna/detail' />");
        cs.addParam("q_no", obj.parent().find("#q_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 


</body>
</html>