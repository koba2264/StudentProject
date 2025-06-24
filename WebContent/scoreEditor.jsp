<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>得点情報 編集フォーム</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .form-container {
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

    .form-item {
      font-size: 14px;
      color: #222;
      margin-bottom: 15px;
    }

    label {
      display: block;
      margin-bottom: 10px;
    }

    input[type="number"] {
      width: 100%;
      padding: 8px;
      font-size: 14px;
      box-sizing: border-box;
      border: 2px solid #444;
      background-color: #fff;
    }

    .button-row {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    .button-center {
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
    }

    input[type="submit"]:hover,
    input[type="button"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2>得点情報 編集フォーム</h2>

    <div class="form-item">学生情報 : ${ student_id }-${ student_name }</div>
    <div class="form-item">科目名 : ${ subject_id }-${ subject_name }</div>
    <div class="form-item">回数 : ${ score_info.count }回目</div>

    <form action="ScoreEditorResult.action" method="post">
      <label>点数:
        <input type="number" min="0" max="100" name="score" value="${ score_info.score }" required>
      </label>

      <input type="hidden" name="student_id" value="${ student_id }">
      <input type="hidden" name="subject_id" value="${ subject_id }">
      <input type="hidden" name="count" value="${ score_info.count }">

      <div class="button-row">
        <input type="submit" value="確定">
        <form action="ScoreDelete.action" method="post" style="margin: 0;">
          <input type="hidden" name="student_id" value="${ student_id }">
          <input type="hidden" name="subject_id" value="${ subject_id }">
          <input type="hidden" name="count" value="${ score_info.count }">
          <input type="submit" value="削除">
        </form>
      </div>
    </form>

    <div class="button-center">
      <input type="button" value="戻る" onclick="location.href='Score.action'">
    </div>
  </div>

</body>
</html>
