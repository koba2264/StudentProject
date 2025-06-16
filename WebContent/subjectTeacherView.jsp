<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>担当教員一覧</title>
</head>
<body>
	<h2>担当教員一覧</h2>
	<table>
		<tr>
			<th>科目ID</th>
			<th>科目</th>
			<th>教員</th>
			<th>編集</th>
		</tr>
		<c:forEach var="subject" items="${ subjects }">
		<tr>
			<td>${ subject.id }</td>
			<td>${ subject.name }</td>
			<td>
				<table>
					<tr>
						<c:forEach var="user" items="${ subject.teachers }">
							<td>${ user.studentName }</td>
						</c:forEach>
					</tr>
				</table>
			</td>
			<td>
				<form action="SubjectTeacherEditor.action" method="post">
					<input type="hidden" name="id" value="${ subject.id }">
					<input type="hidden" name="name" value="${ subject.name }">
					<input type="submit" value="編集">
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>