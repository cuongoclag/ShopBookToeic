<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                    <h1 class="h3 mb-0 text-gray-800">Account Management</h1>
<%--                    <a href="/pdf" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i--%>
<%--                            class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>--%>
                </div>
                <!------------------------------------------- Content Row---------------------------------------- -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <button class="btn btn-success btnThemTaiKhoan">Thêm mới tài
                            khoản</button>
                        <h4 style="color: red" id="info-success"></h4>
                        <c:if test="${errorInfo != null }">
                            <h4 style="color: red" id="info-error">${error}</h4>
                            <h4>error: ${errorInfo}</h4>
                        </c:if>
                        <div class="form-group form-inline">
                            <label for="sel1"><strong>Lọc tài khoản:</strong> </label> <select
                                id="roles" class="form-control">
                            <c:forEach var="roles" items="${listVaiTro}">
                                <option value="${roles.value}">${roles}</option>
                            </c:forEach>
                        </select>
                        </div>
                        <hr>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered taiKhoanTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Họ Và Tên</th>
                                    <th>Email</th>
                                    <th>Số Điện Thoại</th>
                                    <th>Địa Chỉ</th>
                                    <th>Vai Trò</th>
                                    <th>Action</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%------------------------Modal------------------------------------%>
                <div class="card shadow mb-4">
                    <form class="taiKhoanForm" id="form">
                        <div>
                            <div class="modal fade" id="taiKhoanModal" tabindex="-1"
                                 role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Tạo mới tài
                                                khoản</h5>
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="name">Email</label> <input type="email"
                                                                                       class="form-control" name="email" required />
                                            </div>
                                            <div class="form-group">
                                                <label for="name">Mật khẩu:(8-32 ký tự)</label> <input
                                                    type="password" class="form-control" name="password" required />
                                            </div>
                                            <div class="form-group">
                                                <label for="name">Nhắc lại mật khẩu:</label> <input type="password"
                                                                                                    class="form-control" name="confirmPassword" required />
                                            </div>

                                            <div class="form-group">
                                                <label for="name">Chọn vai trò:</label>
                                                <c:forEach var="roles" items="${listVaiTro}">
                                                    <label class="radio-inline">
                                                        <input type="radio"
                                                               name="roles" value="${roles.value}" checked="checked">${roles}
                                                    </label>
                                                </c:forEach>
                                            </div>
                                            <div class="form-group">
                                                <label for="name">Họ tên:</label> <input type="text"
                                                                                         class="form-control" name="fullName" required />
                                            </div>
                                            <div class="form-group">
                                                <label for="name">Số điện thoại:</label> <input type="text"
                                                                                                class="form-control" name="phone" required />
                                            </div>
                                            <div class="form-group">
                                                <label for="name">Địa chỉ:</label> <input type="text"
                                                                                          class="form-control" name="address" required />
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Hủy</button>
                                                <input class="btn btn-primary" id="btnSubmit" type="button"
                                                       value="Xác nhận" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
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

    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
    <script src="<c:url value='/js/admin/taiKhoanAjax.js'/>"></script>
</body>

</html>