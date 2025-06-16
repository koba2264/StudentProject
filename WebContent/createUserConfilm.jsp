<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ユーザー登録</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .confirm-container {
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

    p {
      font-size: 14px;
      color: #222;
      margin: 10px 0;
    }

    form {
      text-align: center;
      margin-top: 15px;
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
      margin: 5px;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="confirm-container">
    <h2>入力内容の確認</h2>

    <p>ユーザーID: ${ user.userId }</p>
    <p>名前: ${ user.studentName }</p>
    <p>役職: ${ user.role.roleName }</p>
    <p>所属学校: ${ user.school.name }</p>

    <!-- 登録確定ボタン -->
    <form action="CreateUserResult.action" method="post">
      <input type="hidden" name="userId" value="${ user.userId }">
      <input type="hidden" name="name" value="${ user.studentName }">
      <input type="hidden" name="password" value="${ user.password }">
      <input type="hidden" name="role" value="${ user.role.id }:${ user.role.roleName }">
      <input type="hidden" name="school" value="${ user.school.id }:${ user.school.name }">
      <input type="submit" value="登録確定">
    </form>

    <!-- 戻るボタン -->
    <form action="CreateUser.action" method="get">
      <input type="submit" value="戻る">
    </form>
  </div>
</body>
</html>
