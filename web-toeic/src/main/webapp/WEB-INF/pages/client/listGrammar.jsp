<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bài Ngữ Pháp</title>

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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">

		.imageGrammar {
			float: left;
			height: 150px;
			width: 250px;
			margin-bottom: 25px;
		}
	</style>
	<script type="text/javascript">
		function Search(){
			var baseUrl = document.getElementById('baseUrl').value;
			var xhttp;
			var search = document.getElementById('searchGrammar').value;
			//remove special letters
			var convertSearch = search.replace(/[^a-zA-Z0-9 ]/g, "");
			var url;
			if(!search == ' ')
			{	url= baseUrl+"/searchGrammar/"+convertSearch;
			}
			else url = baseUrl+"/searchGrammar/all";


			if(window.XMLHttpRequest){
				xhttp = new XMLHttpRequest();
			}
			else{
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function(){
				if(xhttp.readyState == 4){
					var data = xhttp.responseText;
					document.getElementById("resultsearchGrammar").innerHTML = data;
				}
			}
			xhttp.open("POST",url,true);
			xhttp.send();

		}
	</script>
</head>
<body>

<!--Header
==========================-->

<jsp:include page="template/header.jsp"></jsp:include>
<!--/End Headter-->

<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}"/>

<div class="container">
	<!--PAGE TITLE-->
	<div class="row">
		<div class="col-md-9" style="text-align: center">
			<div class="page-header">
				<h5 style="font-weight: bold;">DANH SÁCH BÀI GRAMMAR</h5>
			</div>
		</div>
		<div class="col-md-3">
			<div class="navbar  pull-right">
				<div>
					<input type="text" class="form-control" id="searchGrammar"
						   placeholder="Tìm kiếm bài grammar..."
						   style="width: 300px; margin-top:6px;margin-right:-40px;"
						   name="search"
						   onkeyup="Search()">
				</div>
			</div>
		</div>
	</div>
	<!-- /. PAGE TITLE-->
	<div id="resultsearchGrammar">
		<div class="row">
			<div class="col-md-9">
				<c:if test="${fn:length(listData) == 0 }">
					<h3>Không tìm thấy dữ liệu</h3>
				</c:if>
				<c:forEach items="${listData}" var="list" varStatus="loop">
					<div class="col-md-12">
						<div class="col-md-4">
							<img class="imageGrammar"
								 src="${pageContext.request.contextPath}/resources/file/images/grammar/${list.grammarImage}" />
						</div>

						<div class="span8">
							<div class="content-heading">
								<h6>${list.grammarTitle}</h6>
							</div>
							<div>
								<a
										href=" <c:url value="/detailGram?idGram=${list.grammarId}"/>  "
										class="btn btn-primary">Chi tiết</a>
							</div>
						</div>
					</div>
				</c:forEach>
				<br>
			</div>
			<div class="col-md-3">
				<div class="side-bar">
					<div class="side-bar">
						<h5 class="shop-tittle margin-bottom-30">DANH MỤC</h5>
						<ul class="shop-cate">
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
		<!--Pagination-->
		<c:if test="${listData.size() != 0}">
			<div class="paging">
				<c:if test="${currentPage != 1}">
					<a href="/listGrammar?page=${currentPage-1}">Back</a>
				</c:if>
				<c:if test="${currentPage == 1}">
					<a class="current">1</a>
				</c:if>

				<c:if test="${currentPage != 1}">
					<a href="/listGrammar?page=1">1</a>
				</c:if>

				<c:forEach var="pag" items="${pageList}" varStatus="loop">
					<c:if test="${currentPage == pag}">
						<a class="current">${pag}</a>
					</c:if>
					<c:if test="${currentPage != pag}">
						<a href="/listGrammar?page=${pag}">${pag}</a>
					</c:if>
				</c:forEach>

				<c:if test="${currentPage != totalPage}">
					<a href="/listGrammar?page=${currentPage+1} "
					   class="pageNext">Next</a>
				</c:if>
			</div>
		</c:if>
	</div>

	<!--/.End Pagination-->
</div>


<!--Footer==========================-->
<jsp:include page="template/footer.jsp"></jsp:include>
<!--/.Footer-->

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