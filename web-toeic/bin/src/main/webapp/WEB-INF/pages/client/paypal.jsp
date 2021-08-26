<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- spring taglibs -->


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
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/client/home.js"></script>


</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<div class="container" id="resultsearch">
		<input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
		<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
		
		<form class="ps-checkout__form" action="/pay" method="post">
            <div class="row">
                  <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                    <div class="ps-checkout__billing">
                      <h3>Payment</h3>
                      <label>Accepted Cards</label>
                      <div class="icon-container">
                        <i class="fa fa-cc-visa" style="color:navy;"></i>
                        <i class="fa fa-cc-amex" style="color:blue;"></i>
                        <i class="fa fa-cc-mastercard" style="color:red;"></i>
                        <i class="fa fa-cc-discover" style="color:orange;"></i>
                      </div>
                            <div class="form-group form-group--inline">
                              <label for="price">Total<span>*</span>
                              </label>
                              <input class="form-control" type="text" id="price" name="price" value="${sum }">
                            </div>
                            <div class="form-group form-group--inline">
                              <label for="currency">Currency<span>*</span>
                              </label>
                              <input class="form-control" type="text" id="currency" name="currency" value="USD">
                            </div>
                            <div class="form-group form-group--inline">
                              <label for="method">Payment Method<span>*</span>
                              </label>
                              <input class="form-control" type="text" id="method" name="method" value="PayPal"> 
                            </div>
                            <div class="form-group form-group--inline">
                              <label for="intent">Intent<span>*</span>
                              </label>
                              <input class="form-control" type="text" id="intent" name="intent" value="sale">
                            </div>
                            <div class="form-group form-group--inline">
                              <label for="description">Payment Description<span>*</span>
                              </label>
                              <input class="form-control" type="text" id="description" name="description" value="Payment Description">
                            </div>
                    </div>
                  </div>
                  <button class="ps-btn ps-btn--fullwidth">Continue to checkout<i class="ps-icon-next"></i></button>
            </div>
          </form>
		
	</div>
	<!--Footer==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->
</body>

</html>