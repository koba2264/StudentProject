<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー作成</title>
</head>
<body>
	<h2>ユーザー作成</h2>
	<p>${ message }</p>
	<form action="CreateUserConfilm.action" method="post">
		<label>ユーザーID: <input type="text" name="userId" value="${ user.userId }" required></label><br>
		<label>名前: <input type="text" name="name" value="${ user.studentName }" required></label><br>
		<label>パスワード: <input type="password" name="password" required></label><br>
		<label>役職:
	  		<select name="role" required>
	  			<c:forEach var="role" items="${ roles }">
		    		<option value="${ role.id }:${role.roleName}">${ role.roleName }</option>
	  			</c:forEach>
	  		</select>
		</label><br>
		<label>所属学校:
	  		<select name="school" required>
	  			<c:forEach var="school" items="${ schools }">
		    		<option value="${ school.id }:${ school.name }">${ school.name }</option>
	  			</c:forEach>
	  		</select>
		</label><br>
		<input type="submit" value="登録">
	</form>
</body>
</html>