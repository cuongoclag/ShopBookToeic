<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- spring taglibs -->


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
<script type="text/javascript">
	$(document).ready(function () {
		$('#images').change(function () {
			showImageThumbnail(this);
		});
	});
	function showImageThumbnail(fileInput) {
		file = fileInput.files[0];
		reader = new FileReader();
		reader.onload = function (e) {
			$('#thumbnail').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);

	}
</script>

</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<div class="container" id="resultsearch">
		<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
		<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">

		<div class="row">
			<div class="span6">
				<h3 style="color: #0e90d2">Vui lòng chọn 1 trong 2 cách thanh toán sau :</h3
				<p>-Thanh toán bằng QR Code</p>
				<img src="${qrcode}" style="width:350px; height:350px;" alt="qrcode"/ >

				<p>-Thanh toán bằng chuyển khoản</p>
				<p>Vietcombank : cpdenglish</p>
				<p>STK : 2727272727</p>
			</div>
			<div class="span6">
				<h3 style="color: #0e90d2">Vui lòng gửi ảnh thanh toán tại đây :</h3>
				<form action="${base }/cart/thankyouQR" method="post" enctype="multipart/form-data">
					<input class="form-control" type="file" name="images" id="images" required/>
					<br/>
					<img id="thumbnail" alt="Review Images">
					<br/>
					<button type="submit" class="btn btn-primary" style="width: 30%; height: 3rem; font-size: 20px; font-weight: bold;">
						Xác Nhận</button>
				</form>
			</div>
		</div>
	</div>
	<!--Footer==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->
</body>

</html>