<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="ISO-8859-1">
    <title>Order Information</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="col-md-9 animated bounce">
    <div class="card shadow mb-4">
        <div class="card-body" >
            <div id="print_div">
                <img src="/resources/file/images/logo.png" alt="" style="width: 10rem; height: 10rem" id="headerTitlePrint">
                <h1 class="h3 mb-2 text-gray-800" style="text-align: center">Thông tin đặt hàng <span style="color: red;">${saleOrder.code }</span></h1>
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
                            class="btn btn-primary" id="linkC">Complete </button>
                </c:when>
                <c:otherwise>
                    <button type="button" name="" class="btn btn-danger" id="linkD"
                    ">Completed</button>
                </c:otherwise>
            </c:choose>
            <a href="${base }/admin/list-order" class="btn btn-danger" id="linkA">Back</a>
            <button type="button" name="" class="btn btn-primary" onclick="printdiv('print_div')" id="linkB">Print</button>
        </div>
    </div>
</div>

<jsp:include page="template/footer.jsp"></jsp:include>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="<c:url value='/js/admin/jquery.min.js'/>" ></script>

<script type="text/javascript">
    function printdiv(printpage) {
        window.print();
    }
</script>
</body>
</html>