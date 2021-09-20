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
			Đáp án bài thi Reading: <span style="color: red">Trả lời đúng
				${socaudung} / 50 </span>
		</p>
		<c:forEach items="${listQuestion}" var="list">
			<input class="hidden" id="id_bai_exam"
				value="${list.getTest().getTestId()}" />
			<input class="hidden" id="answerUser" name="question${list.number}"
				value="${list.getAnswerUser()}" />
			<input class="hidden" id="correctanswer"
				name="correctanswer${list.number}" value="${list.correctAnswer}" />
			<!-- show part3 -->
			<c:if test="${list.part == 3}">
				<div class="container">
					<c:if test="${list.getAnswerUser() != ''}">
						<p>
							<b>Part 3: Question ${list.number}: ${list.question}</b>
						</p>
					</c:if>
					<c:if test="${list.getAnswerUser() == ''}">
						<p>
							<b>Question ${list.number}:</b> <span style="color: red">
								Chưa chọn câu trả lời</span>
						</p>
					</c:if>
					<img src="${pageContext.request.contextPath}/resources/file/images/examquestion/${list.image}"
						 alt="image not found"
						 style="height: 300px; width: 400px; float: left; margin-right: 10px" />
					<c:if test="${list.getAnswerUser() == ''}">
						<c:if test="${list.correctAnswer== 'A' }">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.correctAnswer== 'B' }">
							<input disabled type="radio" value="A" /> A. ${list.answer_1} <br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.correctAnswer== 'C' }">
							<input disabled type="radio" value="A" /> A. ${list.answer_1} <br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.correctAnswer== 'D' }">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
						</c:if>
					</c:if>
					<c:if test="${list.correctAnswer== 'A' }">
						<c:if test="${list.getAnswerUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}<br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
						</c:if>
					</c:if>
					<c:if test="${list.correctAnswer== 'B' }">
						<c:if test="${list.getAnswerUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
						</c:if>
					</c:if>
					<c:if test="${list.correctAnswer== 'C' }">
						<c:if test="${list.getAnswerUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
						</c:if>
					</c:if>
					<c:if test="${list.correctAnswer== 'D' }">
						<c:if test="${list.getAnswerUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
					</c:if>
				</div>
				<br>
			</c:if>
			<!-- show part 4 -->
			<c:if test="${list.part == 4}">
				<div class="web-font">
					<c:if test="${list.getAnswerUser() != ''}">
						<p>
							<b>Part 4: Question ${list.number}: ${list.question}</b>
						</p>
					</c:if>
					<c:if test="${list.getAnswerUser() == ''}">
						<p>
							<b>Question ${list.number}:</b> <span style="color: red">
								Chưa chọn câu trả lời</span>
						</p>
					</c:if>
					<c:if test="${list.getAnswerUser() == ''}">
						<c:if test="${list.correctAnswer== 'A' }">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.correctAnswer== 'B' }">
							<input disabled type="radio" value="A" /> A. ${list.answer_1} <br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.correctAnswer== 'C' }">
							<input disabled type="radio" value="A" /> A. ${list.answer_1} <br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.correctAnswer== 'D' }">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
						</c:if>
					</c:if>
					<c:if test="${list.correctAnswer== 'A' }">
						<c:if test="${list.getAnswerUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}<br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
						</c:if>
					</c:if>
					<c:if test="${list.correctAnswer== 'B' }">
						<c:if test="${list.getAnswerUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/correct.png"><br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;
							<img alt="img not found" src="${pageContext.request.contextPath}/resources/file/images/incorrect.png"><br>
						</c:if>
					</c:if>
					<c:if test="${list.correctAnswer== 'C' }">
						<c:if test="${list.getAnswerUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}  <br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
						</c:if>
					</c:if>
					<c:if test="${list.correctAnswer== 'D' }">
						<c:if test="${list.getAnswerUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getAnswerUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.answer_1}<br>
							<input disabled type="radio" value="B" /> B. ${list.answer_2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.answer_3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.answer_4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
					</c:if>
				</div>
				<br>
			</c:if>
		</c:forEach>
		<hr>
		<p>Kết thúc bài Reading</p>
	</div>
</body>
</html>