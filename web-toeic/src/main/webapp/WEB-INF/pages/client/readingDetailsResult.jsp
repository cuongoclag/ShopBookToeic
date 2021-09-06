<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ket qua Reading</title>
</head>
<style>
    .fix-top {
        margin-top: -125px;
    }
</style>
<body>


<div id="main" class="web-font">
    <p class="fix-top">
        Đáp án bài Reading : <span id="socaudung" style="color: red">Trả
				lời đúng ${socaudung} / 15 </span>
    </p>

    <c:forEach items="${list}" var="list">
        <input class="hidden" id="id_bai_exam"
               value="${list.getReadingExercises().getId()}" />
        <input class="hidden" id="correctanswer"
               name="correctanswer${list.number}" value="${list.correctAnswer}" />
        <input class="hidden" id="answerUser" name="question${list.number}"
               value="${list.getAnswerUser()}" />

        <!-- 	<p>Đáp án user: </p><br> -->
        <!-- show part1 -->
        <c:if test="${list.number == 1 }">
            <p>
                <b>Part 2: ${list.paragraph}</b>
            </p>
        </c:if>
        <c:if test="${list.number >=1  && list.number <4}">
            <c:if test="${list.getAnswerUser() != ''}">
                <p>
                    <b>Question ${list.number}:</b> ${list.question}
                </p>
            </c:if>
            <c:if test="${list.getAnswerUser() == ''}">
                <span style="color: red"> Chưa chọn câu trả lời</span>
                <p>
                    <b>Question ${list.number}:</b> ${list.question}
                </p>
            </c:if>
<%--            <audio controls> <source--%>
<%--                    src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"--%>
<%--                    type="audio/wav"></audio>--%>
            <br>
            <c:if test="${list.getAnswerUser() == ''}">
                <c:if test="${list.correctAnswer == 'A'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_3}
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'B'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_3}
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'C'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_3}
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'D'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_3}&nbsp;
                    <br>
                </c:if>
            </c:if>
            <c:if test="${list.getAnswerUser() == 'A' }">
                <c:if test="${list.correctAnswer == 'A'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'B'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'C'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'D'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}<br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
            </c:if>

            <c:if test="${list.getAnswerUser() == 'B' }">
                <c:if test="${list.correctAnswer == 'A'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}&nbsp;
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'B'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}&nbsp;
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'C'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}&nbsp;
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'D'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}<br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
            </c:if>

            <c:if test="${list.getAnswerUser() == 'C' }">
                <c:if test="${list.correctAnswer == 'A'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'B'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'C'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'D'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}<br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
            </c:if>
            <c:if test="${list.getAnswerUser() == 'D' }">
                <c:if test="${list.correctAnswer == 'A'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
                    <br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'B'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}&nbsp;
                    <br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'C'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}<br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
                <c:if test="${list.correctAnswer == 'D'}">
                    <input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
                    <input disabled type="radio" value="B" /> B. ${list.answer_2}<br>
                    <input disabled type="radio" value="C" /> C. ${list.answer_3}
                    <br>
                    <input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
                    <br>
                </c:if>
            </c:if>
            <br>
        </c:if>
    </c:forEach>
    <hr>
    <p>Kết thúc bài Listening</p>

</div>

</body>
</html>