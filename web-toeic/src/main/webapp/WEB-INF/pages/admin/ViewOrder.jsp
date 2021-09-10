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

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <style type="text/css">
        #headerTitlePrint{
            display: none;
        }
        @media print {
            #headerTitlePrint {
                display: block;
            }
            #linkA, #linkB , #linkC, #linkD{
                display: none;
            }
        }
    </style>
    <script src="<c:url value='/js/admin/shop/delete-saleOrder.js'/>" ></script>
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
                <div class="card-body" >
                    <div id="print_div">
                        <div id="headerTitlePrint">
                            <div style="display: flex; justify-content: space-between">
                                <div>
                                    <img src="/resources/file/images/logo.png" alt="" style="width: 10rem; height: 10rem">
                                </div>
                                <div>
                                    <h5>CMT8 - Q3 - HCM</h5>
                                    <h5>08-7070707070</h5>
                                    <h5>fastsneakercompany@gmail.com</h5>
                                </div>
                            </div>
                            <br />
                            <br/>
                        </div>
                        <h1 class="h3 mb-2 text-gray-800" style="text-align: center">Thông tin đặt hàng <span style="color: red;">${saleOrder.code }</span></h1>
                        <br />
                        <div class="table-responsive">
                            <h3>Thông tin người dùng</h3>
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" border="1">
                                <thead>
                                <tr>
                                    <th scope="col">Tên</th>
                                    <th scope="col">SĐT</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Địa Chỉ</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>${saleOrder.customerName }</th>
                                    <th>${saleOrder.customerPhone }</th>
                                    <th>${saleOrder.customerEmail }</th>
                                    <th>${saleOrder.customerAddress }</th>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <h3>Danh sách sản phẩm</h3>
                        <div class="table-responsive">
                            <table class="table" border="1">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Tên Sản Phẩm</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Giá Sale</th>
                                    <th scope="col">Số lượng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${saleOrderProduct }" var="saleOrderProducts">
                                    <tr>
                                        <th>${saleOrderProducts.id}</th>
                                        <th>${saleOrderProducts.product.title }</th>
                                        <th>${saleOrderProducts.product.priceVN }</th>
                                        <th>${saleOrderProducts.product.promotionalPriceVN}</th>
                                        <th>${saleOrderProducts.quantity}</th>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th style="color: red">Tổng</th>
                                    <th>${saleOrder.totalVN }</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${saleOrder.status =='true'}">
                            <button type="button" name=""
                                    onclick="confirmDelete('${saleOrder.id }')"
                                    class="btn btn-primary" id="linkC">Đang xử lý </button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" name="" class="btn btn-danger" id="linkD"
                            ">Đã giao hàng</button>
                        </c:otherwise>
                    </c:choose>
                    <a href="${base }/admin/list-order" class="btn btn-danger" id="linkA">Trở lại</a>
                    <button type="button" name="" class="btn btn-primary" onclick="printdiv('print_div')" id="linkB">In</button>
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
<script type="text/javascript">
    function printdiv(printpage) {
        window.print();
    }
</script>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="<c:url value='./js/admin/jquery.easing.min.js'/>" ></script>
<script src="<c:url value='./js/admin/jquery.min.js'/>" ></script>
</body>

</html>