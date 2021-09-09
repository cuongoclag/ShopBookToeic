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

	<script src="${pageContext.request.contextPath}/resources/js/client/home.js"></script>


</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<div class="container" id="resultsearch" style="padding: 5rem 0">
		<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
		<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
		<div>
			<form method="post" action="${base }/cart/check-out/update">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">SẢN PHẨM</th>
			      <th scope="col">GIÁ</th>
			      <th scope="col">SỐ LƯỢNG</th>
<%--			      <th scope="col">TOTAL</th>--%>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${GIO_HANG.cartItems}" var="item">
			    <tr>
			      <td>${item.productName }</td>
			      <td>${item.unitPriceVN }</td>
			      <td><input class="form-control" type="number" min="1" max="100" name="quantities" value="${item.quantity }" onblur="this.form.submit()" /></td>
			      
<%--			      <td>--%>
<%--			      ${item.unitPrice*item.quantity}--%>
<%--			      </td>--%>
			      <td><i class="far fa-times-circle" onclick="confirmDelete('${item.productId}')"></i></td>
			    </tr>
			  </c:forEach>
			  </tbody>
			</table>
			</form>
		</div>
		<div style="text-align: end">
			<strong>TỔNG : ${TOTAL}</strong>
			<form action="${base }/cart/finish" method="post">
				<button type="submit" class="btn btn-primary" style="margin: 2% 0">Xác nhận giỏ hàng <i class="fas fa-arrow-right"></i></button>
			</form>
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
	<script src="<c:url value='/js/client/shop/Cart.js'/>" ></script>
</body>

</html>