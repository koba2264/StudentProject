<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>得点情報一覧</title>
<style>
	table {
		border-collapse: collapse;
		width: 100%;
		table-layout: fixed;
	}
	th, td {
		border: 1px solid #ccc;
		text-align: center;
		width: 16.6%;
		padding: 8px;
	}
	.score-box {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 8px;
	}

	.score-box div {
		flex: 1;
	}

	.score-box .divider {
		width: 1px;
		background-color: #aaa;
		height: 1.5em;
		flex: none;
	}

	button{
		border : none;
		background-color : white;
	}

</style>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select name="class" id="select">
	<c:forEach var="myclass" items="${ myclasses }">
		<c:choose>
			<c:when test="${ myclass.id != 000 }">
				<option value="${ myclass.id }" class="class_id" ${param.class_id == myclass.id ? 'selected' : ''}>${ myclass.name }</option>
			</c:when>
		</c:choose>
	</c:forEach>
</select>
			<table>
				<tr>
					<th>名前</th>
					<c:forEach var="subject" items="${ subjects }">
						<th colspan="2">${ subject.name }</th>
					</c:forEach>
				</tr>

				<c:forEach var="student" items="${ students }">
				<tr>
					<td>${ student.name }</td>
					<c:forEach var="scoreList" items="${ scores[student.id] }">
						<c:forEach var="score" items="${ scoreList }">
							<c:choose>
							  <c:when test="${score.score != null}">
							    <td>
							     <button class="score"
							     data-count="${ score.count }" data-score="${ score.score }"
							     data-student_id="${ student.id }" data-student_name="${ student.name }"
							     data-subject_id="${ score.subject.id }" data-subject_name="${ score.subject.name }">
							     ${score.score}</button>
							    </td>
							  </c:when>
							  <c:otherwise>
							    <td>-</td>
							  </c:otherwise>
							</c:choose>
						</c:forEach>
					</c:forEach>
				</tr>
				</c:forEach>



			</table>
			<br>
<div id = "result"></div>
<input type = "button" value="追加" onclick = "location.href='ScoreRegister.action'">
	    <form action="mainMenu.jsp" method="get">
    <input type="submit" value="戻る">
  </form>
<script type="text/javascript">
const selectElm = document.getElementById("select");
const scoresElm = document.querySelectorAll(".score");
selectElm.addEventListener('change',function(){
	const form = document.createElement('form');
	const request = document.createElement('input');

	form.method = 'POST';
	form.action = 'Score.action';

	request.type = 'hidden';
	request.name = 'class_id';
	request.value = this.value;


	form.appendChild(request);
	document.body.appendChild(form);

	form.submit();
})

for(const scoreElm of scoresElm){
	scoreElm.addEventListener('click',function(){
		const form = document.createElement('form');
		const studentId_request = document.createElement('input');
		const studentName_request = document.createElement('input');
		const subjectId_request = document.createElement('input');
		const subjectName_request = document.createElement('input');
		const count = document.createElement('input');
		const score = document.createElement('input');


		form.method = 'POST';
		form.action = 'ScoreEditor.action';

		studentId_request.type = 'hidden';
		studentId_request.name = 'student_id';
		studentId_request.value = this.dataset.student_id;

		studentName_request.type = 'hidden';
		studentName_request.name = 'student_name';
		studentName_request.value = this.dataset.student_name;

		subjectId_request.type = 'hidden';
		subjectId_request.name = 'subject_id';
		subjectId_request.value = this.dataset.subject_id;

		subjectName_request.type = 'hidden';
		subjectName_request.name = 'subject_name';
		subjectName_request.value = this.dataset.subject_name;

		count.type = 'hidden';
		count.name = 'count';
		count.value = this.dataset.count;

		score.type = 'hidden';
		score.name = 'score';
		score.value = this.dataset.score;

		form.appendChild(studentId_request);
		form.appendChild(studentName_request);
		form.appendChild(subjectId_request);
		form.appendChild(subjectName_request);
		form.appendChild(count);
		form.appendChild(score);
		document.body.appendChild(form);

		form.submit();
	})
}



</script>


</body>
</html>