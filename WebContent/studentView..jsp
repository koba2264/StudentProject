<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>学生情報検索</title>

</head>
<body>
  <h2>学生情報一覧検索</h2>

  <form action="SearchStudentServlet" method="post">
    <label>学校: <input type="text" name="school"></label><br>
    <label>クラス: <input type="text" name="className"></label><br>
    <label>名前: <input type="text" name="studentName"></label><br>
    <label>学籍番号: <input type="text" name="studentId"></label><br>
    <label>入学年度:
  <input type="number" name="enrollmentYear" min="2020" max="2100"></label><br>
    <input type="submit" value="検索">
  </form>

  <br>

  <%
    // 検索結果がある場合表示（List<Map<String, String>>形式を仮定）
    java.util.List<java.util.Map<String, String>> results =
        (java.util.List<java.util.Map<String, String>>) request.getAttribute("resultList");

    if (results != null && !results.isEmpty()) {
  %>
    <table>
      <tr>
        <th>学校</th>
        <th>クラス</th>
        <th>名前</th>
        <th>学籍番号</th>
        <th>入学年度</th>
      </tr>
      <%
        for (java.util.Map<String, String> student : results) {
      %>
        <tr>
          <td><%= student.get("school") %></td>
          <td><%= student.get("className") %></td>
          <td><%= student.get("studentName") %></td>
          <td><%= student.get("studentId") %></td>
          <td><%= student.get("enrollmentYear") %></td>
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
</body>
</html>
