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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/paging.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script
            src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script
            src="${pageContext.request.contextPath}/resources/js/html5shiv.js"></script>
    <script
            src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>

    <style type="text/css">
        .hidden {
            display: none;
        }
        .error-message {
            color: red;
        }
        .anchor {
            display: block;
            height: 115px; /*same height as header*/
            margin-top: -115px; /*same height as header*/
            visibility: hidden;
        }
        .imageExam {
            float: left;
            height: 150px;
            width: 250px;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>

<jsp:include page="template/header.jsp"></jsp:include>
<input id="baseUrl" value="${pageContext.request.contextPath}" style="display:none;"/>
<div class="container">
    <!--PAGE TITLE-->
    <div class="span9" style="text-align: center">
        <div class="page-header">
            <h4 style="font-weight: bold;">DANH SÁCH BÀI Nghe</h4>
        </div>
    </div>

    <!-- /. PAGE TITLE-->
    <div class="row">

        <div class="span9">
            <c:if test="${fn:length(listData) == 0 }">
                <h3>Không tìm thấy dữ liệu</h3>
            </c:if>

            <c:forEach items="${listData}" var="list" varStatus="loop">

                <div class="span9">
                    <div class="span1"></div>
                    <div class="span8">
                        <h4 class="content-heading">
                                ${list.listeningTitle}</h4>
<%--                        <button class="btn btn-primary openModalExam"--%>
<%--                                value="${list.id}" id="openModalExam.${loop.index}">--%>
<%--                            Chi tiết</button>--%>
                        <a href="<%=request.getContextPath()%>/listeningDetails/${list.id }" class="btn btn-primary">Chi Tiết</a>
                    </div>
                </div>

            </c:forEach>
            <br>
        </div>
        <div class="span3">
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
<jsp:include page="include/footerHome.jsp"></jsp:include>


</body>

</html>