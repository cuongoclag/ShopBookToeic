<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hướng dẫn từ vựng chi tiết</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/web/rs-plugin/css/settings.css" media="screen" />

	<!-- Bootstrap Core CSS -->
	<link href="${pageContext.request.contextPath}/resources/web/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="${pageContext.request.contextPath}/resources/web/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/web/css/ionicons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/main.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/responsive.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- JavaScripts -->
	<script src="${pageContext.request.contextPath}/resources/web/js/modernizr.js"></script>

	<!-- Online Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>

	<style type="text/css">
		.showtext {
			text-align: auto;
			padding-top: 0.5em;
			padding-right: 1em;
			padding-bottom: 0.5em;
			padding-left: 1em;
		}
	</style>
</head>
<body>

<!--Header
==========================-->

<jsp:include page="template/header.jsp"></jsp:include>
<input id="baseUrl" value="${pageContext.request.contextPath}"
	   style="display: none;" />
<!--/End Headter-->

<!-- Page container -->
<div class="container">
	<!--PAGE TITLE-->
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h2 style="font-size: 25px">Bài hướng dẫn học từ vựng</h2>
			</div>
		</div>
	</div>

	<!-- /. PAGE TITLE-->
	<div class="row">
		<!--/Start Blog Post-->
		<div class="col-md-9">
			<div class="blog-post">
				<h3 style="text-align: center; color: blue">Chủ đề:
					${bttuvung.getVocabularyTitle()}</h3>
				<!-- -->

				<img
						src="${pageContext.request.contextPath}/resources/file/images/vocabulary.jpg"
						style="height: 330px; width: 870px">
				<p>
					<c:forEach items="${listCauHoi}" var="list">

					<div class="row">
						<div class="col-md-5">
							<b>${list.number}.<span style="color: blue"> ${list.content}
							</span>
							</b> <br> <br> <img
								src="${pageContext.request.contextPath}/resources/file/images/vocab/${list.image}"
								alt="image not found" style="height: 210px; width: 300px;" /> <br>

							<br>
						</div>
						<div class="col-md-7">
							<br> <br>
				<p>
					<b>NAmE:</b> &nbsp; <span style="color: red">${list.transcribe}</span>
				</p>

				<p>
					<b>Từ loại </b>${list.meaning}
				</p>

				<p>
					<b>Ví dụ: </b>${list.sentence}
				</p>
				<audio controls> <source
						src="${pageContext.request.contextPath}/resources/file/audio/vocab/${list.audiomp3}"
						type="audio/wav"></audio>
				<br>
			</div>
		</div>
		<br>
		</c:forEach>
		</p>
	</div>
</div>
<!--/End Blog Post-->
<!-- Start Categories -->
<div class="col-md-3 ">
	<div class="side-bar ">
		<h3>DANH MỤC</h3>
		<ul class="nav nav-list">
			<li><a href="/listening">LUYỆN BÀI NGHE</a></li>
			<li><a href="/reading">LUYỆN BÀI ĐỌC</a></li>
			<li><a href="/listExam">THI THỬ</a></li>
			<li><a href="/listGrammar">HỌC NGỮ PHÁP</a></li>
			<li><a href="/listVocab">HỌC TỪ VỰNG</a></li>
		</ul>
	</div>
</div>
</div>
<!-- End Categories -->
</div>
<!-- End Page Container -->
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

</body>
</html>