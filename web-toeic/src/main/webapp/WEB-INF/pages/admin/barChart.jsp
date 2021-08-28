<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Quản lý chart</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<jsp:include page="template/sidebar.jsp"></jsp:include>
	 <!-- Begin Page Content -->
           <div class="quantity" style="width: 1100px; line-height:50px; margin:20px 20%; border:1px solid red;display: flex; text-align: center;border-radius: 5px; background: #ffffff;">
			<div style="width: 550px; border-right:1px solid red; font-size:18px; color:red;">
				<span>Số lượng đơn hàng trong năm :</span>
				<span>${quantity }</span>
			</div>
			<div style="width: 550px;font-size:18px;color:red;">
				<span>Tổng giá trị đơn hàng :</span>
				<span>${sum }</span>
			</div>
		</div>
		<div class="container">

			<div id="container"
				style="width: 1100px; height: 600px; margin: 20px 10%;"></div>
		</div>   
<jsp:include page="template/footer.jsp"></jsp:include>

	<script src="<c:url value='/js/admin/chart.js.Chart.min.js '/>"></script>
	<script src="<c:url value='/js/admin/demo/chart-area-demo.js '/>"></script>
	<script src="<c:url value='/js/admin/demo/chart-pie-demo.js '/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
    $(function(){
    	var categorie = ${saleOrder.keySet()}; 
    	var data1 = ${saleOrder.values()};
    Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Bảng thống kê hàng tháng'
        },
      
        xAxis: {
            categories: categorie,
            crosshair: true
        },
        yAxis: {
            min: 0,
            max:50000000,
            title: {
                text: 'VND'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.0f} VND</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.1,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Tháng',
            data: data1
        }]

    });
    });
	</script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
</body>
</html>