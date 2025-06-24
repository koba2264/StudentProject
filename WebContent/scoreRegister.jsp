<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>得点情報 登録フォーム</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .form-container {
      width: 600px;
      margin: 80px auto;
      padding: 30px;
      border: 2px solid #444;
      background-color: #f9f9f9;
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      font-size: 20px;
      color: #333;
      margin-bottom: 25px;
    }

    label {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
      font-size: 14px;
      color: #222;
    }

	select, input[type="number"] {
	  width: 60%;
	  padding: 8px;
	  border: 2px solid #444;
	  font-size: 14px;
	  height: 36px;
	  box-sizing: border-box;
	
	  /* ↓スピンボタン消して横幅対策 */
	  -moz-appearance: textfield;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
}

    input[type="submit"],
    input[type="button"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
      margin-top: 15px;
    }

    input[type="submit"]:hover,
    input[type="button"]:hover {
      background-color: #000;
    }


    .button-area {
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="form-container">
  <h2>得点情報 登録フォーム</h2>
<form action="ScoreConfirm.action" method="post">
  <label>クラスID:
  <select id="class_select" name="class_select" required>
    <option value="">選択してください</option>
	<c:if test='${ clsIdList.contains("131") }'>
	    <option value="131" class="class_id" ${param.class_id == '131' ? 'selected' : ''}>1-31</option>
	</c:if>
	<c:if test='${ clsIdList.contains("231") }'>
	    <option value="231" class="class_id" ${param.class_id == '231' ? 'selected' : ''}>2-31</option>
	</c:if>
  </select>
  </label><br>

  <label>学籍番号:
  <select id="student_select"  name="student_select" required>
  	<option value="" class="student_id">選択してください</option>
  	<c:forEach var="student" items="${ students }">
  		<option value="${ student.id }" class="student_id" ${param.student_id ==  student.id  ? 'selected' : ''}>${ student.id } : ${ student.name }</option>
  	</c:forEach>
  </select>
  </label><br>
      <label>性別:
        <select id="gender_select" name="gender_select" required>
          <option value="">選択してください</option>
          <option value="01" ${gender.id == "01" ? 'selected' : ''}>男性</option>
          <option value="02" ${gender.id == "02" ? 'selected' : ''}>女性</option>
          <option value="03" ${gender.id == "03" ? 'selected' : ''}>無回答</option>
        </select>

  </label><br>

  <label>科目名:
  <select id="subject_select" name="subject_select" required>
  	<option value="" class="subject_id">選択してください</option>
  	<c:forEach var="subject" items="${ subjects }">
  		<option value="${ subject.id }" class="subject_id" ${subject.id == subject_id ? 'selected' : ''}>${ subject.id } : ${ subject.name }</option>
  	</c:forEach>
  </select>
  </label><br>

  <label>回数:
  <select name="count_select" required>

  		<c:choose>
  			<c:when test="${ not empty count }">
  				<c:choose>
				    <c:when test="${count.size() == 2}">
				      <option value="registered" selected>登録済み</option>
				    </c:when>
				    <c:when test="${count.get(0) == 1}">
				      <option value=1 disabled>1回目</option>
				      <option value=2 selected>2回目</option>
				    </c:when>
				    <c:when test="${count.get(0) == 2}">
				      <option value=1 selected>1回目</option>
				      <option value=2 disabled>2回目</option>
				    </c:when>
			    </c:choose>
  			</c:when>
  			<c:otherwise>
  				<option value="" selected>選択してください</option>
  				<option value=1>1回目</option>
				<option value=2>2回目</option>

  			</c:otherwise>
		</c:choose>
  </select>
  </label><br>

  <label>点数:
  <input type="number" name="score" required>
  </label><br>


  <c:choose>
  	<c:when test="${ count.size() == 2 }">
  		<input type="submit" value="登録" disabled>
  	</c:when>
  	<c:otherwise>
		<input type="submit" value="登録">
  	</c:otherwise>
  </c:choose>
</form>
<input type = "button" value="戻る" onclick = "location.href='Score.action'">

<script type="text/javascript">
const classElm = document.getElementById("class_select");
const studentElm = document.getElementById("student_select");
const subjectElm = document.getElementById("subject_select");
classElm.addEventListener('change',function(){
	const form = document.createElement('form');
	const class_request = document.createElement('input');

	form.method = 'POST';
	form.action = 'ScoreRegister.action';

	class_request.type = 'hidden';
	class_request.name = 'class_id';
	class_request.value = this.value;


	form.appendChild(class_request);
	document.body.appendChild(form);

	form.submit();
})

studentElm.addEventListener('change',function(){
	const form = document.createElement('form');
	const student_request = document.createElement('input');
	const class_request = document.createElement('input');

	form.method = 'POST';
	form.action = 'ScoreRegister.action';

	student_request.type = 'hidden';
	student_request.name = 'student_id';
	student_request.value = this.value;

	class_request.type = 'hidden';
	class_request.name = 'class_id';
	class_request.value = classElm.value;


	form.appendChild(student_request);
	form.appendChild(class_request);
	document.body.appendChild(form);

	form.submit();
})

subjectElm.addEventListener('change',function(){
	const form = document.createElement('form');
	const subject_request = document.createElement('input');
	const student_request = document.createElement('input');
	const class_request = document.createElement('input');

	form.method = 'POST';
	form.action = 'ScoreRegister.action';

	subject_request.type = 'hidden';
	subject_request.name = 'subject_id';
	subject_request.value = this.value;

	student_request.type = 'hidden';
	student_request.name = 'student_id';
	student_request.value = studentElm.value;

	class_request.type = 'hidden';
	class_request.name = 'class_id';
	class_request.value = classElm.value;


	form.appendChild(subject_request);
	form.appendChild(student_request);
	form.appendChild(class_request);
	document.body.appendChild(form);

	form.submit();
})

</script>

</body>
</html>
