<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hướng dẫn ngữ pháp</title>


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

	<script type="text/javascript">
		$(document).ready(function() {
			//comment grammar
			$('#btnComment').click(function() {

				var test = $("#contentComment").val();
				var baitaptuvungId = $("#id_bai_grammar").val();
				var baseUrl = $('#baseUrl').val();

				$.ajax({
					dataType : "json",
					type : 'POST',
					url : baseUrl + "/grammar/ajaxCmtGram/" + test + "/" + baitaptuvungId,

					success : function(result) {

						var obj = JSON.parse(result);

						var name = "<h4 style='color:red'>" + obj.nguoidung + "</h4> ";
						var content = "<textarea disabled class='input-xxlarge showtext' rows='3' name='cmtgrammarcontent' >" + obj.cmtgrammarcontent + "</textarea>";

						$('#listcomment').append(name);
						$('#listcomment').append(content);

					},
					error : function(e) {
						alert("error");
						console.log("ERROR: ", e);
					}
				});

			});

		});
	</script>


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
				<h3>Bài hướng dẫn học ngữ pháp</h3>
			</div>
		</div>
	</div>
	<!-- /. PAGE TITLE-->
	<div class="row">

		<!--/Start Blog Post-->

		<div class="col-md-9">
			<div class="blog-post">
				<h4 style="text-align: center; color: blue">Chủ đề:
					${baigrammar.getGrammarTitle()}</h4>
				<img
						src="${pageContext.request.contextPath}/resources/file/images/vocabulary.jpg"
						style="height: 330px; width: 870px">
				<div class="row" style="text-align: justify;">

					<div class="col-md-12">${baigrammar.getContentHTML()}</div>

				</div>
			</div>
		</div>

		<!--/End Blog Post-->

		<!-- Start Categories -->
		<div class="col-md-3 ">
			<br> <br> <br> <br>

			<div class="side-bar ">

				<h4>Danh mục</h4>
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
</div>
<br>
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