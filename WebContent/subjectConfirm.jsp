<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>登録確認画面</title>
</head>
<body>
  <h2>入力内容の確認</h2>

  <p>科目名: ${param.subjectName}</p>

  <!-- 登録確定ボタン -->
  <form action="SubjectRegister.action" method="post">
    <input type="hidden" name="name" value="${param.subjectName}">
    <input type="submit" value="登録確定">
  </form>

  <!-- 戻るボタン -->
  <form action="SubjectRegister.action" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>

