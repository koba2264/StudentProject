<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>科目情報 登録フォーム</title>
</head>
<body>
	<h2>科目情報 登録フォーム</h2>
	<p>${ message }</p>
	<form action="SubjectConfirm.action" method="post">
		<label>科目ID: <input type="text" name="id" value="${ subject.id }" required></label><br>
		<label>科目名: <input type="text" name="name" value="${ subject.name }" required></label><br>
	<br>
		<input type="submit" value="登録">
	</form>
	<form action="Subject.action" method="get">
		<input type="submit" value="戻る">
	</form>

</body>
</html>