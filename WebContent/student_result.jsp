<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <title>登録完了</title>
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
      margin-bottom: 15px;
    }

    p {
      font-size: 14px;
      color: #222;
      margin-bottom: 15px;
      text-align: center;
    }

    ul {
      list-style: none;
      padding: 0;
      margin-bottom: 20px;
    }

    ul li {
      font-size: 14px;
      padding: 8px;
      border: 1px solid #444;
      background-color: #e6e6e6;
      margin-bottom: 8px;
    }

    form {
      text-align: center;
    }

    input[type="submit"] {
      padding: 10px 20px;
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
  <div class="complete-container">
    <h2>科目情報 登録完了</h2>
    <p>以下の内容で登録しました。</p>
    <ul>
      <li>クラス: ${ student.myClass.name }</li>
      <li>学籍番号: ${ student.id }</li>
      <li>名前: ${ student.name }</li>
      <li>性別: ${ student.gender.name }</li>
      <li>入学年度: ${ student.enrollmentYear }</li>
    </ul>
    <form action="StudentRegister.action" method="get">
      <input type="submit" value="戻る">
    </form>
  </div>
</body>
</html>
