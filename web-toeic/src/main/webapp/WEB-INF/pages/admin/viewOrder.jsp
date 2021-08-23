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
        .hidden {
            display: none;
        }
        .error-message {
            color: red;
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
                <h1 class="h3 mb-2 text-gray-800">Order Information <span style="color: red;">${saleOrder.code }</span></h1>
                <div class="table-responsive">
                    <h3>User Information</h3>
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>${saleOrder.customerName }</th>
                            <td>${saleOrder.customerPhone }</td>
                            <td>${saleOrder.customerEmail }</td>
                            <td>${saleOrder.customerAddress }</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <h3>List Product</h3>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${saleOrderProduct }" var="saleOrderProducts">
                            <tr>
                                <th>${saleOrderProducts.id}</th>
                                <td>${saleOrderProducts.product.title }</td>
                                <td>${saleOrderProducts.product.price } $</td>
                                <td>${saleOrderProducts.quantity}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th style="color: red">TOTAL</th>
                            <th>${saleOrder.total } $</th>
                        </tr>
                        </thead>
                    </table>
                </div>

            </div>
            <c:choose>
                <c:when test="${saleOrder.status =='true'}">
                    <button type="button" name=""
                            onclick="confirmDelete('${saleOrder.id }')"
                            class="btn btn-primary btn-sm">Complete </button>
                </c:when>
                <c:otherwise>
                    <button type="button" name="" class="btn btn-danger btn-sm"
                    ">Completed</button>
                </c:otherwise>
            </c:choose>
            <a href="${base }/admin/list-order" class="btn btn-danger btn-sm">Back</a>
            <button type="button" name="" class="btn btn-primary btn-sm" onclick="printdiv('print_div')">Print</button>
        </div>
    </div>
</div>

<jsp:include page="template/footer.jsp"></jsp:include>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="<c:url value='/js/admin/jquery.min.js'/>" ></script>

<script type="text/javascript">
    function printdiv(printpage) {
        var headstr = "<html><head><title></title></head><body>";
        var footstr = "</body>";
        var newstr = document.all.item(printpage).innerHTML;
        var oldstr = document.body.innerHTML;
        document.body.innerHTML = headstr + newstr + footstr;
        window.print();
        document.body.innerHTML = oldstr;
        return false;
    }
</script>
</body>
</html>