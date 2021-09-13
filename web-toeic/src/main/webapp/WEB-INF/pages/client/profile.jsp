<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tài khoản</title>

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
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="container">
		<h3 class="page-header">Thông tin cá nhân</h3>
		<ul class="nav nav-tabs" id="tabs">
			<li class="active"><a href="#information">Cập nhật thông tin</a></li>
			<li><a href="#changePass">Đổi mật khẩu</a></li>
		</ul>

		<div>
			<div class="tab-content">
				<div class="tab-pane active" id="information">
					<form class="form-profile" style="margin: 2% 0;" action="${pageContext.request.contextPath}/profile/update" method="post">
						<div class="form-group">
							<label>Email đăng ký</label>
							<input type="text" readonly class="form-control" value="${user.email }" name="email">

						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" value="${user.id }"
								   name="id">
						</div>
						<div class="form-group">
							<label>Họ Tên</label>
							<input type="text" class="form-control" value="${user.fullName }"
								   name="fullName" required="required">

						</div>
						<div class="form-group">
							<label>Số điện thoại</label>
								<input type="text" class="form-control" value="${user.phone }"
									   name="phone" required="required">
						</div>

						<div class="form-group">
							<label  >Địa chỉ</label>
								<input type="text" class="form-control" value="${user.address }"
									   name="address" required="required">
						</div>
						<input class="btn btn-primary" id="btnSubmit" type="submit"
							   value="Xác nhận" />
					</form>
				</div>
				<div class="tab-pane" id="changePass">
					<form class="formDoiMatKhau" style="margin: 2% 0;">
						<div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>

						<div class="form-group">
							<label for="name">Mật khẩu cũ</label> <input type="password"
								class="form-control" name="oldPassword" required="required" />
						</div>
						<div class="form-group">
							<label for="name">Mật khẩu mới</label> <input type="password"
								class="form-control" name="newPassword" required="required" />
						</div>
						<div class="form-group">
							<label for="name">Nhắc lại mật khẩu mới</label> <input type="password"
								class="form-control" name="confirmNewPassword" required="required" />
						</div>
						<input class="btn btn-primary" type="button" id="btnXacNhanDoiMK"
							value="Xác nhận" />
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>

	<jsp:include page="template/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/web/js/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/own-menu.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/jquery.lighter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/owl.carousel.min.js"></script>

	<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.t.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/main.js"></script>
	<script src="<c:url value='/js/client/profileClient.js'/>"></script>
</body>
</html>