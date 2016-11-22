<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript"> $(function(){ $('#navigation').find('#nav_videolec').addClass('active'); });</script>
</head>

<body>

<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>동영상 목록</h1>
            </div>
            <div class="col-md-6">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/videolec"/>">영상</a></li>
                    <li>목록</a></li>
                </ul>

            </div>
        </div>
    </div>
</div>

<div id="content">
    <div class="container">

			<section>
				<div class="row">
					<div class="col-md-12">
						<div class="heading">
							<h3>다양한 강의 영상으로 배움을 실천 해보세요.<i class="fa fa-heart"></i></h3>
						</div>
					</div>
				</div>

				<div class="row portfolio no-space">

					<c:forEach items="${list}" var="row">
						<div class="col-sm-4">
							<div class="box-image">
								<div class="image">
									<img src="https://img.youtube.com/vi/${row.V_VIDEO_ID}/0.jpg"" alt="" class="img-responsive">
								</div>
								<div class="bg"></div>
								<div class="name">
									<h3>
										<a href="#this" onclick="fn_videolecDetail('${row.V_NO }')">${row.V_TITLE }</a>
									</h3>
								</div>
								<div class="text">
									<p class="hidden-sm">${row.V_CONTENT }</p>
									<p class="buttons">
										<a href="#this" class="btn btn-template-transparent-primary" onclick="fn_videolecDetail('${row.V_NO }')"><i class="fa fa-eye"></i> View</a>
										<a href="https://www.youtube.com/watch?v=${row.V_VIDEO_ID}&list=${row.V_LIST_ID}" class="btn btn-template-transparent-primary"><i class="fa fa-youtube"></i>Youtube</a>
									</p>
								</div>
							</div>
							<!-- /.box-image -->
						</div>
					</c:forEach>
				</div>

				<div class="col-md-12 text-center">
					<ul class="pagination pagination-lg">${pagingHtml}</ul>
				</div>
			</section>

		</div>
    <!-- /.container -->
</div>
<!-- /#content -->

<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script type="text/javascript">
    function fn_videolecDetail(v_no){
        var cs = new CustomSubmit();
        cs.setUrl("<c:url value='/videolec/detail' />");
        cs.addParam("v_no", v_no);
        cs.addParam("currentPageNo", "${currentPageNo}");
        cs.submit();
    }
</script> 

</body>
</html>