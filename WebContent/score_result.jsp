<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>登録完了</title>
</head>
<body>

    <h2>得点情報 登録完了</h2>
    <p>以下の内容で登録しました。</p>
    <ul>
		<li>クラス名: ${class_id}</li>
		<li>学生: ${student_id}</li>
		<li>性別: ${gender_id}</li>
		<li>科目名: ${subject_id}</li>
		<li>回数: ${count}回目</li>
		<li>点数: ${score}点</li>
    </ul>
<input type = "button" value="戻る" onclick = "location.href='Score.action'">
</body>
</html>