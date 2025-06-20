<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>担当教員変更画面</title>
</head>
<body>
	<h2>担当教員変更画面</h2>
	<form action='' method='post'>
		<c:forEach items="${ teachers }" var="user">
			<label for="${ user.userId }">${ user.studentName }</label>
			<c:choose>
				<c:when test="${ managers.contains(user.userId) }">
					<input type="checkbox" id="${ user.userId }" name="${ user.userId }" value="${ user.userId }" checked>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="${ user.userId }" name="${ user.userId }" value="${ user.userId }">
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<input type="submit" value="変更">
	</form>
</body>
</html>