<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>得点情報 登録確認画面</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .confirm-container {
      width: 500px;
      margin: 80px auto;
      padding: 30px;
      border: 2px solid #444;
      background-color: #f9f9f9;
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      font-size: 20px;
      color: #333;
      margin-bottom: 25px;
    }

    p {
      font-size: 14px;
      color: #222;
      margin: 10px 0;
    }

    form {
      text-align: center;
      margin-top: 20px;
    }

    input[type="submit"],
    input[type="button"] {
      padding: 8px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
      margin: 0 10px;
    }

    input[type="submit"]:hover,
    input[type="button"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="confirm-container">
    <h2>入力内容の確認</h2>

    <p>クラス名: ${class_id}</p>
    <p>学生: ${student_id}</p>
    <p>科目: ${subject_id}</p>
    <p>回数: ${score_info.count}回目</p>
    <p>点数: ${score_info.score}点</p>

    <form action="ScoreInsert.action" method="post" style="display: inline;">
      <input type="hidden" name="class_id" value="${class_id}">
      <input type="hidden" name="student_id" value="${student_id}">
      <input type="hidden" name="subject_id" value="${subject_id}">
      <input type="hidden" name="count" value="${score_info.count}">
      <input type="hidden" name="score" value="${score_info.score}">
      <input type="submit" value="登録確定">
    </form>

    <input type="button" value="戻る" onclick="location.href='Score.action'">
  </div>
</body>
</html>
