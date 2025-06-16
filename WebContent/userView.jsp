<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ユーザー一覧</title>
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
      margin-bottom: 20px;
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    th, td {
      padding: 4px 8px;
      font-size: 13px;
      border: 1px solid #444;
      text-align: center;
    }

    th {
      background-color: #ddd;
    }

    input[type="submit"] {
      padding: 10px 20px;
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
      padding: 2px 6px;
      font-size: 11px;
      line-height: 1;
      height: auto;
    }

    .back-button {
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>ユーザー一覧</h2>
    <table>
      <tr>
        <th>ID</th>
        <th>名前</th>
        <th>役職</th>
        <th>所属学校</th>
        <th>編集</th>
        <th>削除</th>
      </tr>
      <c:forEach var="user" items="${ users }">
        <tr>
          <td>${ user.userId }</td>
          <td>${ user.studentName }</td>
          <td>${ user.role.roleName }</td>
          <td>${ user.school.name }</td>
          <td>
            <form action="UserEditor.action" method="post">
              <input type="hidden" value="${ user.userId }" name="id">
              <input type="submit" value="編集">
            </form>
          </td>
          <td>
            <form action="UserDelete.action" method="post" onsubmit="return CheckDelete()">
              <input type="hidden" value="${ user.userId }" name="id">
              <input type="submit" value="削除" class="delete-btn">
            </form>
          </td>
        </tr>
      </c:forEach>
    </table>

    <div class="back-button">
      <form action="Role.action" method="get">
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
