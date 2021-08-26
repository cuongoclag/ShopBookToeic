<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <script src="<c:url value='/js/client/shop/jquery-3.5.1.js'/>" ></script>


</head>
<body>

<!--Header
==========================-->

<jsp:include page="./template/header.jsp"></jsp:include>

<!--/End Headter-->

<div class="container" id="resultsearch" style="padding: 5% 0">
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
                        <td>${item.productName }</td>
                        <td>${item.quantity }</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td  style="color: blue">Tổng Giá</td>
                    <td  style="color: blue">${sumVN }</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <h3 style="color: blue">Chọn Phương Thức Thanh Toán.</h3>
    <table class="table" style="border-top: 5px solid deepskyblue">
        <tbody>
        <tr>
            <td style="text-align: center">
                <form action="${base }/cart/thankyou" method="post">
                    <button type="submit" class="btn btn-primary" style="width: 50%; height: 4rem; font-size: 20px; font-weight: bold;">
                        Thanh Toán Sau.</button>
                </form>
            </td>
            <td style="text-align: center">
                <form action="${base }/paypal" method="post">
                    <button type="submit" class="btn btn-primary" style="width: 50%; height: 4rem; font-size: 20px; font-weight: bold;">
                        Thanh Toán PAYPAL.</button>
                </form>
            </td>
            <td style="text-align: center">
                <form action="${base }/qrpayment" method="post">
                    <button type="submit" class="btn btn-primary" style="width: 50%; height: 4rem; font-size: 20px; font-weight: bold;">
                        Thanh Toán QR.</button>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<!--Footer==========================-->
<jsp:include page="./include/footerHome.jsp"></jsp:include>
<!--/.Footer-->
<script src="<c:url value='/js/client/shop/shop.js'/>" ></script>
</body>
</html>