<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>学生情報管理</title>
</head>
<body>
  <h2>学生情報管理</h2>

  <!-- エラーメッセージ表示 -->
  <%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
  %>
    <p class="error"><%= errorMessage %></p>
  <%
    }
  %>

  <!-- 登録フォーム -->
  <div class="form-section">
    <h3>学生情報登録</h3>
    <form action="StudentRegisterServlet" method="post">
      <label>学校ID: <input type="text" name="schoolId" required></label><br>
      <label>クラスID: <input type="text" name="classId" required></label><br>
      <label>学籍番号: <input type="text" name="studentId" required></label><br>
      <label>名前: <input type="text" name="studentName" required></label><br>
      <label>性別:
        <select name="gender" required>
          <option value="">選択してください</option>
          <option value="男">男</option>
          <option value="女">女</option>
          <option value="その他">その他</option>
        </select>
      </label><br>
      <label>入学年度:
        <input type="number" name="enrollmentYear" min="1000" max="9999" required>
      </label><br><br>
      <input type="submit" value="登録">
    </form>
  </div>
</body>
</html>
