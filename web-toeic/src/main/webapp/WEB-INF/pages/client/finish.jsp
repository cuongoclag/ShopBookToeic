<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <div class="row">
        <div class="span6">
            <h3>Chi Tiết Người Nhận</h3>
            <table>
                <tbody>
                    <tr>
                        <td>Họ Tên Người Nhận: <span style="color: blue">${user.fullName }</span></td>
                    </tr>
                    <tr>
                        <td>Số Điện Thoại: <span style="color: blue">${user.phone }</span></td>
                    </tr>
                    <tr>
                        <td>Email: <span style="color: blue">${user.email }</span></td>
                    </tr>
                    <tr>
                        <td>Địa Chỉ: <span style="color: blue">${user.address }</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="span6">
            <h3>Đơn Hàng Của Bạn</h3>
            <table class="table ps-checkout__products">
                <thead>
                <tr>
                    <th class="text-uppercase">Sản Phẩm</th>
                    <th class="text-uppercase">Số Lượng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cartItems}" var="item">
                    <tr>
                        <td><p>${item.productName }</p></td>
                        <td><p>${item.quantity }</p></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td  style="color: blue"><p>Tổng Giá</p></td>
                    <td  style="color: blue"><p>${sumVN }</p></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <h3>Chọn Phương Thức Thanh Toán.</h3>
    <table class="table" style="border-top: 5px solid deepskyblue">
        <tbody>
        <tr>
            <td style="text-align: center">
                <form action="${base }/cart/thankyou" method="post">
                    <button type="submit" class="btn">
                        Thanh Toán Sau.</button>
                </form>
            </td>
            <td style="text-align: center">
                <form action="${base }/paypal" method="post">
                    <button type="submit" class="btn">
                        Thanh Toán PAYPAL.</button>
                </form>
            </td>
            <td style="text-align: center">
                <form action="${base }/qrpayment" method="post">
                    <button type="submit" class="btn" >
                        Thanh Toán QR.</button>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
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