<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>登録完了</title>
</head>
<body>

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
</body>
</html>