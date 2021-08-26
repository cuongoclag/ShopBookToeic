<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book List</title>

	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
			src="${pageContext.request.contextPath}/resources/js/html5shiv.js"></script>
	<script
			src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
	<link rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/paging.css">

	<style type="text/css">
		.hidden {
			display: none;
		}

		.error-message {
			color: red;
		}

		.anchor {
			display: block;
			height: 115px; /*same height as header*/
			margin-top: -115px; /*same height as header*/
			visibility: hidden;
		}

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
			var search = document.getElementById('searchBook').value;

			//remove special letters
			var convertSearch = search.replace(/[^a-zA-Z0-9 ]/g, "");

			var url;
			if(!search == ' ')
			{	url= baseUrl+"/searchBook/"+convertSearch;
			}
			else url = baseUrl+"/searchBook/all";


			if(window.XMLHttpRequest){
				xhttp = new XMLHttpRequest();
			}
			else{
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function(){
				if(xhttp.readyState == 4){
					var data = xhttp.responseText;
					document.getElementById("resultsearchBook").innerHTML = data;
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

	<div class="container" id="resultsearchBook" style="display: flex; flex-wrap: wrap; padding: 5rem">
		<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
		<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
		<div class="row">
			<div class="span9" style="display: flex; flex-wrap: wrap;">
				<c:if test="${fn:length(listProduct) == 0 } Or ${fn:length(products) == 0 }">
					<h3>Không tìm thấy dữ liệu</h3>
				</c:if>
				<c:forEach items="${listProduct}" var="list">
					<div class="card" style="width: 20%; margin: 1%">
						<a href="<%=request.getContextPath()%>/bookDetails/${list.id }"><img style="height: 15rem" class="card-img-top" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="Card image cap"></a>
						<div class="card-body">
							<h5 class="card-title" style="white-space: nowrap; width: 100%; overflow: hidden; text-overflow: ellipsis;">
								<a href="<%=request.getContextPath()%>/bookDetails/${list.id }">${list.title}</a>
							</h5>
							<c:if test="${list.price == list.promotionalPrice}">
								<p class="card-text">${list.priceVN}</p>
							</c:if>
							<c:if test="${list.price > list.promotionalPrice}">
								<p class="card-text" style="text-decoration: line-through;">${list.priceVN}</p>
								<p class="card-text">${list.promotionalPriceVN}</p>
							</c:if>
							<a href="<%=request.getContextPath()%>/bookDetails/${list.id }" class="btn btn-primary">Detail</a>
						</div>
					</div>
				</c:forEach>
				<c:forEach items="${products}" var="list">
					<div class="card" style="width: 20%; margin: 1%">
						<a href="<%=request.getContextPath()%>/bookDetails/${list.id }"><img style="height: 15rem" class="card-img-top" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="Card image cap"></a>
						<div class="card-body">
							<h5 class="card-title" style="white-space: nowrap; width: 100%; overflow: hidden; text-overflow: ellipsis;">
								<a href="<%=request.getContextPath()%>/bookDetails/${list.id }">${list.title}</a>
							</h5>
							
							<c:if test="${list.price == list.promotionalPrice}">
								<p class="card-text">${list.priceVN}</p>
							</c:if>
							<c:if test="${list.price > list.promotionalPrice}">
								<p class="card-text" style="text-decoration: line-through;">${list.priceVN}</p>
								<p class="card-text">${list.promotionalPriceVN}</p>
							</c:if>
							
							<a href="<%=request.getContextPath()%>/bookDetails/${list.id }" class="btn btn-primary">Detail</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="span3">
				<div class="side-bar">
					<form class="form-control" action="${base}/listBook" method="get">
						<input class="form-control" name="keyword" th:value="${keyword }" type="text" placeholder="Tìm Kiếm Sách...">
						<button class="btn btn-primary" type="submit" value="Search">Search</button>
					</form>
					<h3>DANH MỤC</h3>
					<ul class="nav nav-list">
						<li>
							<a href="${base }/listBook" >All</a>
						</li>
						<c:forEach var="category" items="${listCategory }">
							<li>
								<a href="${base }/listBook/${category.seo}">${category.name }
								</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

	</div>
	<!--Footer==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->

</body>
</html>