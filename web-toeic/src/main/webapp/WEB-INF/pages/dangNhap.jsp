<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
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
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<!-- Wrap -->
	<div id="wrap">

	<!-- Header -->
<%--	<jsp:include page="client/template/header.jsp"></jsp:include>--%>
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
								<h6>ĐĂNG NHẬP</h6>
								<c:if test="${error!= null}">
									<div class="alert alert-danger">
										<p>${error }</p>
									</div>
								</c:if>
								<c:if test="${message!= null}">
									<div class="alert alert-success">
										<p>${message }</p>
									</div>
								</c:if>
								<c:if test="${param.error != null}">
									<div class="alert alert-danger">
										<p>Tên đăng nhập hoặc mật khẩu không đúng.</p>
									</div>
								</c:if>
								<c:if test="${param.logout != null}">
									<div class="alert alert-success">
										<p>Bạn đã đăng xuất thành công.</p>
									</div>
								</c:if>
								<c:if test="${param.accessDenied != null}">
									<div class="alert alert-danger">
										<p>Bạn không có quyền truy cập vào trang này</p>
									</div>
								</c:if>
								<form method="POST" action="${contextPath}/login" onsubmit="return validateForm()">
									<ul class="row">

										<!-- Name -->
										<li class="col-md-12">
											<label> USERNAME
												<input type="email" placeholder="Email" name="email" required="required" >
											</label>
										</li>
										<!-- LAST NAME -->
										<li class="col-md-12">
											<label> PASSWORD
												<input type="password" placeholder="Mật khẩu" name="password" required="required">
											</label>
										</li>
										<li>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										</li>

										<!-- LOGIN -->
										<li class="col-md-4">
											<button type="submit" class="btn">ĐĂNG NHẬP</button>
										</li>

										<!-- CREATE AN ACCOUNT -->
										<li class="col-md-4">
											<div class="g-recaptcha" data-sitekey="6LfNa6MbAAAAAEMrdL6lGuOXmFy3N7KrcfWi355b"></div>
										</li>

										<!-- FORGET PASS -->
										<li class="col-md-4">
											<div class="checkbox margin-0 margin-top-20 text-right">
												<a href="/forgot_password">Quên mật khẩu</a>
											</div>
										</li>
									</ul>
								</form>
								<p class="margin-top-20" style="font-size: 18px; padding-top: 10px">
									Bạn chưa có tài khoản? <a href="<c:url value='/register'/> ">Tạo tài khoản mới</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


	</div>

	<!-- FOOTER  -->
<%--	<jsp:include page="client/include/footerHome.jsp"></jsp:include>--%>
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
	<script type="text/javascript">
    
	function validateForm(){
		if(grecaptcha.getResponse()){
			return true;
		} else {
			alert("Vui lòng xác nhận mã captcha!!");
			return false;
		}
	}
	</script>
</body>
</html>