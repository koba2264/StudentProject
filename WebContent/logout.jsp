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
</head>
<body>
  <h2>ログアウトしました</h2>
  <a href="login.jsp">ログイン画面へ戻る</a>
</body>
</html>
