<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Danh sách bài hướng dẫn học từ vựng</title>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- JavaScripts -->
	<script src="${pageContext.request.contextPath}/resources/web/js/modernizr.js"></script>

	<!-- Online Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>

<!-- Page container -->
<div class="container">
	<!-- /. PAGE TITLE-->
	<div id="resultsearch">
		<div class="row">
			<div class="col-md-9">
				<c:if test="${fn:length(listData) == 0 }">
					<h3>Không tìm thấy kết quả tìm kiếm "${search}"</h3>
				</c:if>

				<c:forEach items="${listData}" var="list">
					<div class="span9">

						<div class="span3">
							<img class="imageVocab"
								 src="${pageContext.request.contextPath}/resources/file/images/vocab/${list.vocabularyImage}" />
						</div>
						<div class="span1"></div>

						<div class="span5">
							<div class="content-heading">
								<h4>${list.vocabularyTitle}</h4>
							</div>
							<div>
								<a href=" <c:url value="/detailVocab?idVocab=${list.id}"/>  "
								   class="btn btn-primary">Chi tiết</a>
							</div>

						</div>
					</div>

				</c:forEach>
			</div>
			<div class="col-md-3">
				<div class="side-bar">

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


		<!--Pagination-->
		<c:if test="${search == 'all'}">
			<c:if test="${not empty listData}">

				<div class="paging">
					<c:if test="${currentPage != 1}">
						<a href="/listVocab?page=${currentPage-1}">Back</a>
					</c:if>
					<c:if test="${currentPage == 1}">
						<a class="current">1</a>
					</c:if>

					<c:if test="${currentPage != 1}">
						<a href="/listVocab?page=1">1</a>
					</c:if>

					<c:forEach var="pag" items="${pageList}" varStatus="loop">
						<c:if test="${currentPage == pag}">
							<a class="current">${pag}</a>
						</c:if>
						<c:if test="${currentPage != pag}">
							<a href="/listVocab?page=${pag}">${pag}</a>
						</c:if>
					</c:forEach>

					<c:if test="${currentPage != totalPage}">
						<a href="/listVocab?page=${currentPage+1}">Next</a>
					</c:if>
				</div>
			</c:if>
		</c:if>
		<!--/.End Pagination-->
	</div>

	<!-- End Page container -->
</div>
<!--Footer
==========================-->

<script src="${pageContext.request.contextPath}/resources/web/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/own-menu.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/jquery.lighter.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/owl.carousel.min.js"></script>

<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/main.js"></script>

<!--/.Footer-->
</body>
</html>