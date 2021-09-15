<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <style type="text/css">
        @media print {
            #sidebar-print-none{
                display: none;
            }
        }
    </style>

</head>
<body>
<div id="sidebar-print-none">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/admin/' />">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">CPD English.</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/' />">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Thống kê</span></a>
        </li>
        <!-- Heading -->
        <div class="sidebar-heading" style="font-size: 15px; color: white">
            Toeic.
        </div>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/bai-nghe' />">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Bài nghe.</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/bai-doc' />">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Bài đọc.</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/grammar'/>">
                <i class="fas fa-fw fa-table"></i>
                <span>Ngữ pháp.</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/vocab"/> ">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Từ vựng.</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/exam"/>">
                <i class="fas fa-fw fa-table"></i>
                <span>Thi Toeic.</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/listResultTest"/>">
                <i class="fas fa-fw fa-table"></i>
                <span>Kết Quả Thi Toeic.</span></a>
        </li>
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading" style="font-size: 15px; color: white">
            Cửa hàng.
        </div>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/list-category"/> ">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Loại sản phẩm.</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/list-product"/> ">
                <i class="fas fa-fw fa-table"></i>
                <span>Sản phẩm.</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/list-order"/> ">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Đơn hàng.</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/listReview"/> ">
                <i class="fas fa-fw fa-table"></i>
                <span>Đánh giá.</span></a>
        </li>
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading" style="font-size: 15px; color: white">
            Tài khoản.
        </div>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/tai-khoan"/> ">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Quản lý tài khoản</span></a>
        </li>
        <%--    <li class="nav-item">--%>
        <%--        <a class="nav-link" href="<c:url value="/admin/profile"/> ">--%>
        <%--            <i class="fas fa-fw fa-chart-area"></i>--%>
        <%--            <span>Admin Account.</span></a>--%>
        <%--    </li>--%>

    </ul>
</div>
</body>
</html>