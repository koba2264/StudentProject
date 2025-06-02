<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>学生情報 登録フォーム</title>
</head>
<body>
  <h2>学生情報 登録フォーム</h2>
<form action="StudentRegisterServlet" method="post">
  <label>学籍番号: <input type="text" name="studentId" required></label><br>
  <label>名前: <input type="text" name="studentName" required></label><br>
  <label>クラスID: <input type="text" name="classId" required></label><br>
  <label>性別:
  <select name="genderId" required>
    <option value="">選択してください</option>
    <option value="01">男性</option>
    <option value="02">女性</option>
    <option value="03">無回答</option>
  </select>
</label><br>  
  <label>入学年度: <input type="number" name="enrollmentYear" min="1000" max="9999" required></label><br><br>
  <input type="submit" value="登録">
</form>
    </form>
    <form action="mainMenu.jsp" method="get">
    <input type="submit" value="戻る">
  </form>

</body>
</html>
