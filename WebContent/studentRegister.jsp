<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>学生情報 登録フォーム</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .form-container {
      width: 500px;
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

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-weight: bold;
      color: #222;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    input[type="text"],
    input[type="number"],
    select {
      width: 60%;
      padding: 8px;
      border: 2px solid #444;
      box-sizing: border-box;
      font-size: 14px;
    }

    input[type="submit"] {
      width: 100%;
      padding: 10px;
      border: none;
      background-color: #444;
      color: white;
      font-size: 14px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }

    .back-form {
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>学生情報 登録フォーム</h2>

    <form action="StudentConfirm.action" method="post">
      <label>学籍番号:
        <input type="text" name="studentId" required>
      </label>

      <label>名前:
        <input type="text" name="studentName" required>
      </label>

      <label>クラス:
        <select name="class" required>
          <c:forEach var="myClass" items="${ classes }">
            <option value="${ myClass.id }:${myClass.name}">${ myClass.name }</option>
          </c:forEach>
        </select>
      </label>

      <label>性別:
        <select name="gender" required>
          <c:forEach var="gender" items="${ genders }">
            <option value="${ gender.id }:${gender.name}">${ gender.name }</option>
          </c:forEach>
        </select>
      </label>

      <label>入学年度:
        <input type="number" name="enrollmentYear" min="1000" max="9999" required>
      </label>

      <input type="submit" value="登録">
    </form>

    <form action="Student.action" method="get" class="back-form">
      <input type="submit" value="戻る">
    </form>
  </div>
</body>
</html>
