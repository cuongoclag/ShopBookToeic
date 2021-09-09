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

<style type="text/css">
    #headerTitlePrint{
        display: none;
    }
    @media print {
        #headerTitlePrint {
            display: block;
        }
        #linkA, #linkB {
            display: none;
        }
    }
</style>
</head>
<body>

<!--Header
==========================-->

<jsp:include page="template/header.jsp"></jsp:include>

<!--/End Headter-->
<div class="container">
    <input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
    <input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
    <div class="card shadow mb-4">
        <div class="card-body" style="margin: 3% 0">
            <div >
                <h2 style="text-align: center">Thông tin đặt hàng <span style="color: red;">${saleOrders.code }</span></h2>
                <div class="table-responsive">
                    <h5>Thông tin người dùng</h5>
                    <table class="table table-bordered" width="100%" cellspacing="0" border="1">
                        <thead>
                        <tr>
                            <th scope="col">Tên</th>
                            <th scope="col">SĐT</th>
                            <th scope="col">Email</th>
                            <th scope="col">Địa Chỉ</th>
                            <th scope="col">Trạng thái đơn hàng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>${saleOrders.customerName }</th>
                            <th>${saleOrders.customerPhone }</th>
                            <th>${saleOrders.customerEmail }</th>
                            <th>${saleOrders.customerAddress }</th>
                            <th>
                                <c:choose>
                                <c:when test="${saleOrders.status =='true'}">
                                    <span style="color: red">Đang Xử Lý</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: deepskyblue">Đã Giao Hàng</span>
                                </c:otherwise>
                            </c:choose></th>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover" border="1">
                        <thead>
                        <tr>
<%--                            <th class="text-center h3 font-weight-bold">Ảnh</th>--%>
                            <th >Tên</th>
                            <th >Giá</th>
                            <th >Giá Sale</th>
                            <th >Số lượng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="saleOrderProduct" items="${saleOrderProducts }">
                            <tr>
<%--                                <td><img alt="" style="width: 80px" src="${pageContext.request.contextPath}/resources/file/images/upload/${saleOrderProduct.product.productImages[0].path}"></td>--%>
                                <td>
                                    <span>
                                        ${saleOrderProduct.product.title }
                                    </span>
                                </td>
                                <td>${saleOrderProduct.product.priceVN }</td>
                                <td>${saleOrderProduct.product.promotionalPriceVN}</td>
                                <td>${saleOrderProduct.quantity }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th style="color: red">Tổng</th>
                            <th>${saleOrders.totalVN }</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/orderUser/${nguoiDung.id }" class="btn btn-danger" id="linkA">Trở lại</a>
<%--            <button type="button" name="" class="btn btn-primary" onclick="printdiv('print_div')" id="linkB">In</button>--%>
        </div>
    </div>
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
<script type="text/javascript">
    function printdiv(printpage) {
        window.print();
    }
</script>
</body>
</html>