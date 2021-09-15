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
<title>Success</title>

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


</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<div class="container" id="resultsearch">
		<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
		<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
		<div class="row" style="margin: 3% 0">
                  <div class="col-md-12">
                    <div >
				      <h3 style="color: red">Bạn đã thanh toán thành công số tiền ${sumVNThue }</h3>
                      <h3>Thông tin đơn hàng</h3>
						<table>
							<tbody>
							<tr>
								<td>Họ Tên Người Nhận: <span style="color: blue">${user.fullName }</span></td>
							</tr>
							<tr>
								<td>Số Điện Thoại: <span style="color: blue">${user.phone }</span></td>
							</tr>
							<tr>
								<td>Email: <span style="color: blue">${user.email }</span></td>
							</tr>
							<tr>
								<td>Địa Chỉ: <span style="color: blue">${user.address }</span></td>
							</tr>
							</tbody>
						</table>
                    </div>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                    <table class="table">
					  <thead>
					    <tr>
					      <th scope="col">Tên</th>
					      <th scope="col">Giá</th>
					      <th scope="col">Số lượng</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${cartItems}" var="item">
					    <tr>
					      	<td>${item.productName }</td>
							<td>${item.unitPriceVN }</td>
							<td>${item.quantity }</td>
					    </tr>
					  </c:forEach>
					  </tbody>
					  <tbody>
						<tr>
							<td>Total:</td>
							<td>${sumVN }</td>
						</tr>
					  </tbody>
						<tbody>
						<tr>
							<td>Thuế</td>
							<td>5%</td>
						</tr>
						</tbody>
						<tbody>
						<tr>
							<td>Total:</td>
							<td>${sumVNThue }</td>
						</tr>
						</tbody>
					</table>
                  </div>
                  <form action="${base }/cart/thankyouPayPal" method="post">
					 <button type="submit" class="btn btn-primary">Xác nhận</button>
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
</body>

</html>