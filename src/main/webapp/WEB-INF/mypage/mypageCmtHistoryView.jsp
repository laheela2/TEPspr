<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/board.list.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/root.css'/>" type="text/css">
</head>
<body>
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1>Mypage</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a>
                    </li>
                    <li>답글내역</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
	<div class="container features-buttons">
		<section>
			<div class="row">
<%@ include file="/WEB-INF/include/mypage2.jspf" %>
<div class="col-md-9">
<div class="table-responsive">
	<div class="heading">
		<h3>답글내역</h3>
	</div>
	<br>
<table class="table">
		<thead>
			<tr align="center">
				<td>번호</td>
				<td width="50%">내용</td>
				<td>작성자</td>
				<td>등록일</td>
            </tr>
        </thead>
        
    <tbody>
	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row">
				<tr align="center">
					<td>${row.C_NO}</td>			
					<td class="board_title">
							<a href="#" name="content">${row.C_CONTENT}</a>
							<input type="hidden" id="b_no" value="${row.B_NO}">
							<input type="hidden" id="mt_no" value="${row.MT_NO}">
					</td>
					<td>${sessionScope.session_m_name }</td>
					<td><fmt:formatDate value="${row.C_DATE}" pattern="yyyy.MM.dd"/></td>
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


</table>
</div>
</div>
</div></section></div></div>

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
        if($("#b_no").length > 0){
        	cs.setUrl("<c:url value='/mypageBoardDetail' />");
       	 	cs.addParam("b_no", obj.parent().find("#b_no").val());
       		cs.addParam("currentPageNo", "${currentPageNo}");
        	cs.submit();
        }
        else{
        	cs.setUrl("<c:url value='/mypageOmeetDetail' />");
            cs.addParam("mt_no", obj.parent().find("#mt_no").val());
            cs.addParam("currentPageNo", "${currentPageNo}");
            cs.submit();
        }
    }
</script> 

</body>
</html>