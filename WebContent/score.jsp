<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>得点情報一覧</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    table {
      border-collapse: collapse;
      width: 90%;
      table-layout: fixed;
      margin: 0 auto;
    }

    th, td {
      border: 1.5px solid #ccc;
      text-align: center;
      width: 16.6%;
      padding: 8px;
      font-size: 14px;
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

    button {
      border: none;
      background-color: white;
      cursor: pointer;
    }

    select {
      display: block;
      margin: 30px auto 20px auto;
      font-size: 14px;
      padding: 6px 10px;
      border: 2px solid #444;
      background-color: #fff;
      font-family: 'Meiryo', sans-serif;
    }

    .button-box {
      text-align: center;
      margin-top: 30px;
    }

    input[type="submit"],
    input[type="button"] {
      padding: 8px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
      margin: 0 10px;
    }

    input[type="submit"]:hover,
    input[type="button"]:hover {
      background-color: #000;
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
                  ${score.score}
                </button>
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

<div class="button-box">
  <input type="button" value="追加" onclick="location.href='ScoreRegister.action'">
  <form action="mainMenu.jsp" method="get" style="display: inline;">
    <input type="submit" value="戻る">
  </form>
</div>

<div id="result"></div>

<script type="text/javascript">
  const selectElm = document.getElementById("select");
  const scoresElm = document.querySelectorAll(".score");

  selectElm.addEventListener('change', function () {
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
  });

  for (const scoreElm of scoresElm) {
    scoreElm.addEventListener('click', function () {
      const form = document.createElement('form');

      const fields = ['student_id', 'student_name', 'subject_id', 'subject_name', 'count', 'score'];
      for (const field of fields) {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = field;
        input.value = this.dataset[field];
        form.appendChild(input);
      }

      form.method = 'POST';
      form.action = 'ScoreEditor.action';
      document.body.appendChild(form);
      form.submit();
    });
  }
</script>
</body>
</html>
