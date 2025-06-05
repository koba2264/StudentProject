<%@ page import="java.util.List, java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>学生情報検索</title>
</head>
<body>
  <h2>学生情報一覧検索</h2>

  <!-- 検索フォーム -->
  <div class="form-section">
    <form action="StudentView.action" method="post">
      <label>クラス:
        <select name="classId">
        	<option value="">選択しない</option>
		<c:forEach var="myClass" items="${ classes }">
			<option value="${ myClass.id }">${ myClass.name }</option>
		</c:forEach>
        </select>
      </label><br>

      <label>名前: <input type="text" name="studentName"></label><br>
      <label>学籍番号: <input type="text" name="studentId"></label><br>
      <input type="submit" value="検索">
    </form>
  </div>

  <!-- 検索結果 -->
  <c:choose>
  	<c:when test="${ students != null }">
	    <table>
	      <tr>
	        <th>クラス</th>
	        <th>名前</th>
	        <th>学籍番号</th>
	        <th>削除</th>
	      </tr>
		<c:forEach var="student" items="${ students }">
	        <tr>
	          <td>${ student.myClass.name }</td>
	          <td>${ student.name }</td>
	          <td>${ student.id }</td>
	          <td>
	          	<form action="StudentDelete.action" method="post">
	          		<input type="hidden" value="${ student.id }" name="id">
	          		<input type="submit" value="削除">
	          	</form>
	          </td>
	        </tr>
		</c:forEach>
	    </table>
  	</c:when>
  	<c:otherwise>
	    <p>該当する学生情報は見つかりませんでした。</p>
  	</c:otherwise>
  </c:choose>
      <form action="Student.action" method="get">
    <input type="submit" value="戻る">
  </form>
</body>
</html>
