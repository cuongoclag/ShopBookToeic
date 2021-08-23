<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<script src="<c:url value='/js/client/shop/jquery-3.5.1.js'/>" ></script>
	<script src="<c:url value='/js/client/shop/shop.js'/>" ></script>
	<script src="<c:url value='/js/client/shop/main.js'/>" ></script>
</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="./template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<div class="container" id="resultsearch">
	<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
	<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
		<c:forEach items="${list}" var="list">
	<div class="row" style="display: flex;">
		<div span5 style="margin : 2%">
			<img alt="" src="${pageContext.request.contextPath}/resources/file/images/shop.jpg" style="height: 20rem"/>
		</div>
		<div span5 style="margin : 2%">
			<strong>${list.title}</strong>
			<p>${list.price}</p>
			<p>${list.shortDes}</p>
			<p>${list.shortDetails}</p>
			<button type="button" onclick="Shop.addItemToCart(${list.id}, 1)" class="btn btn-primary">Add to cart</button>
		</div>
	</div>
		</c:forEach>
	</div>
	<!--Footer==========================-->
	<jsp:include page="./include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->
</body>
</html>