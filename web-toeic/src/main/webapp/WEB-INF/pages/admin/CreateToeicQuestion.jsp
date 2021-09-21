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
    <script>
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
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
                    <h1 class="h3 mb-0 text-gray-800">Tạo Câu Hỏi Thi Toeic</h1>
                </div>
                <!------------------------------------------- Content Row---------------------------------------- -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <button class="btn btn-success btnAddExam" data-toggle="modal"
                                data-target="#ModalOne">Thêm Mới Với File Excel</button>
                        <button class="btn btn-success btnAddExam" data-toggle="modal"
                                data-target="#ModalTow">Thêm Mới Từng Câu</button>
                        <h4 style="color: blue" id="info-success"></h4>

                        <c:if test="${errorInfo != null }">
                            <h4 style="color: red" id="info-error">${error}</h4>
                            <h4>error: ${errorInfo}</h4>
                        </c:if>
                    </div>
                    <div class="card-body">
                        <input class="table-responsive col-6" id="myInput" type="text" placeholder="Tìm kiếm.." style="margin-bottom: 20px">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="myTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Id Câu Hỏi</th>
                                    <th>Câu Hỏi</th>
                                    <th>Đáp Án A</th>
                                    <th>Đáp Án B</th>
                                    <th>Đáp Án C</th>
                                    <th>Đáp Án D</th>
                                    <th>Đáp Án Đúng</th>
                                    <th>Ảnh</th>
                                    <th>Âm Thanh</th>
                                    <th>Part</th>
                                    <th>Độ Khó</th>
                                    <th>Thời Gian</th>
                                    <th>Chức Năng</th>
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
                    <!------------------------------------------- Modal Thêm Nhiều câu hỏi---------------------------------------- -->
                    <div class="modal fade" id="ModalOne" tabindex="-1" role="dialog"
                         aria-labelleby="myModalLable">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="titleModalOne">Tạo Kho Đề Thi Toeic</h4>
                                </div>
                                <div class="modal-body">
                                    <input style="display:none" id="idExam">
                                    <div class="row">

                                        <div class="form-group col-md-12">
                                            <label for="fileExcel">File nội dung (Excel):</label> <input
                                                type="file" class="form-control" id="file_Excel"
                                                name="file_Excel" required accept=".xlsx">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="fileAnhCauHoi">File ảnh câu hỏi:</label> <input
                                                type="file" class="form-control" id="file_image_question"
                                                name="file_Image_Question" required accept="image/*" multiple>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="fileNghe">File nghe câu hỏi:</label> <input
                                                type="file" class="form-control" id="file_listening"
                                                name="file_Excel" required multiple accept=".mp3,.org">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" id="btnAddNewOne" class="btn btn-primary">Xác nhận</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!------------------------------------------- Modal Thêm Từng Câu Hỏi---------------------------------------- -->
                    <div class="modal fade" id="ModalTow" tabindex="-1" role="dialog"
                         aria-labelleby="myModalLable">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="titleModalTow">Tạo Kho Đề Thi Toeic</h4>
                                </div>
                                <div class="modal-body">
                                    <input style="display:none" id="idExam">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label>Nôi Dung Câu Hỏi</label>
                                            <input id="question" class="form-control">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>Đáp Án A: </label>
                                            <input id="answer_1" class="form-control">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>Đáp Án B:</label>
                                            <input id="answer_2" class="form-control">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>Đáp Án C</label>
                                            <input id="answer_3" class="form-control">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>Đáp Án D</label>
                                            <input id="answer_4" class="form-control">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>Đáp Án Đúng</label>
                                            <input id="correctAnswer" class="form-control">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Ảnh Bài Câu Hỏi</label>
                                            <input type="file" id="file_Image" class="form-control" required accept="image/*">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Audio Câu Hỏi</label>
                                            <input type="file" id="file_Audio" class="form-control" required accept=".mp3,.org">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name">Phần thi (Part)</label>
                                            <select id="part" class="form-control" name="part">
                                                <option value="1">Part 1: Hình Ảnh + Audio -> Chọn Đáp Án</option>
                                                <option value="2">Part 2: Audio -> Chọn Đáp Án</option>
                                                <option value="3">Part 3: Hình Ảnh -> Chọn Đáp Án</option>
                                                <option value="4">Part 4: Hoàn Thành Câu</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name">Độ Khó Câu Hỏi</label>
                                            <select name="difficult" id="difficult" class="form-control">
                                                <option value="1">Mức dễ</option>
                                                <option value="2">Mức trung bình</option>
                                                <option value="3">Mức khó</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name">Thời gian Làm.</label>
                                            <select name="time" id="time" class="form-control">
                                                <option value="30">30 s</option>
                                                <option value="60">60 s</option>
                                                <option value="120">120 s</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" id="btnAddNewTow" class="btn btn-primary">Xác nhận</button>
                                    <button type="button" style="display:none;" id="btnUpdateTow" class="btn btn-primary">Cập nhật</button>
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
    <script src="<c:url value='/js/admin/taocauhoi.js'/>"></script>
</body>

</html>