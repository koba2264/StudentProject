<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>登録確認画面</title>
</head>
<body>
  <h2>入力内容の確認</h2>

  <p>クラス: ${ student.myClass.name }</p>
  <p>学籍番号: ${ student.id }</p>
  <p>名前: ${ student.name }</p>
  <p>性別: ${ student.gender.name }</p>
  <p>入学年度: ${ student.enrollmentYear }</p>

  <!-- 登録確定ボタン -->
  <form action="StudentInsert.action" method="post">
    <input type="hidden" name="class" value="${ student.myClass.id }:${ student.myClass.name }">
    <input type="hidden" name="studentId" value="${ student.id }">
    <input type="hidden" name="studentName" value="${ student.name }">
    <input type="hidden" name="gender" value="${ student.gender.id }:${ student.gender.name }">
    <input type="hidden" name="enrollmentYear" value="${ student.enrollmentYear }">
    <input type="submit" value="登録確定">
  </form>

  <!-- 戻るボタン -->
  <form action="SubjectRegister.action" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>