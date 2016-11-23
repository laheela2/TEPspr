<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
</head>
<body>
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1>Q&A</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a>
                    </li>
                    <li>Q&A 리스트</li>
                </ul>
            </div>
        </div>
    </div>
</div>
                                    
<div id="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
            <div class="heading">
				<h3>Q&A</h3>
			</div>
<table class="table">
	<thead>
		<tr align="center">
			<td>번호</td>
			<td>제목</td>
			<td width="50%">내용</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>수정/삭제</td>
		</tr>
	</thead>

	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row">

				<tr align="center">
					<td>${row.Q_NO}</td>
					<td>${row.Q_TITLE}</td>				
					<td align="left">
						<a data-toggle="collapse" data-parent="#accordion" href="#faq1" class="" aria-expanded="true">${row.Q_CONTENT}</a>
					</td>
					
					<td>${row.Q_NAME}</td>
					<td><fmt:formatDate value="${row.Q_DATE}" pattern="yyyy.MM.dd"/></td>
					<td>
					<c:if test="${row.Q_NAME == sessionScope.session_m_name}">
						<a href="#this" onclick="fn_qnaModify('${row.Q_NO}');" class="btn btn-template-main btn-sm">수정</a>
						<a href="#this" onclick="fn_qnaDelete('${row.Q_NO}');" class="btn btn-template-main btn-sm">삭제</a>
					</c:if>
                    </td>
				</tr>
				<c:if test="${row.Q_ANSWER != 'false' }">
				<tr align="center">
				<td colspan="6" id="faq1" class="" aria-expanded="true" style="">
						<p>답변내용 : ${row.Q_ANSWER}</p>
				</td>
				</tr></c:if>
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
			<ul class="pagination">${pagingHtml}</ul>
			<button type="button" class="btn btn-danger" style="float:right;" onclick="fn_qnaWrite();"> 글 쓰 기 </button>
		</td>
	</tr>
<!-- 게시판 검색 -->
<tr>

<td colspan="6" align="center">
	<form method="post" action="<c:url value='/qna'/>">
		<table>
		<tr>
		<td>
		<select name="searchKey" class="form-control">
			<option value="0" selected="selected">제목</option>
			<option value="1">제목+내용</option>
			<option value="2">작성자</option>
		</select>
		</td>
		<td>
			<input type="text"  style="height:32.3px;" name="searchWord" size="33" maxlength="15" />
		</td>
		<td>
			<button type="submit" class="btn btn-template-main">
				<i class="fa fa-search"></i>
			</button>
		</td>
		</tr>
		</table>
	</form>
</td>
</tr>
</table>
</div></div></div></div>

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("#write").on("click", function(e){ // 글쓰기 버튼
            e.preventDefault();
            if(isLoginCheck('${sessionScope.session_m_email}')){
            	fn_qnaWrite();
            };
        }); 
    });
     
    function fn_qnaWrite(){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/qna/write' />");
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit("GET");
    }
    
    function fn_qnaModify(q_no){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/qna/modify' />");
        cs.addParam("q_no", q_no);
        cs.submit();
    }
    
    function fn_qnaDelete(q_no){
    	 var cs = new CustomSubmit();
         cs.setUrl("<c:url value='/qna/delete' />");
         cs.addParam("q_no", q_no);
         cs.submit();
    }
</script> 


</body>
</html>