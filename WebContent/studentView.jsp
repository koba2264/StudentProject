<%@ page import="java.util.List, java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>学生情報検索</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 800px;
      margin: 60px auto;
      padding: 30px;
      border: 2px solid #444;
      background-color: #f9f9f9;
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      font-size: 20px;
      color: #333;
      margin-bottom: 20px;
    }

    form {
      margin-bottom: 2px;
    }

    label {
      display: block;
      margin: 10px 0;
      font-weight: bold;
    }

    input[type="text"],
    select {
      width: 100%;
      padding: 8px;
      border: 2px solid #444;
      margin-top: 2px;
      box-sizing: border-box;
      font-size: 14px;
    }

    input[type="submit"] {
      margin-top: 2px;
      padding: 6px 12px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }

    .delete-btn {
      font-size: 11px;
      line-height: 1;
      height: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      font-size: 14px;
      text-align: center;
      border: 1px solid #444;
      line-height: 1.2;
    }

    p {
      text-align: center;
      margin-top: 20px;
      font-size: 14px;
      color: #222;
    }

    .back-button {
      text-align: center;
      margin-top: 30px;
    }
  </style>
</head>
<body>
  <div class="container">
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
        </label>

        <label>名前:
          <input type="text" name="studentName">
        </label>

        <label>学籍番号:
          <input type="text" name="studentId">
        </label>

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
                <form action="StudentDelete.action" method="post" onsubmit="return CheckDelete()">
                  <input type="hidden" value="${ student.id }" name="id">
                  <c:choose>
		              <c:when test='${ sessionScope.user.role.id != "002" || sessionScope.user.checkClass(student.myClass.id) }'>
		                  <input type="submit" value="削除" class="delete-btn">
		              </c:when>
		              <c:otherwise>
		                  <input type="submit" value="削除" class="delete-btn" disabled>
		              </c:otherwise>
                  </c:choose>
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

    <!-- 戻るボタン -->
    <div class="back-button">
      <form action="Student.action" method="get">
        <input type="submit" value="戻る">
      </form>
    </div>
  </div>

  <script>
    function CheckDelete() {
      return confirm('削除しますか？');
    }
  </script>
</body>
</html>
