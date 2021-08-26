<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>


<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/client/home.js"></script>


</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<!-- Search -->

	<div class="container">

		<div class="row">

			<br>
			<div class="span12">
				<div class="navbar  pull-right">
					<div id="size">
						<form name="myform">

							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End search -->

	<div class="container" id="resultsearch">
	<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
	<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
		<div class="row">
			<div class="span12 cnt-title">
				<h1>Thư viện sách phong phú</h1>
				<span>--- Chọn sách phù hợp với bản thân ---</span>
			</div>
			<div class="span12" style="background-image : url(${pageContext.request.contextPath}/resources/file/images/banner1.png);
								background-repeat: no-repeat; 
								background-size: cover; 
								position: relative;
								height : 35rem;">
				<div style="text-align: center;background-image:linear-gradient(135deg, #3C8CE7 10%, #00EAFF 100%);  width: 19rem;height: 5rem;position: absolute;top: 30%;right: 23%;line-height: 5rem;">
					<a href="/listBook" style=" font-size: 3rem; color: white">
						Mua Sách &rarr;</a>
				</div>

			</div>
		</div>

		<!-- Feature 
  ==============================================-->


		<div class="row feature-box">
			<div class="span12 cnt-title">
				<h1>Cung cấp các giao diện học và thi thân thiện.</h1>
				<span>--- Học thử, Làm bài tập, Thi thử ---</span>
			</div>

			<div class="span4">
				<img
					src="${pageContext.request.contextPath}/resources/file/images/feature-vocabulary1.jpg">

				<h2>Học từ vựng, ngữ pháp</h2>
				<p>Các bài hướng dẫn đơn giản, dễ hiểu.</p>
				<a href="#" id="modal1" class="openModalFunction">Chi tiết &rarr;</a>

			</div>

			<div class="span4">
				<img
					src="${pageContext.request.contextPath}/resources/file/images/feature-listenandread.jpg">
				<h2>Bài tập phần nghe, đọc</h2>
				<p>Sử dụng các dạng bài tập thường xuyên xuất hiện.</p>
				<a  href="#" id="modal2" class="openModalFunction">Chi tiết &rarr;</a>
			</div>

			<div class="span4">
				<img
					src="${pageContext.request.contextPath}/resources/file/images/feature-lamdethithu.jpg"
					height="170px" width="270px">
				<h2>Đề thi thử</h2>
				<p>Cập nhật, đổi mới liên tục, sát với đề thi thật nhất.</p>
				<a href="#" class="doExam" id="doExam">Chi tiết &rarr;</a>
			</div>
		</div>


		<!-- /.Feature -->
		<!-- Row View -->
	</div>


	<!-- /.Row View -->



	<!--Footer
==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->


	<!-- Start Modal -->

	<div class="modal fade" id="openModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">DANH SÁCH LOẠT BÀI HƯỚNG DẪN</h4>
				</div>

				<div class="modal-body">

					<div class="media">
						<a class="pull-left"><img src="" id="image1" class="media-object"  /></a>
						<div class="media-body">
							<h3>
								<a href="" id="name1" name="name1"></a>
							</h3>
						</div>
					</div>

					<div class="media">
						<a class="pull-left"><img src="" id="image2" class="media-object"  /></a>
						<div class="media-body">
							<h3>
								<a href="" id="name2" name="name2"></a>
							</h3>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Thoát</button>
				</div>

			</div>
		</div>
	</div>
	<!-- End Modal -->

</body>
</html>