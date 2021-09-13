<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bài Listening</title>
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
    <script type="text/javascript" rc="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
    <script
            src="${pageContext.request.contextPath}/resources/js/client/baiReading.js"></script>

</head>
<style>
    #main {
        padding-top: 100px;
        overflow: hidden;
    }

    @media ( min-width : 767px) {
        #navigation {
            margin-top: 50px;
            margin-left: 100px;
            position: fixed;
        }
    }

    .fix-scrolling {
        max-height: 450px;
        /*overflow-y: scroll;*/
    }

    .numberCircle {
        display: inline-block;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        font-size: 15px;
        line-height: 25px;
        text-align: center;
        border: 2px solid #666;
        margin: 5px 5px 5px 15px;
    }

    #time {
        font-size: 25px;
        margin-left: 100px;
        color: green
    }

    #btnResult {
        margin-bottom: 15px;
        margin-left: 25px;
    }
    .web-font {
        font-size: 18px;
        font-family: 'Arial';
    }
</style>

<script type="text/javascript">

</script>
<body>

<!--Header
==========================-->
<div class="testListening" id="testListening">
    <!--/End Header-->
    <div id="content" class="container-fluid fill">
        <form id="submitForm" name="submitForm">
            <div class="row">
                <div id="navigation" class="col-md-3">
                    <div class="fix-scrolling">
                        <br>
                        <div>
                            <span id="time">30:00</span>
                        </div>
                        <hr>
                        <c:forEach begin="1" end="10" varStatus="loop">
                            <div class="numberCircle" id="answer${loop.index}">${loop.index}</div>
                        </c:forEach>
                        <br> <br>
                        <!-- 	<input type="button" id="btndoAgain" class="btn btn-warning" value="Làm lại"> -->
                        <input type="button" class="btn btn-primary" id="btnResult"
                               value="Kiểm Tra Đáp Án" /><br>
                        <hr>
                    </div>
                </div>
                <div class="col-md-4 ">
                    <!-- Placeholder - keep empty -->
                </div>
                <!--Nội dung bài test -->
                <div id="main" class="col-md-8 web-font">
                    <c:forEach items="${list}" var="list">
                        <input class="hidden" id="correctanswer"
                               name="correctanswer${list.number}" value="${list.correctAnswer}" />

                        <c:if test="${list.number == 1 }">
                            <br>
                            <p>
                                <input class="hidden" id="id_bai_reading"
                                       value="${list.getReadingExercises().getId()}" />
                            </p>
                        </c:if>
                        <c:if test="${list.number > 0 && list.number <=10 }">
                            <p>
                                <b>Question ${list.number}: ${list.question}</b>
                            </p>
                            <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="A" /> A.${list.answer_1} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="B" /> B.${list.answer_2}  <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="C" /> C.${list.answer_3}  <br>
                            <br>
                        </c:if>
                    </c:forEach>
                    <hr>
                    <p>Kết thúc bài Reading</p>
                </div>
            </div>
        </form>
    </div>

</div>

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