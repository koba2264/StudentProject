<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>担当教員一覧</title>
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

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    th, td {
      border: 1px solid #444;
      padding: 6px 10px;
      font-size: 14px;
      text-align: center;
    }
    
    td{
      vertical-align: middle;
      }

    td table {
      width: 100%;
      border: none;
    }

    td table td {
      border: none;
      font-size: 13px;
    }

    input[type="submit"] {
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

    .back-form {
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="container">
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

    <div class="back-form">
      <form action="Subject.action" method="get">
        <input type="submit" value="戻る">
      </form>
    </div>
  </div>
</body>
</html>
