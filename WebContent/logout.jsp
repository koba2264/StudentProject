<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
  // セッション破棄（ログアウト処理）
  session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ログアウト</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .logout-container {
      width: 400px;
      margin: 100px auto;
      padding: 30px;
      border: 2px solid #444;
      background-color: #f9f9f9;
      box-sizing: border-box;
      text-align: center;
    }

    h2 {
      font-size: 20px;
      color: #333;
      margin-bottom: 20px;
    }

    a {
      display: inline-block;
      padding: 10px 20px;
      background-color: #444;
      color: white;
      text-decoration: none;
      font-size: 14px;
      border-radius: 2px;
    }

    a:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="logout-container">
    <h2>ログアウトしました</h2>
    <a href="login.jsp">ログイン画面へ戻る</a>
  </div>
</body>
</html>
