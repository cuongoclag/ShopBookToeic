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

<div class="container" id="resultsearch" style="display: flex; flex-wrap: wrap; padding: 5rem">
    <input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
    <input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
    <h1 class="h3 mb-2 text-gray-800">Danh sách đơn hàng</h1>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Mã Đơn Hàng</th>
            <th>Tên</th>
            <th>SĐT</th>
            <th>Email</th>
            <th>Ngày đặt</th>
            <th>Tổng</th>
            <th>Trạng thái</th>
            <th>Chức năng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listOrder}" var="list">
            <tr>
                <td>${list.code }</td>
                <td>${list.customerName }</td>
                <td>${list.customerPhone }</td>
                <td>${list.customerEmail }</td>
                <td>${list.createdDate }</td>
                <td>${list.totalVN }</td>
                <td>
                    <c:choose>
                        <c:when test="${list.status =='true'}">
                            <a href="#">Đang Xử Lý</a>
                        </c:when>
                        <c:otherwise>
                            <span style="color: red">Đã Giao Hàng</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="<%=request.getContextPath()%>/orderDetailsUser/${list.code }" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                    </a>
                </td>
            </tr>
        </c:forEach>

        </tbody>

    </table>

</div>
<!--Footer==========================-->
<jsp:include page="include/footerHome.jsp"></jsp:include>
<!--/.Footer-->
</body>
</html>