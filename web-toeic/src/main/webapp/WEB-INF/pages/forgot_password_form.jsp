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
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="login-page">
		<div class="form">
			<h2 class="form-signin-heading" style="text-align: center">Quên Mật Khẩu</h2>
			<hr>
			<form:form class="login-form" method="post" action="/forgot_password" onsubmit="return validateForm()">
				<div if="{error != null}">
					<p style="color : red; text-align: center">${error }</p>
				</div>
				<div if="{message != null}">
					<p style="color : blue; text-align: center">${message }</p>
				</div>
				<div>
					<input type="email" placeholder="Nhập email của bạn" name="email" required="required" autofocus="autofocus"/>
				</div>
				<button class="btn" id="submit" type="submit">GỬI</button>
			</form:form>
		</div>
	</div>

	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>