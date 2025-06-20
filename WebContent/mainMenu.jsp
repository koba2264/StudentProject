<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>メインメニュー</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .main-container {
      width: 600px;
      margin: 60px auto;
      padding: 30px;
      border: 2px solid #444;
      background-color: #f9f9f9;
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      font-size: 22px;
      color: #333;
      margin-bottom: 20px;
    }

    ul {
      list-style: none;
      padding: 0;
      margin: 0 0 30px 0;
    }

    ul li {
      margin: 10px 0;
      padding: 10px;
      border: 1px solid #444;
      background-color: #e6e6e6;
      text-align: center;
    }

    ul li a {
      text-decoration: none;
      color: #000;
      font-weight: bold;
      display: block;
    }

    ul li:hover {
      background-color: #ccc;
    }

    p {
      font-size: 14px;
      color: #222;
      margin: 5px 0;
    }

    hr {
      margin: 20px 0;
      border: none;
      border-top: 1px solid #444;
    }
  </style>
</head>
<body>
  <div class="main-container">
    <h2>メインメニュー</h2>
    <ul>
      <li><a href="Student.action">学生情報管理</a></li>
      <li><a href="Score.action">得点情報管理</a></li>
      <li><a href="Subject.action">科目情報管理</a></li>
      <li><a href="Role.action">権限管理</a></li>
      <li><a href="Logout.action">ログアウト</a></li>
    </ul>

    <p>情報が届いているか確認するために表示させています</p>
    <p>ログインユーザー : ${ sessionScope.user.studentName }</p>
    <p>ユーザーid : ${ sessionScope.user.userId }</p>
    <p>パスワード : ${ sessionScope.user.password }</p>
    <hr>
    <p>学校id : ${ sessionScope.user.school.getId() }</p>
    <p>学校名 : ${ sessionScope.user.school.getName() }</p>
    <hr>
    <p>権限id : ${ sessionScope.user.role.getId() }</p>
    <p>権限名 : ${ sessionScope.user.role.getRoleName() }</p>
  </div>
</body>
</html>