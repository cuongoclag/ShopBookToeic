<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Quản lý Category</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<jsp:include page="template/sidebar.jsp"></jsp:include>
	 <!-- Begin Page Content -->
           <div class="quantity" style="width: 1100px; line-height:50px; margin:auto; border:1px solid red;margin-top:20px;margin-bottom:20px; display: flex; text-align: center;border-radius: 5px; background: #ffffff;">
			<div style="width: 550px; border-right:1px solid red; font-size:18px; color:red;">
				<span>Number of products sold during the year :</span>
				<span>${quantity }</span>
			</div>
			<div style="width: 550px;font-size:18px;color:red;">
				<span>Total revenue for the year :</span>
				<span>${sum }</span>
			</div>
		</div>
		<div class="container">

			<div id="container"
				style="width: 1100px; height: 600px; margin: 0 auto"></div>
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
            text: 'Monthly revenue statistics'
        },
      
        xAxis: {
            categories: categorie,
            crosshair: true
        },
        yAxis: {
            min: 0,
            max:100000000,
            title: {
                text: '$'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} K</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Month',
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