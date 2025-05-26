<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>ログイン</title>
</head>
<body>
  <h2>ログイン画面</h2>

  <form action="LoginServlet" method="post">
    <label for="userId">ユーザーID:</label>
    <input type="text" name="userId" id="userId" required><br><br>

    <label for="password">パスワード:</label>
    <input type="password" name="password" id="password" required><br><br>

    <input type="submit" value="ログイン">
  </form>

  <p style="color:red;">
    <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
  </p>
</body>
</html>