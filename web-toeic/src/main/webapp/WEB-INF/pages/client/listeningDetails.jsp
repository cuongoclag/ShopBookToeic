<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bài Listening</title>

    <script
            src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script
            src="${pageContext.request.contextPath}/resources/js/client/baiListening.js"></script>
    <script type="text/javascript"
            src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
</head>


<style>
    .paragraph {
        white-space: pre-wrap;
        word-break: break-word;
        text-align: justify;
        background: #f3f7fa;
        color: #222;
        font-size: 14px;

    }

    #main {
        padding-top: 120px;
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

    #backhome {
        margin-left: 25px;
        text-decoration: none;
    }

    #btnSubmit {
        margin-bottom: 15px;
        margin-left: 15px;
    }

    #btnResult {
        margin-bottom: 15px;
        margin-left: 25px;
    }

    #btndoAgain {
        display: none;
        margin-bottom: 15px;
        margin-left: 40px;
    }

    .web-font {
        font-size: 15px;
        font-family: 'Arial';
    }
</style>

<script type="text/javascript">

</script>
<body>

<!--Header
==========================-->
<div class="testListening" id="testListening">
    <div class="navbar navbar-default navbar-fixed-top">
        <br>
        <div style="display: block;">
            <p>
                <a href="/" id="backhome" style="display: inline;">&larr;
                    Home</a> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                &nbsp <span>Bài Listening</span>
            </p>
        </div>

    </div>
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
                        <hr width="60%">
                        <c:forEach begin="1" end="50" varStatus="loop">
                            <div class="numberCircle" id="answer${loop.index}">${loop.index}</div>
                        </c:forEach>
                        <br> <br>
                        <!-- 	<input type="button" id="btndoAgain" class="btn btn-warning" value="Làm lại"> -->
                        <input type="button" class="btn btn-primary" id="btnResult"
                               value="Kiểm Tra Đáp Án" /><br>
                        <hr width="60%">
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
                                <b>Part 2: ${list.paragraph}</b>
                                <input class="hidden" id="id_bai_listening"
                                       value="${list.getListeningExercises().getId()}" />
                            </p>
                        </c:if>
                        <c:if test="${list.number >=1  && list.number <4}">
                            <p>
                                <b>Question ${list.number}:</b>
                            </p>
                            <audio controls> <source
                                    src="${pageContext.request.contextPath}/resources/file/audio/listening/${list.audiomp3}.mp3"
                                    type="audio/wav"></audio>
                            <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="A" /> A. ${list.answer_1}<br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="B" /> B. ${list.answer_2} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="C" /> C. ${list.answer_3} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="D" /> D. ${list.answer_4} <br>
                            <br>
                        </c:if>
                    </c:forEach>
                    <hr>
                    <p>Kết thúc bài Listening</p>
                </div>
            </div>
        </form>
    </div>

</div>

<!--Footer
==========================-->

<!--/.Footer-->

</body>
</html>