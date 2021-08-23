<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="ISO-8859-1">
    <title>Quản lý Category</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        .hidden {
            display: none;
        }
        .error-message {
            color: red;
        }

    </style>
   
    <script src="<c:url value='/js/admin/shop/jquery-3.5.1.min.js'/>" ></script>
    <script src="<c:url value='/js/admin/shop/delete-category-ajax.js'/>" ></script>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="col-md-9 animated bounce">

    <a href="<c:url value='/admin/add-product'/> " class="btn btn-primary btn-icon-split">
        <span class="text">Add Product</span>
    </a>
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products }" var="product">
                        <tr>
                            <td>${product.title }</td>
                            <td>${product.shortDes }</td>
                            <td>
                                <c:choose>
                                    <c:when test="${product.status =='true'}">
														<span
                                                                style="background: #29ed3b; border-radius: 5px; color: white;">&nbsp;Active&nbsp;</span>
                                    </c:when>
                                    <c:otherwise>
														<span
                                                                style="background: #c12731; border-radius: 5px; color: white;">&nbsp;Inactive&nbsp;</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="<c:url value='/admin/edit-product/${product.seo}' />"
                                   class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                                <button type="button" id="delete" name=""
                                        onclick="confirmDelete('${product.seo }')"
                                        class="btn btn-danger btn-sm"><i class="fas fa-eye-slash"></i></button>
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
</body>
</html>