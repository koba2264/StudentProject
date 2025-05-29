<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>登録確認画面</title>
</head>
<body>
  <h2>入力内容の確認</h2>

  <p>クラスID: ${param.classId}</p>
  <p>学籍番号: ${param.studentId}</p>
  <p>科目名: ${param.subjectName}</p>

  <!-- 登録確定ボタン -->
  <form action="SubjectRegisterServlet.action" method="post">
    <input type="hidden" name="classId" value="${param.classId}">
    <input type="hidden" name="studentId" value="${param.studentId}">
    <input type="hidden" name="subjectName" value="${param.subjectName}">
    <input type="submit" value="登録確定">
  </form>

  <!-- 戻るボタン -->
  <form action="subjectRegister.jsp" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>

