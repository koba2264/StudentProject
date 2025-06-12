<%@ page import="java.util.List, java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>得点情報検索</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 700px;
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
    }

    form label {
      display: block;
      margin: 10px 0;
      font-weight: bold;
    }

    input[type="text"],
    select {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      box-sizing: border-box;
      border: 2px solid #444;
    }

    input[type="submit"] {
      margin-top: 15px;
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }

    table {
      width: 100%;
      margin-top: 30px;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px;
      border: 1px solid #444;
      text-align: center;
    }

    p {
      margin-top: 20px;
      color: #222;
      font-size: 14px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>得点情報一覧検索</h2>

    <!-- 検索フォーム -->
    <form action="SearchScoreServlet.action" method="post">
      <label>クラス:
        <select name="classId">
          <option value="131">131</option>
          <option value="231">231</option>
          <% 
            List<Map<String, String>> scoreList =
              (List<Map<String, String>>) request.getAttribute("scoreList");

            if (scoreList != null) {
              for (Map<String, String> score : scoreList) {
          %>
            <option value="<%= score.get("classId") %>"><%= score.get("className") %></option>
          <%
              }
            }
          %>
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

    <!-- 検索結果 -->
    <%
      List<Map<String, String>> results =
        (List<Map<String, String>>) request.getAttribute("resultList");

      if (results != null && !results.isEmpty()) {
    %>
      <table>
        <tr>
          <th>クラス</th>
          <th>名前</th>
          <th>学籍番号</th>
        </tr>
        <%
          for (Map<String, String> student : results) {
        %>
        <tr>
          <td><%= student.get("className") %></td>
          <td><%= student.get("studentName") %></td>
          <td><%= student.get("studentId") %></td>
        </tr>
        <%
          }
        %>
      </table>
    <%
      } else if (results != null) {
    %>
      <p>該当する学生情報は見つかりませんでした。</p>
    <%
      }
    %>
  </div>
</body>
</html>