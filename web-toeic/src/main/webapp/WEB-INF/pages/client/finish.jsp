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

<div class="container" id="resultsearch">
    <input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
    <input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
    <div class="row">
        <div class="span6">
            <h3>Billing Detail</h3>
            <div class="form-group form-group--inline">
                <label for="exampleInputEmail1">Name<span>*</span>
                </label>${user.fullName }
            </div>
            <div class="form-group form-group--inline">
                <label for="exampleInputEmail1">Phone<span>*</span>
                </label>${user.phone }
            </div>
            <div class="form-group form-group--inline">
                <label for="exampleInputPassword1">Email Address<span>*</span>
                </label>${user.email }
            </div>
            <div class="form-group form-group--inline">
                <label for="exampleInputPassword1">Address<span>*</span>
                </label>${user.address }
            </div>
        </div>
        <div class="span6">
            <h3>Your Order</h3>
            <table class="table ps-checkout__products">
                <thead>
                <tr>
                    <th class="text-uppercase">Product</th>
                    <th class="text-uppercase">Total</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cartItems}" var="item">
                    <tr>
                        <td>${item.productName } $ x ${item.quantity }</td>
                        <td>${item.unitPrice*item.quantity }</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td  style="color: yellow">Order Total</td>
                    <td  style="color: yellow">${sumVN }</td>
                </tr>
                </tbody>
            </table>

            <h3>Payment Method</h3>
            <div class="form-group cheque">
                <div class="" style="color: white">
                    <label>Cheque Payment</label>
                    <form action="${base }/cart/thankyou" method="post">
                        <button type="submit" class="ps-btn ps-btn--fullwidth">CHEQUE PAYMENT<i class="ps-icon-next"></i></button>
                    </form>
                </div>
            </div>
            <div class="form-group paypal">
                <div class="ps-radio--inline"  style="color: white">
                    <label>Paypal</label>
                </div>
                <form action="${base }/paypal" method="post">
                    <button type="submit" class="ps-btn ps-btn--fullwidth">PAYPAL<i class="ps-icon-next"></i></button>
                </form>
            </div>
            <div class="form-group qr">
                <div class="ps-radio--inline"  style="color: white">
                    <label>QR Payment</label>
                </div>
                <form action="${base }/qrpayment" method="post">
                    <button type="submit" class="ps-btn ps-btn--fullwidth">QR Payment<i class="ps-icon-next"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Footer==========================-->
<jsp:include page="./include/footerHome.jsp"></jsp:include>
<!--/.Footer-->
<script src="<c:url value='/js/client/shop/shop.js'/>" ></script>
</body>
</html>