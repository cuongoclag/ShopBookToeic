<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CPD English Admin</title>

    <!-- Custom fonts for this template-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>

    <style type="text/css">
        .hidden {
            display: none;
        }
        .error-message {
            color: red;
        }
    </style>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <!-- --------------------------------------------Sidebar : InsertSidebar ------------------------------------------>
    <!-- Sidebar -->
    <jsp:include page="template/AdminSidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <!-- -----------------------------------Top Bar -- insert AdminHeader     ------------------------- -->
            <jsp:include page="template/AdminHeader.jsp"></jsp:include>

            <!-- -------------------------------------Noi Dung----------------------------------------------------------- -->
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h1 class="h3 mb-0 text-gray-800">Thêm Sản Phẩm</h1>
                    </div>
                    <div class="card-body">
                        <form:form method="post" action="${pageContext.request.contextPath}/admin/save-product"
                                   modelAttribute="product" enctype="multipart/form-data">
                            <form:hidden path="id" />
                            <div class="form-group">
                                <label for="inputAddress">Tên Sản Phẩm</label>
                                <form:input type="text" class="form-control" path="title"  aria-describedby="" required="required" maxlength="100"/>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Giá</label>
                                <form:input type="number" class="form-control" path="price"  aria-describedby="" required="required" maxlength="10" min="0"/>
                            </div>

                            <div class="form-group">
                                <label for="inputAddress">Giá giảm</label>
                                <form:input type="number" class="form-control" path="promotionalPrice"  aria-describedby="" maxlength="10" min="0"/>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Mô Tả </label>
                                <form:textarea class="form-control" id="txtshortDescription1" path="shortDes" required="required" maxlength="3000"/>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Mô Tả Chi Tiết</label>
                                <form:textarea class="form-control" id="txtDetailDescription" path="shortDetails" required="required" maxlength="10000"/>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Loại Sản Phẩm</label>
                                <form:select path="category.id">
                                    <form:options items="${categories}" itemValue="id"
                                                  itemLabel="name"/>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Hình Ảnh Sản Phẩm</label>
                                <input class="form-control" type="file" name="images" multiple="multiple" required="required"/>
                            </div>
                            <div class="form-group form-check">
                                <form:checkbox path="status" class="form-check-input" id="exampleCheck1" />
                                <label class="form-check-label" for="exampleCheck1">Status</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Xác Nhận</button>
                        </form:form>
                    </div>
                    <div class="card-header py-3">
                        <a href="${base }/admin/list-product" class="btn btn-danger btn-sm">Trở Lại</a>
                    </div>

                </div>
                <!------------------------------------------- Content Row---------------------------------------- -->
            </div>
        </div>
        <!-- End of Main Content -->
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2021</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!------------------------------ Insert footer --------------------------------------->
<jsp:include page="template/AdminFooter.jsp"></jsp:include>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="<c:url value='./js/admin/jquery.easing.min.js'/>" ></script>
<script src="<c:url value='./js/admin/jquery.min.js'/>" ></script>
</body>

</html>