<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>登録完了</title>
</head>
<body>

    <h2>科目情報 登録完了</h2>
    <p>以下の内容で登録しました。</p>
    <ul>
        <li>クラスID: ${classId}</li>
        <li>科目名: ${subjectName}</li>
        <li>学籍番号: ${studentId}</li>
    </ul>
  <form action="subjectRegister.action" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>

