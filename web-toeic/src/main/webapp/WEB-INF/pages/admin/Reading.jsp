<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1 class="h3 mb-0 text-gray-800">Reading</h1>
                </div>
                <!------------------------------------------- Content Row---------------------------------------- -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <button class="btn btn-success btnAddExam" data-toggle="modal"
                                data-target="#baiDocModal">Thêm mới</button>
                        <h4 style="color: red" id="info-success"></h4>
<%--                        <form class="form-inline" id="searchForm" name="searchObject">--%>
<%--                            <div class="form-group">--%>
<%--                                <select class="form-control" name="partSearch" id="partSearch">--%>
<%--                                    <option value="">Tất cả</option>--%>
<%--                                    <option value="5">Part 5</option>--%>
<%--                                    <option value="6">Part 6</option>--%>
<%--                                    <option value="7">Part 7</option>--%>
<%--                                </select>--%>
<%--                            </div>&nbsp;&nbsp;--%>
<%--                            			<div class="form-group">--%>
<%--                            				<select class="form-control" name="doKhoSearch" id="doKhoSearch">--%>
<%--                            					<option value="">Tất cả</option>--%>
<%--                            					<option value="1">Mức dễ</option>--%>
<%--                            					<option value="2">Mức trung bình</option>--%>
<%--                            					<option value="3">Mức khó</option>--%>
<%--                            				</select>--%>
<%--                            			</div>--%>
<%--                            			&nbsp;&nbsp;--%>
<%--                            <button type="button" class="btn btn-primary" id="btnDuyetBaiDoc">Duyệt Bài đọc</button>--%>
<%--                        </form>--%>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Reading Title</th>
                                    <th>Part</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
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

                <div class="card shadow mb-4">
                    <div class="modal fade" id="baiDocModal" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLable">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="titleModal">Thêm mới Bài Đọc.</h4>
                                </div>
                                <div class="modal-body">
                                    <input style="display:none" id="idReading">
                                    <div class="row">
                                        <span class="bg-danger" id="vocab_errors"></span>

                                        <div class="form-group col-md-6">
                                            <label>Tên bài Bài Đọc</label> <input id="namebaidoc"
                                                                                  class="form-control">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name">Phần thi (Part)</label>
                                            <select id="phanThi" class="form-control" name="part">
                                                <option value="5">Part 5-Complete sentence</option>
                                                <option value="6">Part 6-Complete the paragraph</option>
                                                <option value="7">Part 7-Reading comprehension</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name">Do Kho</label>
                                            <select name="doKho" id="doKho" class="form-control">
                                                <option value="1">Mức dễ</option>
                                                <option value="2">Mức trung bình</option>
                                                <option value="3">Mức khó</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="fileExcel">File nội dung (Excel):</label> <input
                                                type="file" class="form-control" id="file_Excel"
                                                name="file_Excel" required accept=".xlsx">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="fileAnhCauHoi">File ảnh:</label> <input
                                                type="file" class="form-control" id="file_image_question"
                                                name="file_Image_Question" required accept="image/*" multiple>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="fileNghe">File Audio:</label> <input
                                                type="file" class="form-control" id="file_reading"
                                                name="file_Excel" required multiple accept=".mp3,.org">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" id="btnAddNewReading" class="btn btn-primary">Xác nhận</button>
                                    <button type="button" style="display:none;" id="btnUpdateReading" class="btn btn-primary">Cập nhật</button>
                                </div>
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
<script src="<c:url value='/js/admin/quanLyBaiDoc.js'/>" ></script>
</body>

</html>