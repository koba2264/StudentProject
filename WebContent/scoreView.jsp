<%@ page import="java.util.List, java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>得点情報検索</title>
<body>
  <h2>得点情報一覧検索</h2>

  <!-- 検索フォーム -->
  <div class="form-section">
    <form action="SearchScoreServlet.action" method="post">
      <label>クラス:
        <select name="classId">
        	<option value="131">131</option>
        	<option value="131">231</option>
          <%
  List<Map<String, String>> scoreList =
    (List<Map<String, String>>) request.getAttribute("scoreList");

  if (scoreList != null) {
    for (Map<String, String> score : scoreList) {
%>
      <option value="<%= score.get("myClass") %>"><%= score.get("") %></option>
<%
    }
  }
%>
        </select>
      </label><br>

      <label>名前: <input type="text" name="studentName"></label><br>
      <label>学籍番号: <input type="text" name="studentId"></label><br>
      <input type="submit" value="検索">
    </form>
  </div>

  <!-- 検索結果 -->
  <% List<Map<String, String>> results =
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
        for (java.util.Map<String, String> student : results) {
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
</body>
</html>
