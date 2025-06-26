<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <title>得点情報 登録完了</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .complete-container {
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
      text-align: center;
      font-size: 14px;
      color: #222;
      margin-bottom: 15px;
    }

    ul {
      font-size: 14px;
      color: #222;
      padding-left: 20px;
      margin-bottom: 20px;
    }

    li {
      margin-bottom: 5px;
    }

    .button-area {
      text-align: center;
    }

    input[type="button"] {
      padding: 8px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
    }

    input[type="button"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="complete-container">
    <h2>得点情報 登録完了</h2>
    <p>以下の内容で登録しました。</p>
    <ul>
      <li>クラス名: ${class_id}</li>
      <li>学生: ${student_id}</li>
      <li>科目名: ${subject_id}</li>
      <li>回数: ${count}回目</li>
      <li>点数: ${score}点</li>
    </ul>
    <div class="button-area">
      <input type="button" value="戻る" onclick="location.href='Score.action'">
    </div>
  </div>
</body>
</html>
