<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<h2 class="form-signin-heading" style="text-align: center">Reset Mật khẩu</h2>
			<hr>
			<form class="sign-in-form" method="post" action="/reset_password">
				<input type="hidden" name="token" value="${token }"/>
				<div class="input-field">
					<i class="fas fa-lock"></i>
					<input type="password" placeholder="Nhập mật khẩu mới" name="password" id="password" required="required" autofocus="autofocus"/>
				</div>
				<div class="input-field">
					<i class="fas fa-lock"></i>
					<input type="password" placeholder="Nhập lại mật khẩu" name="confirmPassword" required="required" autofocus="autofocus" oninput="checkPasswordMatch(this);"/>
				</div>
				<button class="btn solid" type="submit">Đổi mật khẩu</button>
			</form>
		</div>
	</div>

	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script type="text/javascript">
		function checkPasswordMatch(fieldConfirmPassword) {
			if(fieldConfirmPassword.value != $("#password").val()){
				fieldConfirmPassword.setCustomValidity("Passwords do not match!");
			} else {
				fieldConfirmPassword.setCustomValidity("");
			}
		}
	</script>
</body>
</html>