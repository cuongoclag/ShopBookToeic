<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết sản phẩm</title>
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


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		.modal-dialog{
			width: max-content;
			text-align: center;
		}
		.modal-content{
			width: 100rem;
		}
	</style>
</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>

	<!--/End Headter-->
<div id="content">
	<div class="container" id="resultsearch">
	<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
	<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">

		<section class="padding-top-100 padding-bottom-100">
			<div class="container">

				<!-- SHOP DETAIL -->
				<div class="shop-detail">
					<div class="row">

						<!-- Popular Images Slider -->
						<div class="col-md-5">
							<img class="img-responsive" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}"  alt="">
						</div>

						<!-- COntent -->
						<div class="col-md-7">
							<c:forEach begin="1" end="${list.rating}" varStatus="loop">
								<span class="glyphicon glyphicon-star" style="font-size: 3rem; color: rgb(243, 156, 18)"></span>
							</c:forEach>
							<c:forEach begin="${list.rating}" end="4" varStatus="loop">
								<span class="glyphicon glyphicon-star-empty" style="font-size: 3rem;"></span>
							</c:forEach> <span style="font-size: 2rem">${list.rating} sao</span> - <span style="font-size: 2rem">${fn:length(list.reviews)} đánh giá</span>
							<h3>${list.title}</h3>
							<c:if test="${list.price == list.promotionalPrice}">
								<div>
									<span class="price">${list.priceVN}</span>
								</div>
							</c:if>
							<c:if test="${list.price > list.promotionalPrice}">
								<div style="display: flex">
									<div>
										<span class="price" style="margin-right: 2rem">${list.promotionalPriceVN}</span>
									</div>
									<div>
										<span class="price" style="text-decoration: line-through; font-size: 15px">${list.priceVN}</span>
									</div>
								</div>
							</c:if>

							<!-- Item Detail -->
							<p>${list.shortDes}</p>

							<!-- Short By -->
							<div>
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
									Đọc thử
								</button>
								<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">${list.title}</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[1].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[2].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[3].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[4].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[5].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[6].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[7].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[8].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[9].path}"  alt="">
												<img src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[10].path}"  alt="">
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
											</div>
										</div>
									</div>
								</div>
								<!-- ADD TO CART -->
								<button type="button" onclick="Shop.addItemToCart(${list.id}, 1)" class="btn">Thêm vào giỏ hàng</button>
							</div>
						</div>
					</div>
				</div>

				<!--======= PRODUCT DESCRIPTION =========-->
				<div class="item-decribe">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs animate fadeInUp" data-wow-delay="0.4s" role="tablist">
						<li role="presentation" class="active"><a href="#descr" role="tab" data-toggle="tab">MÔ TẢ CHI TIẾT</a></li>
						<li role="presentation"><a href="#review" role="tab" data-toggle="tab">ĐÁNH GIÁ</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content animate fadeInUp" data-wow-delay="0.4s">
						<!-- DESCRIPTION -->
						<div role="tabpanel" class="tab-pane fade in active" id="descr">
							<p>${list.shortDetails}<br>
							</p>
						</div>

						<!-- REVIEW -->
						<div role="tabpanel" class="tab-pane fade" id="review">
							<!-- REVIEW PEOPLE 1 -->
							<div class="media" style="display: flex;flex-wrap: wrap-reverse;">
								<!--  Details -->
								<c:forEach var="r" items="${list.reviews}" varStatus="i">
								<div class="media-body">
									<script type="text/javascript">
										$(function () {
											$("#rating${i.index}").rateYo({
												rating: ${r.rating},
												readOnly: true
											});
										})
									</script>
									<div id="rating${i.index}"></div>
									<br>
									<p class="font-playfair">“${r.comment}”</p>
									<h5>${r.userName}</h5>
								</div>
								</c:forEach>
							</div>
							<!-- ADD REVIEW -->
							<h4 class="margin-t-40">THÊM ĐÁNH GIÁ</h4>
							<form:form method="post" action="/createReview" modelAttribute="review" commandName="review">
								<ul class="row">
									<li class="col-md-6">
										<label> *TÊN
											<form:input path="userName" placeholder="" name="userName" required="required" maxlength="40"/>
										</label>
									</li>
									<li class="col-md-6">
										<label> *EMAIL
											<form:input path="userEmail" placeholder="" name="userEmail" required="required" pattern="[^@]+@gmail+\.com"/>
										</label>
									</li>
									<li class="col-md-12">
										<label> *ĐÁNH GIÁ CỦA BẠN
											<form:textarea path="comment"  rows="5"  placeholder="" name="comment" cols="50" required="required" maxlength="200" ></form:textarea>
										</label>
									</li>
									<li class="col-md-6">
										<!-- Rating Stars -->
										<div class="stars">
											<span>ĐÁNH GIÁ SAO</span> <div id="rateYo"></div>
											<input type="hidden" name="hdrating" path="hdrating" id="hdrating" required="required"/>
										</div>
									</li>
									<li class="col-md-6">
										<input type="submit" class="btn btn-dark btn-small pull-right no-margin" value="ĐĂNG ĐÁNH GIÁ" />
									</li>
									<form:hidden  path="product.id" name="product.id"/>
								</ul>
							</form:form>
						</div>

						<!-- TAGS -->
						<div role="tabpanel" class="tab-pane fade" id="tags"> </div>
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#rateYo").rateYo({
                rating: 0,
                numStars: 5,
                maxValue: 5,
                halfStar: true,
                onChange: function (rating, rateYoInstance) {
                    $('#hdrating').val(rating);
                }
            });
        })
    </script>
</body>
</html>