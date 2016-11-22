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
                <h1>Mypage</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/main"/>">홈</a>
                    </li>
                    <li>Q&A 내역</li>
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
		<h3>문의내역</h3>
	</div>
	<br>
	
<table class="table">
		<thead>
			<tr align="center">
				<td>번호</td>
				<td>제목</td>
				<td width="55%">내용</td>
				<td>등록일</td>
            </tr>
        </thead>
	<tbody>
	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row">
				<tr align="center">
					<td>
					${row.Q_NO}
					</td>
					<td>${row.Q_TITLE}</td>
					<td align="left">
						<a href="#" name="title">${row.Q_CONTENT}</a>
						<input type="hidden" id="q_no" value="${row.Q_NO}">
					</td>
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
			<ul class="pagination">${pagingHtml}</ul>
		</td>
	</tr>

<!-- 게시판 검색 -->
<tr>
<td colspan="6" align="center">
<form method="post" action="<c:url value='/qnaHistory'/>">
		<table>
		<tr>
		<td>
		<select name="searchKey" class="form-control"class="form-control">
			<option value="0" selected="selected">제목</option>
			<option value="1">제목+내용</option>
		</select>
		</td>
		<td>
			<input type="text"  style="height:32.3px;" name="searchWord" size="33" maxlength="15" />
		</td>
		<td>
		<br>
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
</div>
</div>
</div></section></div></div>

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("a[name='title']").on("click", function(e){ // 글상세보기
            e.preventDefault();
            fn_qnaDetail($(this));
        });
    });
    
    function fn_qnaDetail(obj){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/mypage/QnaDetail' />");
        cs.addParam("q_no", obj.parent().find("#q_no").val());
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 

</body>
</html>