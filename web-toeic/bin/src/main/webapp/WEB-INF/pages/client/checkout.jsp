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
		<div>
			<form method="post" action="${base }/cart/check-out/update">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">PRODUCTS</th>
			      <th scope="col">PRICE</th>
			      <th scope="col">QUANTITY</th>
			      <th scope="col">TOTAL</th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${GIO_HANG.cartItems}" var="item">
			    <tr>
			      <td>${item.productName }</td>
			      <td>${item.unitPriceVN }</td>
			      <td><input class="form-control" type="number" min="1" max="100" name="quantities" value="${item.quantity }" onblur="this.form.submit()" /></td>
			      
			      <td>
			      ${item.unitPrice*item.quantity}
			      </td>
			      <td><i class="far fa-times-circle" onclick="confirmDelete('${item.productId}')"></i></td>
			    </tr>
			  </c:forEach>
			  </tbody>
			</table>
			</form>
		</div>
		<div style="text-align: end">
			<strong>TOTAL PRICE : ${TOTAL}</strong>
			<form action="${base }/cart/finish" method="post">
				<button type="submit">Process to checkout <i class="fas fa-arrow-right"></i></button>
			</form>
		</div>
		
	</div>
	<!--Footer==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->


	<!-- Start Modal -->

	<div class="modal fade" id="openModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">DANH SÁCH LOẠT BÀI HƯỚNG DẪN</h4>
				</div>

				<div class="modal-body">

					<div class="media">
						<a class="pull-left"><img src="" id="image1" class="media-object"  /></a>
						<div class="media-body">
							<h3>
								<a href="" id="name1" name="name1"></a>
							</h3>
						</div>
					</div>

					<div class="media">
						<a class="pull-left"><img src="" id="image2" class="media-object"  /></a>
						<div class="media-body">
							<h3>
								<a href="" id="name2" name="name2"></a>
							</h3>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Thoát</button>
				</div>

			</div>
		</div>
	</div>
	<!-- End Modal -->
	<script src="<c:url value='/js/client/shop/jquery-3.5.1.js'/>" ></script>
	<script src="<c:url value='/js/client/shop/Cart.js'/>" ></script>
</body>

</html>