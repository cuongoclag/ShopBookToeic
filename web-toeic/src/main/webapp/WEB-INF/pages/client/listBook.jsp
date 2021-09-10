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


	<div id="content" id="resultsearchBook" >
		<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
		<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
	<!-- Products -->
	<section class="shop-page padding-top-100 padding-bottom-100">
		<div class="container">
			<div class="row">
				<!-- Item Content -->
				<div class="col-sm-9">
					<c:if test="${fn:length(listProduct) == 0 } Or ${fn:length(products) == 0 }">
						<h4>Không tìm thấy dữ liệu</h4>
					</c:if>
					<!-- Popular Item Slide -->
					<div class="papular-block row" style="display: flex; flex-wrap: wrap">
						<!-- Item -->
						<c:forEach items="${listProduct}" var="list">
						<div class="col-md-4">
							<div class="item">
								<!-- Item img -->
								<div class="item-img">
									<img class="img-1" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="" >
									<img class="img-2" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="" >
									<!-- Overlay -->
									<div class="overlay">
										<div class="position-center-center">
											<div class="inn">
												<a href="<%=request.getContextPath()%>/bookDetails/${list.id }"><i class="icon-magnifier"></i></a>
												<a href="" onclick="Shop.addItemWishlist(${list.id}, 1)" ><i class="icon-heart"></i></a>
											</div>
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
						</div>
						</c:forEach>

						<!-- Item Result Search-->
						<c:forEach items="${products}" var="list">
							<div class="col-md-4">
								<div class="item">
									<!-- Item img -->
									<div class="item-img">
										<img class="img-1" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="" >
										<img class="img-2" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="" >
										<!-- Overlay -->
										<div class="overlay">
											<div class="position-center-center">
												<div class="inn">
													<a href="<%=request.getContextPath()%>/bookDetails/${list.id }"><i class="icon-magnifier"></i></a>
													<a href="" onclick="Shop.addItemWishlist(${list.id}, 1)" ><i class="icon-heart"></i></a>
												</div>
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
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- Shop SideBar -->
				<div class="col-sm-3">
					<div class="shop-sidebar">

						<!-- Category -->
						<h5 class="shop-tittle margin-bottom-30">DANH MỤC</h5>
						<ul class="shop-cate">
							<li><a href="${base }/listBook"> All </a></li>
							<c:forEach var="category" items="${listCategory }">
								<li>
									<a href="${base }/listBook/${category.seo}">${category.name }
									</a></li>
							</c:forEach>
						</ul>

						<!-- Lọc -->
						<h5 class="shop-tittle margin-bottom-30">Lọc Theo Giá</h5>
						<ul class="shop-cate">
							<li>
								<a href="${base }/listBook/?price=1">< 200.000 VNĐ
								</a>
							</li>
							<li>
								<a href="${base }/listBook/?price=2">200.000 VNĐ - 400.000 VNĐ
								</a>
							</li>
							<li>
								<a href="${base }/listBook/?price=3">400.000 VNĐ - 600.000 VNĐ
								</a>
							</li>
							<li>
								<a href="${base }/listBook/?price=4">600.000 VNĐ - 800.000 VNĐ
								</a>
							</li>
							<li>
								<a href="${base }/listBook/?price=5">> 800.000 VNĐ
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
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
	<script src="<c:url value='/js/client/shop/shop.js'/>" ></script>

</body>
</html>