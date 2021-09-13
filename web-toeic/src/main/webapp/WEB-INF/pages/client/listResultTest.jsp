<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order</title>

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

<div class="container" style="display: flex; flex-wrap: wrap; padding: 5rem">
    <input style="display:none;" id ="nameUser" value="${pageContext.request.userPrincipal.name}"/>
    <input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}">
    <h1 class="h3 mb-2 text-gray-800">Lịch Sử Thi Toeic Của Bạn</h1>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Tên Bài Thi</th>
            <th>Tổng Câu Đúng</th>
            <th>Tổng Câu Sai</th>
            <th>Số Câu Đúng Phần Đọc</th>
            <th>Số Câu Đúng Phần Nghe</th>
            <th>Time</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listR}" var="list">
            <tr>
                <td>${list.getTest().getTestTitle()}</td>
                <td>${list.numberCorrectAnswers}/100</td>
                <td>${list.numberWrongAnswers }/100</td>
                <td>${list.correctReading }/50</td>
                <td>${list.correctListen }/50</td>
                <td>${list.dayTest }</td>
            </tr>
        </c:forEach>

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
</body>
</html>