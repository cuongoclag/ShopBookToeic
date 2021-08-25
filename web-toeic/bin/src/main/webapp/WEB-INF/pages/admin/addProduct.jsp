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
            <h1 class="h3 mb-2 text-gray-800">Add Product</h1>
            <form:form method="post" action="${pageContext.request.contextPath}/admin/save-product"
                       modelAttribute="product" enctype="multipart/form-data">
                <form:hidden path="id" />
                <div class="form-group">
                    <label for="inputAddress">Name Product</label>
                    <form:input type="text" class="form-control" path="title"  aria-describedby="" />
                </div>
                <div class="form-group">
                    <label for="inputAddress">Price</label>
                    <form:input type="text" class="form-control" path="price"  aria-describedby="" />
                </div>

                <div class="form-group">
                    <label for="inputAddress">Promotional Price</label>
                    <form:input type="text" class="form-control" path="promotionalPrice"  aria-describedby="" />
                </div>
                <div class="form-group">
                    <label for="inputAddress">Description</label>
                    <form:textarea class="form-control" id="txtshortDescription1" path="shortDes" />
                </div>
                <div class="form-group">
                    <label for="inputAddress">Detail Description </label>
                    <form:textarea class="form-control" id="txtDetailDescription" path="shortDetails" />
                </div>
                <div class="form-group">
                    <label for="inputAddress">Category</label>
                    <form:select path="category.id">
                        <form:options items="${categories}" itemValue="id"
                                      itemLabel="name"/>
                    </form:select>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Photos Product</label>
                    <input class="form-control" type="file" name="images" multiple="multiple" />
                </div>
                <div class="form-group form-check">
                    <form:checkbox path="status" class="form-check-input" id="exampleCheck1" />
                    <label class="form-check-label" for="exampleCheck1">Status</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
            <a href="${base }/admin/list-product" class="btn btn-danger btn-sm">Back</a>
        </div>
    </div>
</div>

<jsp:include page="template/footer.jsp"></jsp:include>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="<c:url value='./js/admin/quanLyBaiDoc.js'/>" ></script>
</body>
</html>