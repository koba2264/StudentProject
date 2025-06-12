<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー登録</title>
</head>
<body>
  <h2>入力内容の確認</h2>

  <p>ユーザーID: ${ user.userId }</p>
  <p>名前: ${ user.studentName }</p>
  <p>役職: ${ user.role.roleName }</p>
  <p>所属学校: ${ user.school.name }</p>

  <!-- 登録確定ボタン -->
  <form action="CreateUserResult.action" method="post">
    <input type="hidden" name="userId" value="${ user.userId }">
    <input type="hidden" name="name" value="${ user.studentName }">
    <input type="hidden" name="password" value="${ user.password }">
    <input type="hidden" name="role" value="${ user.role.id }:${ user.role.roleName }">
    <input type="hidden" name="school" value="${ user.school.id }:${ user.school.name }">
    <input type="submit" value="登録確定">
  </form>

  <!-- 戻るボタン -->
  <form action="CreateUser.action" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>