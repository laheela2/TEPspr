<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/board.list.css'/>">
</head>
<body>

<div class="col-md-9">
	<div class="heading">
		<h3>게시판내역</h3>
	</div>
<br>

	<table class="table">
		<thead>
			<tr align="center">
				<td>번호</td>
				<td>종류</td>
				<td width="50%">제목</td>
				<td>작성자</td>
				<td>등록일</td>
				<td>조회수</td>
            </tr>
        </thead>
        
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
					<tr align="center">
						<td>${row.B_NO}</td>
						<td class="board_kind">
						<c:if test="${row.B_KIND == 1 }">
							<font class="board_title_kind">[스승찾아요]</font>
						</c:if>
						<c:if test="${row.B_KIND == 2 }">
							<font class="board_title_kind">[제자찾아요]</font>
						</c:if>
						<c:if test="${row.B_KIND != 1 || row.B_KIND != 2}">
							<font class="board_title_kind">[일반게시물]</font>
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
			<tr align="center">
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
											<input type="text"  style="height:31px;" name="searchWordB" size="33" maxlength="15" />
											
										</td>
										<td>
											<button class="btn btn-default" type="submit"><i class="fa fa-send"></i></button>
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
	
				
		</tbody>
	</table>
	</div>
</div>
</div>

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