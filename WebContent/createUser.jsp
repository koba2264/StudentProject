<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ユーザー作成</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .user-form-container {
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
      font-size: 14px;
      color: red;
      text-align: center;
      margin-bottom: 15px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: bold;
      color: #222;
    }

    input[type="text"],
    input[type="password"],
    select {
      width: 60%;
      padding: 8px;
      font-size: 14px;
      border: 2px solid #444;
      box-sizing: border-box;
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
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
  <div class="user-form-container">
    <h2>ユーザー作成</h2>
    <p>${ message }</p>

    <form action="CreateUserConfilm.action" method="post">
      <label>ユーザーID:
        <input type="text" name="userId" value="${ user.userId }" required>
      </label>

      <label>名前:
        <input type="text" name="name" value="${ user.studentName }" required>
      </label>

      <label>パスワード:
        <input type="password" name="password" required>
      </label>

      <label>役職:
        <select name="role" required>
          <c:forEach var="role" items="${ roles }">
            <option value="${ role.id }:${ role.roleName }">${ role.roleName }</option>
          </c:forEach>
        </select>
      </label>

      <label>所属学校:
        <select name="school" required>
          <c:forEach var="school" items="${ schools }">
            <option value="${ school.id }:${ school.name }">${ school.name }</option>
          </c:forEach>
        </select>
      </label>

      <input type="submit" value="登録">
    </form>

    <div class="back-form">
      <form action="Role.action" method="get">
        <input type="submit" value="戻る">
      </form>
    </div>
  </div>
</body>
</html>
