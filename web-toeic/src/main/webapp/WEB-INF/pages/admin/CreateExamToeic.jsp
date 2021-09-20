<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="application/vnd.ms-Excel; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
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

<%--    <script src="https://cdn.jsdelivr.net/gh/linways/table-to-excel@v1.0.4/dist/tableToExcel.js"></script>--%>

    <script lang="javascript" src="<c:url value='/js/admin/taodethi.js'/>"></script>
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
                    <h1 class="h3 mb-0 text-gray-800">Tạo Đề Thi Toeic</h1>
                </div>
                <!------------------------------------------- Content Row------------------------------------------>
                <div class="card shadow">
                    <div class="card-header" style="display: flex">
                        <div class="col-3" style="padding-left: 0px">
                            <button class="btn btn-success" id="btnPart1">Random Part 1</button>
                            &emsp;
                            <button type="button" class="btn btn-success" data-toggle="collapse"
                                    data-target="#collapsePart1" aria-expanded="false"
                                    aria-controls="collapseExample" >List</button>
                        </div>
                        <div class="col-3" style="padding-left: 0px">
                            <button class="btn btn-success" id="btnPart2">Random Part 2</button>
                            &emsp;
                            <button type="button" class="btn btn-success" data-toggle="collapse"
                                    data-target="#collapsePart2" aria-expanded="false"
                                    aria-controls="collapseExample" >List</button>
                        </div>
                        <div class="col-3" style="padding-left: 0px">
                            <button class="btn btn-success" id="btnPart3">Random Part 3</button>
                            &emsp;
                            <button type="button" class="btn btn-success" data-toggle="collapse"
                                    data-target="#collapsePart3" aria-expanded="false"
                                    aria-controls="collapseExample" >List</button>
                        </div>
                        <div class="col-3" style="padding-left: 0px">
                            <button class="btn btn-success" id="btnPart4">Random Part 4</button>
                            &emsp;
                            <button type="button" class="btn btn-success" data-toggle="collapse"
                                    data-target="#collapsePart4" aria-expanded="false"
                                    aria-controls="collapseExample" >List</button>
                        </div>
                    </div>
                    <div class="card-body" style="padding: 0.25rem">
                        <div class="table-responsive collapse" id="collapsePart1">
                            <table class="table table-bordered"  width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Câu Hỏi</th>
                                    <th>ĐA A</th>
                                    <th>ĐA B</th>
                                    <th>ĐA C</th>
                                    <th>ĐA D</th>
                                    <th>ĐA Đúng</th>
                                    <th>Ảnh</th>
                                    <th>Âm Thanh</th>
                                    <th>Phần Thi</th>
                                    <th>Độ Khó</th>
                                    <th>Thời Gian</th>
                                </tr>
                                </thead>
                                <tbody id="part1">
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
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-body" style="padding: 0.25rem">
                        <div class="table-responsive collapse" id="collapsePart2">
                            <table class="table table-bordered"  width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Câu Hỏi</th>
                                    <th>ĐA A</th>
                                    <th>ĐA B</th>
                                    <th>ĐA C</th>
                                    <th>ĐA D</th>
                                    <th>ĐA Đúng</th>
                                    <th>Ảnh</th>
                                    <th>Âm Thanh</th>
                                    <th>Phần Thi</th>
                                    <th>Độ Khó</th>
                                    <th>Thời Gian</th>
                                </tr>
                                </thead>
                                <tbody id="part2">
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
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-body" style="padding: 0.25rem">
                        <div class="table-responsive collapse" id="collapsePart3">
                            <table class="table table-bordered"  width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Câu Hỏi</th>
                                    <th>ĐA A</th>
                                    <th>ĐA B</th>
                                    <th>ĐA C</th>
                                    <th>ĐA D</th>
                                    <th>ĐA Đúng</th>
                                    <th>Ảnh</th>
                                    <th>Âm Thanh</th>
                                    <th>Phần Thi</th>
                                    <th>Độ Khó</th>
                                    <th>Thời Gian</th>
                                </tr>
                                </thead>
                                <tbody id="part3">
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
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-body" style="padding: 0.25rem">
                        <div class="table-responsive collapse" id="collapsePart4">
                            <table class="table table-bordered"  width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Câu Hỏi</th>
                                    <th>ĐA A</th>
                                    <th>ĐA B</th>
                                    <th>ĐA C</th>
                                    <th>ĐA D</th>
                                    <th>ĐA Đúng</th>
                                    <th>Ảnh</th>
                                    <th>Âm Thanh</th>
                                    <th>Phần Thi</th>
                                    <th>Độ Khó</th>
                                    <th>Thời Gian</th>
                                </tr>
                                </thead>
                                <tbody id="part4">
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
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="card shadow">
                    <div class="card-header" style="display: flex">
                            <button type="button" class="btn btn-success btnQuestion" data-toggle="collapse"
                                    data-target="#collapse" aria-expanded="false"
                                    aria-controls="collapseExample" >List Question</button>
                    </div>
                    <div class="card-body" style="padding: 0.25rem">
                        <div class="table-responsive collapse" id="collapse">
                            <table class="table table-bordered"  width="100%" cellspacing="0" id="tblExport">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Id</th>
                                    <th>Question</th>
                                    <th>Answer A</th>
                                    <th>Answer B</th>
                                    <th>Answer C</th>
                                    <th>Answer D</th>
                                    <th>Corect Answer</th>
                                    <th>Image</th>
                                    <th>Audio</th>
                                    <th>Part</th>
                                    <th>Difficult</th>
                                    <th>Time</th>
                                </tr>
                                </thead>
                                <tbody id="listQuestion">
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
                <div class="card shadow">
                    <div class="card-header">
                        <button type="button" class="btn btn-success" id="toExcel">Xuất ra file excel</button>
<%--                        <input type="button" class="btn btn-success" onclick="tableToExcel('tblExport', 'W3C Example Table')" value="Xuất Ra File Excel">--%>
<%--                        <button id="btnExport" onclick="exportReportToExcel(this)">EXPORT REPORT</button>--%>

                    </div>
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

<%--    <script type="text/javascript">--%>
<%--        $(function () {--%>
<%--            $('#toExcel').click(function () {--%>
<%--                exportExcel('tablePart1','','');--%>
<%--            });--%>
<%--        })--%>


<%--    </script>--%>
<%--    <script type="text/javascript">--%>
<%--        let button = document.querySelector("#btnExport");--%>

<%--        button.addEventListener("click", e => {--%>
<%--            let table = document.querySelector("#tblExport");--%>
<%--            TableToExcel.convert(table);--%>
<%--        });--%>
<%--    </script>--%>

</body>

</html>