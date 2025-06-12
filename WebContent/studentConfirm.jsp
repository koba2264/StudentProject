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
      margin-top: 20px;
      text-align: center;
    }

    input[type="submit"] {
      padding: 10px 20px;
      margin: 5px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="confirm-container">
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
    <form action="StudentRegister.action" method="get">
      <input type="submit" value="戻る">
    </form>
  </div>
</body>
</html>
