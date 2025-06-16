<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー登録</title>
</head>
<body>
  <h2>ユーザー情報 登録完了</h2>

  <p>ユーザーID: ${ user.userId }</p>
  <p>名前: ${ user.studentName }</p>
  <p>役職: ${ user.role.roleName }</p>
  <p>所属学校: ${ user.school.name }</p>
   <form action="Role.action" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>