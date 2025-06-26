<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>受講科目一覧</title>
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
      margin-top: 10px;
    }

    th, td {
      border: 1px solid #444;
      padding: 4px 8px;
      text-align: center;
      font-size: 13px;
    }

    th {
      background-color: #ddd;
    }

    form {
      margin: 0;
    }

    .edit-btn {
      padding: 4px 10px;
      font-size: 12px;
      background-color: #444;
      color: white;
      border: none;
      cursor: pointer;
    }

    .edit-btn:hover {
      background-color: #000;
    }

    .back-btn {
      margin-top: 20px;
      text-align: center;
    }

    .back-btn input[type="submit"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
    }

    .back-btn input[type="submit"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="container">
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
                  <input type="hidden" name="id" value="${ myClass.id }">
                  <input type="hidden" name="name" value="${ myClass.name }">
                  <input type="submit" value="編集" class="edit-btn">
                </form>
              </td>
            </tr>
          </c:if>
        </c:forEach>
      </tbody>
    </table>

    <div class="back-btn">
      <form action="Subject.action" method="get">
        <input type="submit" value="戻る">
      </form>
    </div>
  </div>
</body>
</html>
