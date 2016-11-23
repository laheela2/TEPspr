<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script src="<c:url value="/resources/js/admin.lendplace.write.js"/>"></script>
</head>
<body>

	<div class="row">

		<div class="col-lg-12">
			<h1 class="page-header">장소등록</h1>
		</div>

		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form" action="<c:url value="/admin/lendplace/write"/>" onsubmit="return valueChk(this)" method="post" enctype="multipart/form-data" theme="simple">
								<div class="form-group col-lg-12">
									<label class="col-sm-2">업체 이름</label>
									<div class="col-lg-6">
										<input class="form-control" name="l_name">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">업체 URL</label>
									<div class="col-lg-6">
										<input class="form-control" name="l_email">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">업체 전화번호</label>
									<div class="col-lg-6">
										<input class="form-control" name="l_phone">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">장소명</label>
									<div class="col-lg-6">
										<input class="form-control" name="l_title">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">주소</label>
									<div class="col-lg-6">
										<input class="form-control" name="l_addr">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">대관가능시간</label>
									<div class="col-sm-5 col-lg-3">
										<input class="form-control" id="startdt" name="l_sdate" placeholder="시작시간">
									</div>
									<div class="col-sm-5 col-lg-3">
										<input class="form-control" id="enddt" name="l_edate"  placeholder="종료시간">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">수용인원</label>
									<div class="col-lg-1">
										<input class="form-control" name="l_pnum" type="number">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">이미지 1</label>
									<div class="col-lg-10">
										<input type="file" name="file1">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">이미지 2</label>
									<div class="col-lg-10">
										<input type="file" name="file2">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">이미지 3</label>
									<div class="col-lg-10">
										<input type="file" name="file3">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-sm-2">이미지 4</label>
									<div class="col-lg-10">
										<input type="file" name="file4">
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="col-lg-2">내용</label>
									<div class="col-lg-6">
										<textarea class="form-control" rows="3" name="l_content"></textarea>
									</div>
								</div>

								<div class="col-sm-7 col-lg-6" align="right">
									<button type="submit" class="btn btn-default">저장하기</button>
									<button type="reset" class="btn btn-default">지우기</button>
								</div>
							</form>
						</div>
					</div>
					<!-- /.row (nested) -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>

	</div>

</body>
</html>