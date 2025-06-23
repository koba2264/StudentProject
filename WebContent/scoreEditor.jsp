<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>得点情報 登録フォーム</title>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <h2>得点情報 登録フォーム</h2>
<form action="ScoreEditorResult.action" method="post">
  <div>学生情報 : ${ student_id }-${ student_name }</div><br>
  <div>科目名 : ${ subject_id }-${ subject_name }</div><br>
  <div>回数 : ${ score_info.count }回目</div><br>
  <label>点数:
  <input type="number" min=0 max=100 name="score" value="${ score_info.score }" required>
  </label><br>

  <input type="hidden" value="${ student_id }" name="student_id">
  <input type="hidden" value="${ subject_id }" name="subject_id">
  <input type="hidden" value="${ score_info.count }" name="count">


  <input type="submit" value="確定">
</form>
<form action="ScoreDelete.action" method="post">
  <input type="hidden" value="${ student_id }" name="student_id">
  <input type="hidden" value="${ subject_id }" name="subject_id">
  <input type="hidden" value="${ score_info.count }" name="count">

  <input type="submit" value="削除">
</form>
<input type = "button" value="戻る" onclick = "location.href='Score.action'">


</body>
</html>