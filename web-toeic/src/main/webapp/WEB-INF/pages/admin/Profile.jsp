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
    <script type="text/javascript">
        $(document).ready(function() {
            $('.images-enlarge a').fancybox();
        });
    </script>
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
                    <h1 class="h3 mb-0 text-gray-800">Profile</h1>
                </div>
                <!------------------------------------------- Content Row---------------------------------------- -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <button class="btn btn-success btnCapNhatThongTin">Cập nhật
                            thông tin</button>
                        &nbsp;&nbsp;&nbsp;
                        <button class="btn btn-primary btnDoiMatKhau">Đổi mật khẩu</button>
                        <hr />
                    </div>
                    <div class="card-body">
                        <form class="form-profile">

                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <input type="hidden" class="form-control-plaintext nguoiDungId"
                                           value="${user.id }">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Họ
                                    Tên</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext"
                                           value="${user.fullName }">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Email
                                    đăng ký</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext"
                                           value="${user.email }">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Số
                                    điện thoại</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext"
                                           value="${user.phone }">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Địa
                                    chỉ</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext"
                                           value="${user.address }">
                                </div>
                            </div>
                        </form>

                        <form class="formCapNhat"
                              action="${pageContext.request.contextPath}/admin/profile/update" method="post">
                            <div>
                                <div class="modal fade" id="capNhatModal" tabindex="-1"
                                     role="dialog" aria-labelledby="exampleModalLabel"
                                     aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Cập nhật
                                                    thông tin cá nhân</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}" />
                                                <div class="form-group">
                                                    <input type="hidden" class="form-control" name="id"
                                                           value="${user.id }" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Họ tên</label> <input type="text"
                                                      class="form-control" name="fullName" required="required" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Số điện thoại</label> <input type="text"
                                                                                                   class="form-control" name="phone" required="required" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Địa chỉ</label> <input type="text"
                                                                                             class="form-control" name="address" required="required" />
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Hủy</button>
                                                    <input class="btn btn-primary" id="btnSubmit" type="submit"
                                                           value="Xác nhận" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <form class="formDoiMatKhau">
                            <div>
                                <div class="modal fade" id="doiMKModal" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true"
                                     data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Đổi mật khẩu</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                           value="${_csrf.token}" />
                                                </div>

                                                <div class="form-group">
                                                    <label for="name">Mật khẩu cũ</label> <input type="password"
                                                                                                 class="form-control" name="oldPassword" required="required" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Mật khẩu mới</label> <input type="password"
                                                                                                  class="form-control" name="newPassword" required="required" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Nhắc lại mật khẩu mới</label> <input
                                                        type="password" class="form-control" name="confirmNewPassword"
                                                        required="required" />
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Hủy</button>
                                                    <input class="btn btn-primary" type="button"
                                                           id="btnXacNhanDoiMK" value="Xác nhận" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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
<script src="<c:url value='/js/admin/profileAdmin.js'/>"></script>
<script src="<c:url value='./js/admin/jquery.easing.min.js'/>" ></script>
<script src="<c:url value='./js/admin/jquery.min.js'/>" ></script>
</body>

</html>