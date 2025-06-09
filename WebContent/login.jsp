<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>ログイン</title>
  <style>
    body {
      font-family: "Helvetica Neue", sans-serif;
      background-color: #f7f7f7;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-container {
      background-color: #ffffff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 300px;
    }

    h2 {
      text-align: center;
      margin-bottom: 24px;
      color: #333;
    }

    label {
      display: block;
      margin-bottom: 6px;
      color: #555;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 18px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
    }

    input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #F2C9C9;
      border: none;
      border-radius: 6px;
      color: white;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.2s ease-in-out;
    }

    input[type="submit"]:hover {
      background-color: #DCACAC;
    }

    .error-message {
      color: red;
      text-align: center;
      margin-top: 12px;
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
