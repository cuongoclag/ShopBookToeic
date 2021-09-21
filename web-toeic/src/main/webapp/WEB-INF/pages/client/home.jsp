<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

</head>
<body>
	<!-- LOADER -->
	<div id="loader">
		<div class="position-center-center">
			<div class="ldr"></div>
		</div>
	</div>
	<!-- Wrap -->
	<div id="wrap">

		<!-- Header -->
		<jsp:include page="template/header.jsp"></jsp:include>

			<!-- Popular Products -->
			<section class="padding-top-50">
				<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
				<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
				<div class="container">

					<!-- Main Heading -->
					<div class="heading text-center">
						<h4>Thư viện sách phong phú</h4>
						<h5>--- Chọn sách phù hợp với bản thân ---</h5> </div>

					<!-- Popular Item Slide -->
					<div class="papular-block block-slide">

						<!-- Item -->
						<c:forEach items="${listProduct}" var="list">
						<div class="item">
							<!-- Item img -->
							<div class="item-img">
								<img class="img-1" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="" >
								<img class="img-2" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="" >
								<!-- Overlay -->
								<div class="overlay">
									<div class="position-center-center">
									</div>
								</div>
							</div>
							<!-- Item Name -->
							<div class="item-name" style="white-space: nowrap; width: 100%; overflow: hidden; text-overflow: ellipsis; ">
								<a href="<%=request.getContextPath()%>/bookDetails/${list.id }">${list.title}</a>
							</div>
							<!-- Price -->
							<c:if test="${list.price == list.promotionalPrice}">
								<div>
									<span class="price">${list.priceVN}</span>
								</div>
							</c:if>
							<c:if test="${list.price > list.promotionalPrice}">
								<div style="display: flex; justify-content: space-evenly">
									<div>
										<span class="price">${list.promotionalPriceVN}</span>
									</div>
									<div>
										<span class="price" style="text-decoration: line-through; font-size: 15px">${list.priceVN}</span>
									</div>
								</div>
							</c:if>
						</div>
						</c:forEach>
					</div>
				</div>

				<div style="text-align: center; margin: 3% 0">
					<a href="/listBook" class="btn btn-primary" type="submit">MUA SÁCH NGAY</a>
				</div>
			</section>

			<!-- Knowledge Share -->
			<section class="light-gray-bg padding-top-150 padding-bottom-150">
				<div class="container">

					<!-- Main Heading -->
					<div class="heading text-center">
						<h4>Cung cấp các giao diện học và thi thân thiện.</h4>
						<h5>--- Học thử, Làm bài tập, Thi thử ---</h5>
					</div>
					<div>
						<ul class="row">

							<!-- Post 1 -->
							<li class="col-md-4" style="text-align: center">
								<div class="date"> <h5>Học từ vựng, ngữ pháp</h5></div>
								<p>Các bài hướng dẫn đơn giản, dễ hiểu.</p>
								<img style="width: 30rem; height: 25rem" src="${pageContext.request.contextPath}/resources/file/images/feature-vocabulary1.jpg" alt="" >
								<h5><a style="color: deepskyblue" href="/listVocab" >Bài hướng dẫn từ vựng</a></h5>
								<h5><a style="color: deepskyblue" href="/listGrammar" >Bài hướng dẫn ngữ pháp</a></h5>
							</li>

							<!-- Post 2 -->
							<li class="col-md-4" style="text-align: center">
								<div class="date"> <h5>Bài tập phần nghe, đọc</h5></div>
								<p>Sử dụng các dạng bài tập thường xuyên xuất hiện.</p>
								<img style="width: 30rem; height: 25rem" src="${pageContext.request.contextPath}/resources/file/images/feature-listenandread.jpg" alt="" >
								<h5><a style="color: deepskyblue" href="/listListening" >Bài tập phần nghe</a></h5>
								<h5><a style="color: deepskyblue" href="/listReading" >Bài tập phần đọc</a></h5>
							</li>

							<!-- Post 3 -->
							<li class="col-md-4" style="text-align: center">
								<div class="date"> <h5>Đề thi thử</h5></div>
								<p>Cập nhật, đổi mới liên tục, sát với đề thi thật nhất.</p>
								<img style="width: 30rem; height: 25rem" src="${pageContext.request.contextPath}/resources/file/images/feature-lamdethithu.jpg" alt="" >
								<h5><a style="color: deepskyblue" href="#" class="doExam" id="doExam">Thi thử</a></h5>

							</li>
						</ul>
					</div>
				</div>
			</section>
		</div>


		<%--	Footer--%>
		<jsp:include page="template/footer.jsp"></jsp:include>


	<script src="${pageContext.request.contextPath}/resources/web/js/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/own-menu.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/jquery.lighter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/owl.carousel.min.js"></script>

	<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.t.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/web/js/main.js"></script>
	<script src="<c:url value='/js/client/shop/shop.js'/>" ></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(document).on("click", ".doExam", function(event) {

				var name = $('#nameUser').val();
				if(name === ''){
					var url = "/signin";
					window.location.href = url;
				}
				else{
					var url = "/listExam";
					window.location.href = url;
				}

			});
		});
	</script>
</body>
</html>