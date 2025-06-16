<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー編集画面</title>
</head>
<body>
	<h2>ユーザー編集画面</h2>
	<p style="color:red;">${ message }</p>
	<form action="UpdateUser.action">
		<c:choose>
			<c:when test='${ role.id == "002" }'>
				<input type="hidden" name="teacher" value="True">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="teacher" value="False">
			</c:otherwise>
		</c:choose>
		<input type="hidden" name="id" value="${ user.userId }">
		<label>名前: <input type="text" name="name" value="${ user.studentName }" required></label><br>
		<label>役職:
	  		<select name="role" required>
	  			<c:forEach var="role" items="${ roles }">
	  				<c:choose>
	  					<c:when test="${ user.role.id == role.id }">
				    		<option value="${ role.id }:${role.roleName}" selected>${ role.roleName }</option>
	  					</c:when>
	  					<c:otherwise>
				    		<option value="${ role.id }:${role.roleName}">${ role.roleName }</option>
	  					</c:otherwise>
	  				</c:choose>
	  			</c:forEach>
	  		</select>
		</label><br>
		<label>所属学校:
	  		<select name="school" required>
	  			<c:forEach var="school" items="${ schools }">
	  				<c:choose>
	  					<c:when test="${ user.school.id == school.id }">
			    			<option value="${ school.id }:${ school.name }" selected>${ school.name }</option>
	  					</c:when>
	  					<c:otherwise>
		    				<option value="${ school.id }:${ school.name }">${ school.name }</option>
	  					</c:otherwise>
	  				</c:choose>
	  			</c:forEach>
	  		</select>
		</label><br>
		<input type="submit" value="登録">
	</form>
</body>
</html>