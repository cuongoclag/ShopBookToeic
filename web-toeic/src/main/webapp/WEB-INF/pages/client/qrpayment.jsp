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

	<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/web/rs-plugin/css/settings.css" media="screen" />

	<!-- Bootstrap Core CSS -->
	<link href="${pageContext.request.contextPath}/resources/web/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="${pageContext.request.contextPath}/resources/web/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/web/css/ionicons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/main.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/responsive.css" rel="stylesheet">

	<!-- JavaScripts -->
	<script src="${pageContext.request.contextPath}/resources/web/js/modernizr.js"></script>

	<!-- Online Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
			<div class="col-md-6">
				<h3 style="color: #0e90d2">Vui lòng chọn 1 trong 2 cách thanh toán sau :</h3>
				<p>-Thanh toán bằng QR Code</p>
				<img src="${qrcode}" style="width:350px; height:350px;" alt="qrcode" />

				<p>-Thanh toán bằng chuyển khoản</p>
				<p>Vietcombank : cpdenglish</p>
				<p>STK : 2727272727</p>
			</div>
			<div class="col-md-6">
				<h3 style="color: #0e90d2">Vui lòng gửi ảnh thanh toán tại đây :</h3>
				<form action="${base }/cart/thankyouQR" method="post" enctype="multipart/form-data">
					<input class="form-control" type="file" name="images" id="images" required/>
					<br/>
					<img id="thumbnail" alt="Review Images">
					<br/>
					<button type="submit" class="btn">Xác Nhận</button>
				</form>
			</div>
		</div>
	</div>
	<!--Footer==========================-->
	<jsp:include page="template/footer.jsp"></jsp:include>
	<!--/.Footer-->

	<script src="${pageContext.request.contextPath}/resources/web/js/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/own-menu.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/jquery.lighter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/owl.carousel.min.js"></script>

	<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.t.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/main.js"></script>
</body>

</html>