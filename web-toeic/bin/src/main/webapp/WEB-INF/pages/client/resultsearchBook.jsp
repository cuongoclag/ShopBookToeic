<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Page container -->
<div class="row">
    <div class="span9">
        <c:forEach items="${listProduct}" var="list">
            <div class="card" style="width: 20%; margin: 1%">
                <img class="card-img-top" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">${list.title}</h5>
                    <p class="card-text">${list.price}</p>
                    <a href="<%=request.getContextPath()%>/bookDetails/${list.id }" class="btn btn-primary">Detail</a>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${products}" var="list">
            <div class="card" style="width: 20%; margin: 1%">
                <img class="card-img-top" src="${pageContext.request.contextPath}/resources/file/images/upload/${list.productImages[0].path}" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">${list.title}</h5>
                    <p class="card-text">${list.price}</p>
                    <a href="<%=request.getContextPath()%>/bookDetails/${list.id }" class="btn btn-primary">Detail</a>
                </div>
            </div>
        </c:forEach>
        <br>
    </div>

    <div class="span3">
        <div class="side-bar">
            <input type="text" class="form-control" id="searchBook"
                   placeholder="Tìm kiếm Sách..."
                   style="width: 300px; margin-top:6px;margin-right:-40px;"
                   name="search"
                   onkeyup="Search()">
            <h3>DANH MỤC</h3>
            <ul class="nav nav-list">
                <li>
                    <a href="${base }/listBook" >All</a>
                </li>
                <c:forEach var="category" items="${listCategory }">
                    <li>
                        <a href="${base }/listBook/${category.seo}">${category.name }
                        </a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>


<!--Pagination-->


<!--/.End Pagination-->
<!-- End Page container -->
