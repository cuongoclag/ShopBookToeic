
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
<meta name="google-translate-customization" content="9f841e7780177523-3214ceb76f765f38-gc38c6fe6f9d06436-c"></meta>

	<script type="text/javascript">
		function googleTranslateElementInit() {
			new google.translate.TranslateElement({pageLanguage: 'vi', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
		}
	</script>
	<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>


<style>
	@media print {
		#header-row {
			display: none;
		}
	}
</style>
</head>

<body>
<!-- header -->
<header>
    <div class="sticky" id="header-row">
        <div class="container">

            <!-- Logo -->
            <div class="logo"> <a href="/"><img class="img-responsive" src="/resources/file/images/logo.png" alt="" style="width: 20%"></a> </div>
            <nav class="navbar ownmenu">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-open-btn" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"><i class="fa fa-navicon"></i></span> </button>
                </div>

                <!-- NAV -->
                <div class="collapse navbar-collapse" id="nav-open-btn">
                    <ul class="nav">
                        <li> <a href="/">Trang chủ</a>
                        </li>

                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <li> <a href="/signin">Đăng nhập</a>
                            </li>
                        </c:if>

                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li class="dropdown user-acc"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" ><i class="icon-user"></i> </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <h6>HELLO! ${nguoiDung.fullName}</h6>
                                    </li>
                                    <c:if test="${!nguoiDung.loginOauth2 }">
                                        <li><a href="/profile">Tài khoản</a></li>
                                    </c:if>
                                    <li><a href="/toeicResultUser/${nguoiDung.id }">Kết quả thi Toeic</a></li>
                                    <li><a href="/orderUser/${nguoiDung.id }">Đơn hàng của bạn</a></li>
                                    <li><a href="/wishlist">Yêu thích</a></li>
                                    <li><a href="/signout">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </c:if>

                        <li class="user-basket"> <a href="/cart/check-out" ><i class="icon-basket-loaded"></i> </a>
                        </li>
                        <li><div id="google_translate_element"></div></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
</body>