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

	<div class="container" id="resultsearch" style="display: flex; flex-wrap: wrap; padding: 5rem">
	<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
	<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
	<div class="card" style="width: 20%; margin: 1%">
	  <img class="card-img-top" src="..." alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title">Title</h5>
	    <p class="card-text">Price </p>
	    <a href="#" class="btn btn-primary">Detail</a>
	  </div>
	</div>
	<div class="card" style="width: 20%; margin: 1%">
	  <img class="card-img-top" src="..." alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title">Title</h5>
	    <p class="card-text">Price </p>
	    <a href="#" class="btn btn-primary margin: 2rem">Detail</a>
	  </div>
	</div>
	<div class="card" style="width: 20%; margin: 1%">
	  <img class="card-img-top" src="..." alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title">Title</h5>
	    <p class="card-text">Price </p>
	    <a href="#" class="btn btn-primary">Detail</a>
	  </div>
	</div>
	<div class="card" style="width: 20%; margin: 1%">
	  <img class="card-img-top" src="..." alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title">Title</h5>
	    <p class="card-text">Price </p>
	    <a href="#" class="btn btn-primary">Detail</a>
	  </div>
	</div>
	<div class="card" style="width: 20%; margin: 1%">
	  <img class="card-img-top" src="..." alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title">Title</h5>
	    <p class="card-text">Price </p>
	    <a href="#" class="btn btn-primary margin: 2rem">Detail</a>
	  </div>
	</div>
	<div class="card" style="width: 20%; margin: 1%">
	  <img class="card-img-top" src="..." alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title">Title</h5>
	    <p class="card-text">Price </p>
	    <a href="#" class="btn btn-primary">Detail</a>
	  </div>
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

</body>
</html>