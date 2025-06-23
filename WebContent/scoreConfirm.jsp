<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>登録確認画面</title>
</head>
<body>
  <h2>入力内容の確認</h2>

  <p>クラス名: ${class_id}</p>
  <p>学生: ${student_id}</p>
  <p>性別: ${gender_id}</p>
  <p>科目: ${subject_id}</p>
  <p>回数: ${score_info.count}回目</p>
  <p>点数: ${score_info.score}点</p>

  <!-- 登録確定ボタン -->
  <form action="ScoreInsert.action" method="post">
    <input type="hidden" name="class_id" value="${class_id}">
    <input type="hidden" name="student_id" value="${student_id}">
    <input type="hidden" name="gender_id" value="${gender_id}">
    <input type="hidden" name="subject_id" value="${subject_id}">
    <input type="hidden" name="count" value="${score_info.count}">
    <input type="hidden" name="score" value="${score_info.score}">

    <input type="submit" value="登録確定">
  </form>

  <!-- 戻るボタン -->
<input type = "button" value="戻る" onclick = "location.href='Score.action'">
</body>
</html>