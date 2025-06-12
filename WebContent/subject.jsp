<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>科目情報管理</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .subject-container {
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

    ul {
      list-style: none;
      padding: 0;
      margin-bottom: 20px;
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

    form {
      text-align: center;
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="subject-container">
    <h2>科目情報管理</h2>
    <ul>
      <li><a href="SubjectRegister.action">科目情報の登録</a></li>
      <li><a href="SubjectView.action">科目情報の一覧表示</a></li>
    </ul>
    <form action="mainMenu.jsp" method="get">
      <input type="submit" value="戻る">
    </form>
  </div>
</body>
</html>
