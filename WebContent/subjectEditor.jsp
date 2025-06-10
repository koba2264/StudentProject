<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>受講科目編集画面</title>
</head>
<body>
	<h2>受講科目編集</h2>
	<p>${ message }</p>
	<p>${ myClass.name }</p>
	<form action="SubjectUpdate.action" method="post" >
		<c:forEach var="num" begin="0" end="4">
			<label for="${ num }">受講科目${ num + 1 } : </label>
			<select name="sub${ num+1 }" id="${ num }">
				<c:forEach var="subject" items="${ subjects }">
					<c:choose>
						<c:when test="${ subject.id == enrolledSubjects[num] }">
							<option value="${ subject.id }" selected>${ subject.name }</option>
						</c:when>
						<c:otherwise>
							<option value="${ subject.id }">${ subject.name }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select><br>
		</c:forEach>
		<input type="hidden" value="${ myClass.name }" name="name">
		<input type="hidden" value="${ myClass.id }" name="classId">
		<input type="submit" value="更新">
	</form>
</body>
</html>