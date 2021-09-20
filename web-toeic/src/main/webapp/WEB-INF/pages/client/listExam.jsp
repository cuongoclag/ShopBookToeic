<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Book List</title>

	<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/web/rs-plugin/css/settings.css" media="screen" />

	<!-- Bootstrap Core CSS -->
	<link href="${pageContext.request.contextPath}/resources/web/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="${pageContext.request.contextPath}/resources/web/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/web/css/ionicons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/main.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/web/css/responsive.css" rel="stylesheet">

	<!-- JavaScripts -->
	<script src="${pageContext.request.contextPath}/resources/web/js/modernizr.js"></script>

	<!-- Online Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		.hidden {
			display: none;
		}
		.imageExam {
			float: left;
			height: 150px;
			width: 250px;
			margin-bottom: 25px;
		}
	</style>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var buttons = document
									.getElementsByClassName('openModalExam');
							for (var i = 0; i < buttons.length; i++) {
								buttons[i].addEventListener("click", clickHandler);
							}
							function clickHandler(event) {
								var buttonId = event.target.id;
								var idExam = document.getElementById(buttonId).value;
								$('#examModal').modal('show');
								$('#examModal #idExamModal').val(idExam);
							}
							$('#btnLamBaiThi')
									.click(
											function() {
												var baseUrl = $('#baseUrl').val();
												var examId = $('#idExamModal')
														.val();
												window.location.href = baseUrl+"/doExam?idExam="
														+ examId;
											});
						});
	</script>
</head>
<body>

<!--Header
==========================-->

<jsp:include page="template/header.jsp"></jsp:include>
<!--/End Headter-->

	<input id="baseUrl" value="${pageContext.request.contextPath}" style="display:none;"/>
	<!-- Products -->

		<div class="container">
			<div class="col-sm-9" style="text-align: center">
				<div class="page-header">
					<h4 style="font-weight: bold;">DANH SÁCH BÀI THI THỬ</h4>
				</div>
			</div>
			<div class="row">
				<!-- Item Content -->
				<div class="col-sm-9">
					<c:if test="${fn:length(listData) == 0 }">
						<h4>Không tìm thấy dữ liệu</h4>
					</c:if>
					<!-- Popular Item Slide -->
					<div class="papular-block row">
						<!-- Item -->
						<c:forEach items="${listData}" var="list" varStatus="loop">

							<div class="col-md-12">
								<div class="col-md-4">
									<img class="imageExam"
										 src="${pageContext.request.contextPath}/resources/file/images/exam/${list.testImage}" />
								</div>

								<div class="col-md-8">
									<h6 class="content-heading" id="namebaithithu">
											${list.testTitle}</h6>
									<button class="btn btn-primary btn-sm openModalExam"
											value="${list.testId}" id="openModalExam.${loop.index}">
										Chi tiết</button>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>

				<!-- Shop SideBar -->
				<div class="col-sm-3">
					<div class="shop-sidebar">
						<h3>DANH MỤC</h3>
						<ul class="nav nav-list">
							<li><a href="/listening">LUYỆN BÀI NGHE</a></li>
							<li><a href="/reading">LUYỆN BÀI ĐỌC</a></li>
							<li><a href="/listExam">THI THỬ</a></li>
							<li><a href="/listGrammar">HỌC NGỮ PHÁP</a></li>
							<li><a href="/listVocab">HỌC TỪ VỰNG</a></li>
						</ul>
						<!-- Lọc -->
					</div>
				</div>
			</div>

<%--			<c:if test="${listData.size() != 0}">--%>
<%--				<div class="">--%>
<%--					<c:if test="${currentPage != 1}">--%>
<%--						<a class="btn btn-sm" style="padding: 1px 13px" href="/listExam?page=${currentPage-1}">Back</a>--%>
<%--					</c:if>--%>
<%--					<c:if test="${currentPage == 1}">--%>
<%--						<a class="btn btn-sm" style="padding: 1px 13px">1</a>--%>
<%--					</c:if>--%>

<%--					<c:if test="${currentPage != 1}">--%>
<%--						<a class="btn btn-sm" style="padding: 1px 13px" href="/listExam?page=1">1</a>--%>
<%--					</c:if>--%>

<%--					<c:forEach var="pag" items="${pageList}" varStatus="loop">--%>
<%--						<c:if test="${currentPage == pag}">--%>
<%--							<a class="btn btn-sm" style="padding: 1px 13px">${pag}</a>--%>
<%--						</c:if>--%>
<%--						<c:if test="${currentPage != pag}">--%>
<%--							<a class="btn btn-sm" style="padding: 1px 13px" href="/listExam?page=${pag}">${pag}</a>--%>
<%--						</c:if>--%>
<%--					</c:forEach>--%>

<%--					<c:if test="${currentPage != totalPage}">--%>
<%--						<a href="/listExam?page=${currentPage+1} " class="btn btn-sm" style="padding: 1px 13px">Next</a>--%>
<%--					</c:if>--%>
<%--				</div>--%>
<%--			</c:if>--%>
			<div class="modal fade" id="examModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content -->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">HƯỚNG DẪN LÀM BÀI THI THỬ</h4>
						</div>
						<div class="modal-body">
							<input class="hidden" id="idExamModal">
							<h6>Bài thi thử gồm 2 phần: (100 câu hỏi)</h6>
							<img style="float: left"
								 src="https://img.icons8.com/nolan/64/000000/reading.png"> <br>
							<h6>Phần 1: Listening skills (30 phút - 50 câu hỏi)</h6>
							<br> <img style="float: left"
									  src="https://img.icons8.com/nolan/64/000000/reading.png"> <br>
							<h6>Phần 2: Reading skills (45 phút - 50 câu hỏi)</h6>

							<br>
							<h6>Bài thi được thực hiện sau khi xác nhận làm bài thi</h6>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnLamBaiThi">Làm
							bài thi</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


<!--Footer==========================-->
<jsp:include page="template/footer.jsp"></jsp:include>
<!--/.Footer-->

<script src="${pageContext.request.contextPath}/resources/web/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/own-menu.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/jquery.lighter.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/owl.carousel.min.js"></script>

<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/rs-plugin/js/jquery.tp.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/web/js/main.js"></script>

</body>
</html>