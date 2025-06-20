<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>ログイン</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .login-container {
      width: 320px;
      margin: 100px auto;
      border: 2px solid #444;
      padding: 30px;
      box-sizing: border-box;
      background-color: #f9f9f9;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 20px;
      color: #333;
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #222;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      border: 2px solid #444;
      box-sizing: border-box;
      margin-bottom: 20px;
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

    .error-message {
      color: red;
      text-align: center;
      margin-top: 10px;
      font-size: 13px;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>ログイン画面</h2>

    <form action="LoginServlet.action" method="post">
      <label for="userId">ユーザーID:</label>
      <input type="text" name="userId" id="userId" required>

      <label for="password">パスワード:</label>
      <input type="password" name="password" id="password" required>

      <input type="submit" value="ログイン">
    </form>

    <div class="error-message">
      <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
    </div>
  </div>
</body>
</html>
