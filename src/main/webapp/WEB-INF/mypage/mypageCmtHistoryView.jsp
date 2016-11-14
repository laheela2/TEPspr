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
				<strong>&nbsp;&nbsp;답글내역</strong>
			</td>
		</tr>
	</table>
	<br>
<table class="board" align=center cellspacing=0 border="0">
	<tr class="board_head_tr">
			<td>번호</td>
			<td width="55%">내용</td>
			<td>작성자</td>
			<td>등록일</td>
	</tr>
	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.C_NO}</td>			
					<td class="board_title">
						<c:if test="${row.b_no ne ''}">
							<a href="#" name="content">${row.C_CONTENT}</a>
							<input type="hidden" id="B_NO" value="${row.B_NO}">
						</c:if>
						<c:if test="${row.o_no ne ''}">
							<a href="#" name="content">${row.C_CONTENT}</a>
							<input type="hidden" id="O_NO" value="${row.O_NO}">
						</c:if>
					</td>
					<td>${sessionScope.session_m_name }</td>
					<td><fmt:formatDate value="${row.C_DATE}" pattern="yyyy.MM.dd"/></td>
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


</table>

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("a[name='content']").on("click", function(e){ // 글상세보기
            e.preventDefault();
            fn_boardDetail($(this));
        });
    });
    
    function fn_boardDetail(obj){
        var cs = new CustomSubmit();
        if($('#B_NO').val()){
        	cs.setUrl("<c:url value='/mypageBoardDetail' />");
       	 	cs.addParam("B_NO", obj.parent().find("#B_NO").val());
        	cs.submit();
        }
        else{
        	cs.setUrl("<c:url value='/mypageOmeetDetail' />");
            cs.addParam("O_NO", obj.parent().find("#O_NO").val());
            cs.submit();
        }
    }
</script> 

</body>
</html>