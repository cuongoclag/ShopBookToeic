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

	<div class="container" id="resultsearch" style="padding: 5rem 0">
		<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
		<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
		<div>
			<form method="post" action="${base }/cart/check-out/update">
			<table class="table">
			  <thead>
			    <tr>
				  <th></th>
			      <th scope="col">SẢN PHẨM</th>
			      <th scope="col">GIÁ</th>
<%--			      <th scope="col">TOTAL</th>--%>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${WISHLIST.cartItems}" var="item">
			    <tr>

					<td>
						<a href="<%=request.getContextPath()%>/bookDetails/${item.productId }">${item.productName }</a>
					</td>
			      <td>${item.unitPriceVN }</td>
<%--			      <td>--%>
<%--			      ${item.unitPrice*item.quantity}--%>
<%--			      </td>--%>
			      <td><i class="far fa-times-circle" onclick="confirmDelete('${item.productId}')"></i></td>
				  <td><button type="button" onclick="Shop.addItemToCart(${item.productId}, 1)" class="btn btn-primary">Thêm vào giỏ hàng</button></td>
			    </tr>
			  </c:forEach>
			  </tbody>
			</table>
			</form>
		</div>
		
	</div>
	<!--Footer==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->

	<script src="<c:url value='/js/client/shop/jquery-3.5.1.js'/>" ></script>
	<script src="<c:url value='/js/client/shop/Wishlist.js'/>" ></script>
	<script src="<c:url value='/js/client/shop/shop.js'/>" ></script>
</body>

</html>