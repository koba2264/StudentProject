<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科目一覧</title>
<link rel="stylesheet" href="static/css/subject.css">
</head>
<body>
	<h2>科目一覧</h2>
	<table>
		<thead>
			<tr>
				<th>クラス名</th>
				<th colspan="5">受講科目</th>
				<th>編集</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="myClass" items="${ myClasses }">
				<c:if test='${ myClass.id != "000" }'>
					<tr>
						<td>${ myClass.name }</td>
						<c:forEach var="subject" items="${ myClass.subjects }">
							<td>${ subject.name }</td>
						</c:forEach>
						<td>
							<form action="SubjectEditor.action" method="post">
								<input type="hidden" value="${ myClass.id }" name="id">
								<input type="hidden" value="${ myClass.name }" name="name">
								<input type="submit" value="編集">
							</form>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<form action="Subject.action" method="get">
    	<input type="submit" value="戻る">
  	</form>
</body>
</html>
