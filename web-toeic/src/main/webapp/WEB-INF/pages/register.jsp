<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
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


	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<!-- Wrap -->
	<div id="wrap">
	<div id="content">

		<!--======= PAGES INNER =========-->
		<section class="chart-page padding-top-100 padding-bottom-100">
			<div class="container">

				<!-- Payments Steps -->
				<div class="shopping-cart">

					<!-- SHOPPING INFORMATION -->
					<div class="cart-ship-info register">
						<div class="row">

							<!-- ESTIMATE SHIPPING & TAX -->
							<div class="col-sm-12">
								<h6>ĐĂNG KÝ</h6>
								<form:form method="POST" action='register' modelAttribute="newUser">
									<ul class="row">

										<!-- Name -->
										<li class="col-md-6">
											<label> *EMAIL
												<form:input type="email" path="email"
															placeholder="" autofocus="true" ></form:input>
												<form:errors class="error" cssStyle="color: red" path="email"></form:errors>
											</label>
										</li>
										<!-- LAST NAME -->
										<li class="col-md-6">
											<label> *MẬT KHẨU
												<form:input type="password" path="password"
															 placeholder=""></form:input>
												<form:errors class="error" cssStyle="color: red" path="password"></form:errors>
											</label>
										</li>

										<!-- EMAIL ADDRESS -->
										<li class="col-md-6">
											<label> *HỌ VÀ TÊN
												<form:input type="text" path="fullName"
															placeholder="" ></form:input>
												<form:errors class="error" cssStyle="color: red" path="fullName"></form:errors>
											</label>
										</li>
										<!-- PHONE -->
										<li class="col-md-6">
											<label> *NHẮC LẠI MẬT KHẨU
												<form:input type="password" path="confirmPassword"
															placeholder=""></form:input>
												<form:errors class="error" cssStyle="color: red" path="confirmPassword"></form:errors>
											</label>
										</li>

										<!-- LAST NAME -->
										<li class="col-md-6">
											<label> *SỐ ĐIỆN THOẠI
												<form:input type="number" path="phone"
															placeholder="" ></form:input>
												<form:errors class="error" cssStyle="color: red" path="phone"></form:errors>
											</label>
										</li>

										<!-- LAST NAME -->
										<li class="col-md-6">
											<label> *ĐỊA CHỈ
												<form:input type="text" path="address"
															placeholder="" ></form:input>
												<form:errors class="error" cssStyle="color: red" path="address"></form:errors>
											</label>
										</li>

										<li class="col-md-6">
											<button type="submit" class="btn">ĐĂNG KÝ NGAY</button>
										</li>
										<p style="font-size: 18; padding-top: 10px"> Bạn đã có tài khoản? <a href="<c:url value='/signin'/> ">Đăng nhập</a></p>
									</ul>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	</div>


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