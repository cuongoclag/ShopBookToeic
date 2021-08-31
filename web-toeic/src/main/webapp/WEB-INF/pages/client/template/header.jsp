
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'  />" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" href="<c:url value='/css/bootstrap-responsive.min.css'  />" />
<link rel="stylesheet" href="<c:url value='/css/style.css'  />" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>

<style>
	@media print {
		#header-row {
			display: none;
		}
	}
</style>
</head>

<body>
	<!--HEADER ROW-->
	<div id="header-row">
		<div class="container">
			<div class="row">
				<!--LOGO-->
				<div class="span3">
					<a class="brand" href="/"><img src="/resources/file/images/logo.png" style="height : 5rem"/></a>
				</div>
				<!-- /LOGO -->

				<!-- MAIN NAVIGATION -->
				<div class="span9">
					<div class="navbar  pull-right">
						<div class="navbar-inner">
							<a data-target=".navbar-responsive-collapse" data-toggle="collapse"
								class="btn btn-navbar"><span class="icon-bar"></span><span
								class="icon-bar"></span><span class="icon-bar"></span></a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<c:if test="${pageContext.request.userPrincipal.name == null}">
										<li class="active"><a href="/">Trang chủ</a></li>
										</li>
										<li><a href="<%=request.getContextPath()%>/signin">Đăng nhập</a></li>
										<li><a href="/cart/check-out"><i class="fas fa-shopping-cart" style="font-size: 1.5rem;"></i></a></li>
									</c:if>
									<c:if test="${pageContext.request.userPrincipal.name != null}">
										<li class="active"><a href="/">Trang chủ</a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown">${nguoiDung.fullName}<b class="caret"></b></a>
											<ul class="dropdown-menu">
												<c:if test="${!nguoiDung.loginOauth2 }">
													<li><a href="<%=request.getContextPath()%>/profile">Tài
															khoản</a></li>
												</c:if>
												<li><a href="<%=request.getContextPath()%>/orderUser/${nguoiDung.id }">Đơn hàng của bạn</a></li>
												<li><a href="<%=request.getContextPath()%>/signout">Thoát</a></li>
											</ul>
										</li>
										<li><a href="/cart/check-out"><i class="fas fa-shopping-cart" style="font-size: 1.5rem;"></i></a></li>
									</c:if>
								</ul>
							</div>

						</div>
					</div>
				</div>
				<!-- MAIN NAVIGATION -->
			</div>
		</div>
	</div>