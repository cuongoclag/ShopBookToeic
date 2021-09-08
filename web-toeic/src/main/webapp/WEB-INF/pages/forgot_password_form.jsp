<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
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
	<div id="wrap">
		<!-- Content -->
		<div id="content">

			<!--======= PAGES INNER =========-->
			<section class="chart-page padding-top-100 padding-bottom-100">
				<div class="container">

					<!-- Payments Steps -->
					<div class="shopping-cart">

						<!-- SHOPPING INFORMATION -->
						<div class="cart-ship-info">
							<div class="row">

								<!-- ESTIMATE SHIPPING & TAX -->
								<div class="col-sm-12">
									<h6>Quên Mật Khẩu</h6>

									<form:form class="login-form" method="post" action="/forgot_password" onsubmit="return validateForm()">
										<div if="{error != null}">
											<p style="color : red; text-align: center">${error }</p>
										</div>
										<div if="{message != null}">
											<p style="color : blue; text-align: center">${message }</p>
										</div>
										<ul class="row">
											<li class="col-md-12">
												<label>
													<input type="email" placeholder="Nhập email của bạn" name="email" required="required" autofocus="autofocus">
												</label>
											</li>
											<li class="col-md-4">
												<button type="submit" class="btn">GỬI</button>
											</li>
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