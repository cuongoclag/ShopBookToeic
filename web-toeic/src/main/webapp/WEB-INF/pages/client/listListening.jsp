<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Danh sách bài thi thử</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JavaScripts -->
    <script src="${pageContext.request.contextPath}/resources/web/js/modernizr.js"></script>

    <!-- Online Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>

</head>
<body>

<jsp:include page="template/header.jsp"></jsp:include>
<input id="baseUrl" value="${pageContext.request.contextPath}" style="display:none;"/>
<div class="container">
    <!--PAGE TITLE-->
    <div class="col-md-9" style="text-align: center">
        <div class="page-header">
            <h4 style="font-weight: bold;">DANH SÁCH BÀI Nghe</h4>
        </div>
    </div>

    <!-- /. PAGE TITLE-->
    <div class="row">

        <div class="col-md-9">
            <c:if test="${fn:length(listData) == 0 }">
                <h3>Không tìm thấy dữ liệu</h3>
            </c:if>

            <c:forEach items="${listData}" var="list" varStatus="loop">

                <div class="col-md-12">
                    <h4 class="content-heading">
                            ${list.listeningTitle}</h4>
                    <a href="<%=request.getContextPath()%>/listeningDetails/${list.id }" class="btn btn-primary">Chi Tiết</a>
                </div>

            </c:forEach>
            <br>
        </div>
        <div class="col-md-3">
            <div class="side-bar">
                <h3>DANH MỤC</h3>
                <ul class="nav nav-list">
                    <li><a href="/listening">LUYỆN BÀI NGHE</a></li>
                    <li><a href="/reading">LUYỆN BÀI ĐỌC</a></li>
                    <li><a href="/listExam">THI THỬ</a></li>
                    <li><a href="/listGrammar">HỌC NGỮ PHÁP</a></li>
                    <li><a href="/listVocab">HỌC TỪ VỰNG</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--Pagination-->
<c:if test="${listData.size() != 0}">

    <div class="paging">
        <c:if test="${currentPage != 1}">
            <a href="/listListening?page=${currentPage-1}">Back</a>
        </c:if>
        <c:if test="${currentPage == 1}">
            <a class="current">1</a>
        </c:if>

        <c:if test="${currentPage != 1}">
            <a href="/listListening?page=1">1</a>
        </c:if>

        <c:forEach var="pag" items="${pageList}" varStatus="loop">
            <c:if test="${currentPage == pag}">
                <a class="current">${pag}</a>
            </c:if>
            <c:if test="${currentPage != pag}">
                <a href="/listListening?page=${pag}">${pag}</a>
            </c:if>
        </c:forEach>

        <c:if test="${currentPage != totalPage}">
            <a href="/listListening?page=${currentPage+1} " class="pageNext">Next</a>
        </c:if>
    </div>
</c:if>
<jsp:include page="template/footer.jsp"></jsp:include>
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