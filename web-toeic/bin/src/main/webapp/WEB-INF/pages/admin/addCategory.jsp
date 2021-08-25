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
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="col-md-9 animated bounce">
    <div class="card shadow mb-4">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Add Category</h1>
            <form:form method="post" action="${pageContext.request.contextPath}/admin/save-category"
                       modelAttribute="category" enctype="multipart/form-data">
                <form:hidden path="id" />
                <div class="form-group">
                    <label for="inputAddress">Name Category</label>
                    <form:input type="text" class="form-control" path="name" aria-describedby="" />
                </div>
                <div class="form-group">
                    <label for="inputAddress">Description</label>
                    <form:input type="text" class="form-control" path="description" aria-describedby="" />
                </div>
                <div class="form-group form-check">
                    <form:checkbox path="status" class="form-check-input" id="exampleCheck1" />
                    <label class="form-check-label" for="exampleCheck1">Status</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
            <a href="<c:url value='/admin/list-category'/>" class="btn btn-danger btn-sm">Back</a>
        </div>
    </div>
</div>

<jsp:include page="template/footer.jsp"></jsp:include>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="<c:url value='./js/admin/quanLyBaiDoc.js'/>" ></script>
</body>
</html>