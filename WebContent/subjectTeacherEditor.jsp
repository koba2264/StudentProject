<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>担当教員変更画面</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .teacher-edit-container {
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
      margin-bottom: 20px;
    }

    p {
      text-align: center;
      font-size: 16px;
      font-weight: bold;
      color: #222;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 10px;
      align-items: flex-start;
    }

    label {
      font-size: 14px;
      color: #222;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    input[type="checkbox"] {
      transform: scale(1.2);
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
      margin-top: 20px;
      align-self: center;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }

    .back-form {
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="teacher-edit-container">
    <h2>担当教員変更画面</h2>
    <p>${ subject.name }</p>

    <form action="subjectTeacherUpdate.action" method="post">
      <c:forEach items="${ teachers }" var="user">
        <label for="${ user.userId }">
          <input type="checkbox" id="${ user.userId }" name="userId" value="${ user.userId }"
            <c:if test="${ managers.contains(user.userId) }">checked</c:if>>
          ${ user.studentName }
        </label>
      </c:forEach>

      <input type="hidden" name="subjectId" value="${ subject.id }">
      <input type="submit" value="変更">
    </form>

    <div class="back-form">
      <form action="SubjectTeacherView.action" method="get">
        <input type="submit" value="戻る">
      </form>
    </div>
  </div>
</body>
</html>
