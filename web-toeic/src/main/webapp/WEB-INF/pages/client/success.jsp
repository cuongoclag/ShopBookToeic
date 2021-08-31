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
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                    <div class="ps-checkout__billing">
				      <h3 style="color: red">Bạn đã thanh toán thành công số tiền ${sumVN }</h3>
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
					</table>
                  </div>
                  <form action="${base }/cart/thankyouPayPal" method="post">
					 <button type="submit" class="btn btn-primary">Xác nhận</button>
				  </form>
            </div>
		
	</div>
	<!--Footer==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->
</body>

</html>