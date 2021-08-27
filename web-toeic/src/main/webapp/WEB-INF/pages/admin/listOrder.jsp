<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="ISO-8859-1">
    <title>Quản lý Đặt Hàng</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        .hidden {
            display: none;
        }
        .error-message {
            color: red;
        }

    </style>
    <script src="<c:url value='/js/admin/shop/delete-category-ajax.js'/>" ></script>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="col-md-10 animated bounce">
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Mã Đặt Hàng</th>
                        <th>Người đặt</th>
                        <th>SĐT</th>
                        <th>Ngày đặt</th>
                        <th>Tổng tiền</th>
                        <th>Thanh Toán</th>
                        <th>Status</th>
                        <th>Chức Năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${saleOrders }" var="saleOrder">
                        <tr>
                            <td>${saleOrder.code }</td>
                            <td>${saleOrder.customerName }</td>
                            <td>${saleOrder.customerPhone }</td>
                            <td>${saleOrder.createdDate }</td>
                            <td>${saleOrder.totalVN }</td>
                            <td><img style="height: 20rem" class="card-img-top" src="${pageContext.request.contextPath}/resources/file/images/${saleOrder.payment}" alt="payment"></td>
                            <td>
                                <c:choose>
                                    <c:when test="${saleOrder.status =='true'}">
                                        <span style="background: #FFFF00; border-radius: 5px; color: white;">&nbsp;Đang xử lý&nbsp;</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="background: #0099FF; border-radius: 5px; color: white;">&nbsp;Đã Hoàn Thành&nbsp;</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/admin/view-order/${saleOrder.id}"
                                   class="btn btn-warning btn-sm"><i class="fas fa-edit"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="template/footer.jsp"></jsp:include>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="<c:url value='./js/admin/quanLyBaiDoc.js'/>" ></script>

<script src="<c:url value='./js/admin/jquery.easing.min.js'/>" ></script>
<script src="<c:url value='./js/admin/jquery.min.js'/>" ></script>
</body>
</html>