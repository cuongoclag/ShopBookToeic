<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="ISO-8859-1">
    <title>Danh sách sản phẩm</title>
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
    <script src="<c:url value='/js/admin/shop/delete-product.js'/>" ></script>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="col-md-9 animated bounce">
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>Nôi Dung</th>
                        <th>Rating</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${review }" var="r">
                        <tr>
                            <td>${r.userName }</td>
                            <td>${r.userEmail }</td>
                            <td>${r.comment }</td>
                            <td>${r.rating }</td>
                            <td>
                                <a href="<c:url value='/admin/delete-review/${r.id}' />"
                                   class="btn btn-warning btn-sm"><i class="fas fa-trash"></i></a>
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