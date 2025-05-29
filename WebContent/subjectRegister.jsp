<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>科目情報 登録フォーム</title>
</head>
<body>

    <h2>科目情報 登録フォーム</h2>

    <form action="subjectConfirm.action" method="post">
        <label for="classId">クラスID:</label><br>
        <input type="text" id="classId" name="classId" required><br><br>

        <label for="subjectName">科目名:</label><br>
        <input type="text" id="subjectName" name="subjectName" required><br><br>

        <label for="studentId">学籍番号:</label><br>
        <input type="text" id="studentId" name="studentId" required><br><br>

        <input type="submit" value="登録">
    </form>
    <form action="mainMenu.jsp" method="get">
    <input type="submit" value="戻る">
  </form>
    <!-- ↑↑↑ ここまで form ↑↑↑ -->

</body>
</html>

