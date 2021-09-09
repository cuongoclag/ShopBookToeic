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
            <div class="row" style="margin: 3% 0">
                    <div>
                        <h3>Thanh Toán Paypal</h3>
                        <div class="col-md-12">
                            <label for="price">Tổng<span>*</span>
                            </label>
                            <input type="text" id="price" name="price" value="${sum/20000}" readonly>
                        </div>
                        <div class="col-md-12">
                            <label for="currency">Đơn vị tiền tệ<span>*</span>
                            </label>
                            <input type="text" id="currency" name="currency" value="USD">
                        </div>
                        <div class="col-md-12">
                            <label for="method">Phương thức thanh toán<span>*</span>
                            </label>
                            <input type="text" id="method" name="method" value="PayPal">
                        </div>
                        <div class="col-md-12">
                            <label for="intent">Nội dung<span>*</span>
                            </label>
                            <input type="text" id="intent" name="intent" value="sale">
                        </div>
                        <div class="col-md-12">
                            <label for="description">Mô tả<span>*</span>
                            </label>
                            <input  type="text" id="description" name="description" value="Payment Description">
                        </div>
                    </div>
                <button class="btn ">Xác nhận liên kết ví </button>
            </div>
        </form>

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