<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>メインメニュー</title>

</head>
<body>
  <h2>メインメニュー</h2>
  <ul>
    <li><a href="Student.action">学生情報管理</a></li>
    <li><a href="Score.action">得点情報管理</a></li>
    <li><a href="Subject.action">科目情報管理</a></li>
    <li><a href="Role.action">権限管理</a></li>
    <li><a href="Logout.action">ログアウト</a></li>
  </ul><br>

  <p>情報が届いているか確認するために表示させています</p>
  <p>ログインユーザー : ${ sessionScope.user.studentName }</p>
  <p>ユーザーid : ${ sessionScope.user.userId }</p>
  <p>パスワード : ${ sessionScope.user.password }</p>
  <hr>
  <p>学校id : ${ sessionScope.user.school.getId() }</p>
  <p>学校名 : ${ sessionScope.user.school.getName() }</p>
  <hr>
  <p>権限id : ${ sessionScope.user.role.getId() }</p>
  <p>権限名 : ${ sessionScope.user.role.getRoleName() }</p>
</body>
</html>
