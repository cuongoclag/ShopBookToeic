<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý bài tập đọc</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>

	<link rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/ace.min.css"
		  class="ace-main-stylesheet" id="main-ace-style" />
<style type="text/css">
   .hidden {
      display: none;
   }
   .error-message {
     color: red;
   }

</style>
</head>
<body>
    <jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
		<h3 class="page-header">Quản lý Bài Đọc</h3>
		<button class="btn btn-success btnAddExam" data-toggle="modal"
				data-target="#baiDocModal">Thêm mới</button>
		<h4 style="color: red" id="info-success"></h4>
		<hr/>
		<form class="form-inline" id="searchForm" name="searchObject">
			<div class="form-group">
				<select class="form-control" name="partSearch" id="partSearch">
					<option value="">Tất cả</option>
					<option value="5">Part 5</option>
					<option value="6">Part 6</option>
					<option value="7">Part 7</option>
				</select>
			</div>&nbsp;&nbsp;
<%--			<div class="form-group">--%>
<%--				<select class="form-control" name="doKhoSearch" id="doKhoSearch">--%>
<%--					<option value="">Tất cả</option>--%>
<%--					<option value="1">Mức dễ</option>--%>
<%--					<option value="2">Mức trung bình</option>--%>
<%--					<option value="3">Mức khó</option>--%>
<%--				</select>--%>
<%--			</div>--%>
<%--			&nbsp;&nbsp;--%>
			<button type="button" class="btn btn-primary" id="btnDuyetBaiNghe">Duyệt Bài đọc</button>
		</form>
		<hr />
		<table class="table table-hover nhanHieuTable">
			<thead>
			<tr>
				<th>ID</th>
				<th>Tên bài đọc</th>
				<th>Part LC</th>
				<th></th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

	<div class="modal fade" id="baiDocModal" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLable">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal">Thêm mới Bài Đọc.</h4>
				</div>
				<div class="modal-body">
					<input style="display:none" id="idReading">
					<div class="row">
						<span class="bg-danger" id="vocab_errors"></span>

						<div class="form-group col-md-6">
							<label>Tên bài Bài Đọc</label> <input id="namebaidoc"
																   class="form-control">
						</div>
						<div class="form-group col-md-6">
							<label for="name">Phần thi (Part)</label>
							<select id="phanThi" class="form-control" name="part">
								<option value="5">Part 5-Complete sentence</option>
								<option value="6">Part 6-Complete the paragraph</option>
								<option value="7">Part 7-Reading comprehension</option>
							</select>
						</div>
						<div class="form-group col-md-6">
							<label for="name">Do Kho</label>
							<select name="doKho" id="doKho" class="form-control">
								<option value="1">Mức dễ</option>
								<option value="2">Mức trung bình</option>
								<option value="3">Mức khó</option>
							</select>
						</div>
						<div class="form-group col-md-12">
							<label for="fileExcel">File nội dung (Excel):</label> <input
								type="file" class="form-control" id="file_Excel"
								name="file_Excel" required accept=".xlsx">
						</div>
						<div class="form-group col-md-12">
							<label for="fileAnhCauHoi">File ảnh:</label> <input
								type="file" class="form-control" id="file_image_question"
								name="file_Image_Question" required accept="image/*" multiple>
						</div>
						<div class="form-group col-md-12">
							<label for="fileNghe">File Audio:</label> <input
								type="file" class="form-control" id="file_reading"
								name="file_Excel" required multiple accept=".mp3,.org">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="btnAddNewReading" class="btn btn-primary">Xác nhận</button>
					<button type="button" style="display:none;" id="btnUpdateReading" class="btn btn-primary">Cập nhật</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="template/footer.jsp"></jsp:include>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<script src="<c:url value='/js/admin/quanLyBaiDoc.js'/>" ></script>
</body>
</html>