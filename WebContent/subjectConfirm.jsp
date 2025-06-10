<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>登録確認画面</title>
</head>
<body>
  <h2>入力内容の確認</h2>

  <p>科目ID: ${ subject.id }</p>
  <p>科目名: ${ subject.name }</p>

  <!-- 登録確定ボタン -->
  <form action="SubjectInsert.action" method="post">
    <input type="hidden" name="name" value="${ subject.name }">
    <input type="hidden" name="id" value="${ subject.id }">
    <input type="submit" value="登録確定">
  </form>

  <!-- 戻るボタン -->
  <form action="SubjectRegister.action" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>

