<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="./template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<div class="container" id="resultsearch">
	<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
	<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
	<div class="row" style="display: flex;">
		<div span5 style="margin : 2%">
			<img alt="" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}"
				 style="height: 30rem; width: 50rem"/>
		</div>
		<div span5 style="margin : 2%">
			<strong>${list.title}</strong>
			<c:if test="${list.price == list.promotionalPrice}">
				<p class="card-text">${list.priceVN}</p>
			</c:if>
			<c:if test="${list.price > list.promotionalPrice}">
				<p class="card-text" style="text-decoration: line-through;">${list.priceVN}</p>
				<p class="card-text">${list.promotionalPriceVN}</p>
			</c:if>
			<p>${list.shortDes}</p>
			<button type="button" onclick="Shop.addItemToCart(${list.id}, 1)" class="btn btn-primary">Thêm vào giỏ hàng</button>
		</div>
	</div>
	<h3>REVIEWS :</h3>
	<p>${list.shortDetails}</p>
			<div id="fb-root"></div>
			<script async defer crossorigin="anonymous"
					src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0"
					nonce="1L3hNQ0b"></script>

			<div id="comment_fb">
				<div class="fb-comments"
					 data-href="http://localhost:8080/bookDetails/${list.id }"
					 data-numposts="5" data-width="1150"></div>
			</div>
	</div>
	<div class="ratings">
		${fn:length(list.reviews)} reviews
		<c:forEach begin="1" end="${list.rating}" varStatus="loop">
			<span class="glyphicon glyphicon-star"></span>
		</c:forEach>
		<c:forEach begin="${list.rating}" end="4" varStatus="loop">
			<span class="glyphicon glyphicon-star-empty"></span>
		</c:forEach> ${list.rating}stars
	</div>
	<h2>Review </h2>
	<table>
		<c:forEach var="r" items="${list.reviews}" varStatus="i">
			<tr>
				<td>
					<script type="text/javascript">
						$(function () {
							$("#rating${i.index}").rateYo({
								rating: ${r.rating},
								readOnly: true
							});
						})
					</script>
						${r.userName}
						<br>
						<div id="rating${i.index}"></div>
						<br>
						${r.comment}
				</td>
			</tr>
		</c:forEach>
	</table>



    <form:form method="post" action="/createReview" modelAttribute="review" commandName="review">
        <form:input path="userName" placeholder="Name" name="userName"/>
        <form:input path="userEmail" placeholder="Email" name="userEmail"/>
        <form:textarea path="comment"  rows="5"  placeholder="Enter your review here..." name="comment"  cols="50" ></form:textarea>
        <div id="rateYo"></div>
        <input type="hidden" name="hdrating" path="hdrating" id="hdrating"/>
        <input class="btn btn-success btn-lg" type="submit" value="Save">
        <form:hidden  path="product.id" name="product.id"/>
    </form:form>
	<!--Footer==========================-->
	<jsp:include page="./include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->
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