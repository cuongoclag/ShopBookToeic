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
<div class="container">
    <input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
    <input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
    <div class="card shadow mb-4">
        <div class="card-body" >
            <div id="print_div">
                <h2 class="h3 mb-2 text-gray-800">Thông tin đặt hàng <span style="color: red;">${saleOrders.code }</span></h2>
                <div class="table-responsive">
                    <h3>Thông tin người dùng</h3>
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                    <a href="#">Đang Xử Lý</a>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red">Đã Giao Hàng</span>
                                </c:otherwise>
                            </c:choose></th>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
<%--                            <th class="text-center h3 font-weight-bold">Ảnh</th>--%>
                            <th class="text-center h3 font-weight-bold">Tên</th>
                            <th class="text-center h3 font-weight-bold">Giá</th>
                            <th class="text-center h3 font-weight-bold">Giá Sale</th>
                            <th class="text-center h3 font-weight-bold">Số lượng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="saleOrderProduct" items="${saleOrderProducts }">
                            <tr>
<%--                                <td><img alt="" style="width: 80px" src="${pageContext.request.contextPath}/resources/file/images/upload/${saleOrderProduct.product.productImages[0].path}"></td>--%>
                                <td><span>
                                        <a href="${base}/bookDetails/${saleOrderProduct.product.id }">${saleOrderProduct.product.title }</a>
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
            <a href="<%=request.getContextPath()%>/orderUser/${nguoiDung.id }" class="btn btn-danger btn-sm">Trở lại</a>
            <button type="button" name="" class="btn btn-primary btn-sm" onclick="printdiv('print_div')">In</button>
        </div>
    </div>
</div>
<!--Footer==========================-->
<jsp:include page="include/footerHome.jsp"></jsp:include>
<!--/.Footer-->
<script type="text/javascript">
    function printdiv(printpage) {
        var headstr = "<html><head><title></title></head><body>";
        var footstr = "</body>";
        var newstr = document.all.item(printpage).innerHTML;
        var oldstr = document.body.innerHTML;
        document.body.innerHTML = headstr + newstr + footstr;
        window.print();
        document.body.innerHTML = oldstr;
        return false;
    }
</script>
</body>
</html>