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
			<section class="padding-top-50 padding-bottom-150">
				<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
				<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
				<div class="container">

					<!-- Main Heading -->
					<div class="heading text-center">
						<h4>Thư viện sách phong phú</h4>
						<span>--- Chọn sách phù hợp với bản thân ---</span> </div>

					<!-- Popular Item Slide -->
					<div class="papular-block block-slide">

						<!-- Item -->
						<div class="item">
							<!-- Item img -->
							<div class="item-img"> <img class="img-1" src="/resources/web/images/product-1.jpg" alt="" > <img class="img-2" src="images/product-2.jpg" alt="" >
								<!-- Overlay -->
								<div class="overlay">
									<div class="position-center-center">
										<div class="inn"><a href="/resources/web/images/product-1.jpg" data-lighter><i class="icon-magnifier"></i></a> <a href="#." data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-basket"></i></a> <a href="#." data-toggle="tooltip" data-placement="top" title="Add To WishList"><i class="icon-heart"></i></a></div>
									</div>
								</div>
							</div>
							<!-- Item Name -->
							<div class="item-name"> <a href="#.">stone cup</a>
								<p>Lorem ipsum dolor sit amet</p>
							</div>
							<!-- Price -->
							<span class="price"><small>$</small>299</span>
						</div>

					</div>
				</div>
			</section>

			<!-- Knowledge Share -->
			<section class="light-gray-bg padding-top-150 padding-bottom-150">
				<div class="container">

					<!-- Main Heading -->
					<div class="heading text-center">
						<h4>Cung cấp các giao diện học và thi thân thiện.</h4>
						<span>--- Học thử, Làm bài tập, Thi thử ---</span>
					</div>
					<div>
						<ul class="row">

							<!-- Post 1 -->
							<li class="col-md-4" style="text-align: center">
								<div class="date"> <span>Bài tập phần nghe, đọc</span></div>
								<p>Sử dụng các dạng bài tập thường xuyên xuất hiện.</p>
								<a href="/listVocab" >Bài hướng dẫn từ vựng</a>
								<br />
								<a href="/listGrammar" >Bài hướng dẫn ngữ pháp</a>
							</li>

							<!-- Post 2 -->
							<li class="col-md-4" style="text-align: center">
								<div class="date"> <span>Học từ vựng, ngữ pháp</span></div>
								<p>Các bài hướng dẫn đơn giản, dễ hiểu.</p>
								<a href="/listListening" >Bài tập phần nghe</a>
								<br />
								<a href="/listReading" >Bài tập phần đọc</a>
							</li>

							<!-- Post 3 -->
							<li class="col-md-4" style="text-align: center">
								<div class="date"> <span>Đề thi thử</span></div>
								<p>Cập nhật, đổi mới liên tục, sát với đề thi thật nhất.</p>

								<a href="#" class="doExam" id="doExam">Thi thử</a>

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