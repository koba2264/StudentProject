<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>科目情報 登録フォーム</title>
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
      margin-bottom: 20px;
    }

    p {
      font-size: 14px;
      color: red;
      text-align: center;
      margin-bottom: 15px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
      margin-bottom: 15px;
    }

    label {
      font-weight: bold;
      color: #222;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    input[type="text"] {
      width: 60%;
      padding: 8px;
      border: 2px solid #444;
      box-sizing: border-box;
      font-size: 14px;
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
      align-self: center;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>科目情報 登録フォーム</h2>
    <p>${ message }</p>

    <form action="SubjectConfirm.action" method="post">
      <label>科目ID:
        <input type="text" name="id" value="${ subject.id }" required>
      </label>

      <label>科目名:
        <input type="text" name="name" value="${ subject.name }" required>
      </label>

      <input type="submit" value="登録">
    </form>

    <form action="Subject.action" method="get">
      <input type="submit" value="戻る">
    </form>
  </div>
</body>
</html>
