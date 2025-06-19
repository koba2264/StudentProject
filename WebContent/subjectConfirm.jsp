<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>登録確認画面</title>
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
      margin-bottom: 20px;
    }

    p {
      font-size: 14px;
      color: #222;
      margin: 10px 0;
    }

    form {
      text-align: center;
      margin-top: 15px;
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
      margin: 5px;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="confirm-container">
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
  </div>
</body>
</html>
