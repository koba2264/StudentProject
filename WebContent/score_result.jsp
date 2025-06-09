<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>登録完了</title>
</head>
<body>

    <h2>科目情報 登録完了</h2>
    <p>以下の内容で登録しました。</p>
    <ul>
		<li>クラスID: ${param.classId}</li>
		<li>学籍番号: ${param.studentId}</li>
		<li>名前: ${param.name}</li>
		<li>性別: ${param.genderId}</li>
		<li>入学年度: ${param.enrollmentYear}</li>
    </ul>
  <form action="StudentRegister.action" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>