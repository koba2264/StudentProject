<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, java.util.Map" %>

<html>
<head>
  <title>科目情報 登録フォーム</title>
</head>
<body>

  <h2>科目情報 登録フォーム</h2>

  <form action="subjectConfirm.action" method="post">
    <label for="classId">クラス:</label><br>
    <select id="classId" name="classId" required>
      <option value="">選択してください</option>
      <%
        List<Map<String, String>> classList =
          (List<Map<String, String>>) request.getAttribute("classList");

        if (classList != null) {
          for (Map<String, String> cls : classList) {
      %>
        <option value="<%= cls.get("id") %>"><%= cls.get("name") %></option>
      <%
          }
        }
      %>
    </select><br><br>

    <label for="subjectName">科目名:</label><br>
    <input type="text" id="subjectName" name="subjectName" required><br><br>

    <label for="studentId">学籍番号:</label><br>
    <input type="text" id="studentId" name="studentId" required><br><br>

    <input type="submit" value="登録">
  </form>

  <form action="mainMenu.jsp" method="get">
    <input type="submit" value="戻る">
  </form>

</body>
</html>
