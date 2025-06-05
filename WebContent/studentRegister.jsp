<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>学生情報 登録フォーム</title>
</head>
<body>
  <h2>学生情報 登録フォーム</h2>

<form action="StudentConfirm.action" method="post">

  <label>学籍番号: <input type="text" name="studentId" required></label><br>
  <label>名前: <input type="text" name="studentName" required></label><br>
  <label>クラス:
  <select name="class" required>
  	<c:forEach var="myClass" items="${ classes }">
	    <option value="${ myClass.id }:${myClass.name}">${ myClass.name }</option>
  	</c:forEach>
  </select>
</label><br>
  <label>性別:
  <select name="gender" required>
  	<c:forEach var="gender" items="${ genders }">
	    <option value="${ gender.id }:${gender.name}">${ gender.name }</option>
  	</c:forEach>
  </select>
</label><br>
  <label>入学年度: <input type="number" name="enrollmentYear" min="1000" max="9999" required></label><br><br>
  <input type="submit" value="登録">
</form>

 <form action="Student.action" method="get">
	<input type="submit" value="戻る">
 </form>

</body>
</html>
