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
    <title>CPD Englisg Admin</title>

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


    <script src="<c:url value='/js/admin/shop/delete-category-ajax.js'/>" ></script>
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
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">List Category</h1>
                </div>
                <!------------------------------------------- Content Row---------------------------------------- -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <a href="<c:url value='/admin/add-category'/> " class="btn btn-success btn-icon-split">
                            <span class="text">Thêm Loại Sản Phẩm</span>
                        </a>

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Mô tả</th>
                                    <th>Status</th>
                                    <th>Chức năng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${categories }" var="category">
                                    <tr>
                                        <td>${category.name }</td>
                                        <td>${category.description }</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${category.status =='true'}">
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
                                            <a href="<c:url value='/admin/edit-category/${category.seo}' />"
                                               class="btn btn-warning btn-sm"><i class="fas fa-edit"></i></a>
                                            <button type="button" id="delete" name=""
                                                    onclick="confirmDelete('${category.seo }')"
                                                    class="btn btn-danger btn-sm"><i class="fas fa-eye-slash"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
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
<script src="<c:url value='./js/admin/quanLyBaiDoc.js'/>" ></script>
<script src="<c:url value='./js/admin/jquery.easing.min.js'/>" ></script>
<script src="<c:url value='./js/admin/jquery.min.js'/>" ></script>
</body>

</html>