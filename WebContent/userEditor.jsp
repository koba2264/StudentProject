<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>ユーザー編集画面</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .form-container {
      width: 500px;
      margin: 80px auto;
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

    p {
      text-align: center;
      color: red;
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-size: 14px;
      margin-bottom: 15px;
      color: #222;
    }

    input[type="text"],
    select {
      width: 100%;
      padding: 8px;
      font-size: 14px;
      border: 2px solid #444;
      background-color: #fff;
      box-sizing: border-box;
      margin-top: 5px;
    }

    input[type="submit"] {
      display: block;
      margin: 15px auto 0 auto;
      padding: 8px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2>ユーザー編集画面</h2>
    <p>${ message }</p>

    <form action="UpdateUser.action">
      <c:choose>
        <c:when test='${ role.id == "002" }'>
          <input type="hidden" name="teacher" value="True">
        </c:when>
        <c:otherwise>
          <input type="hidden" name="teacher" value="False">
        </c:otherwise>
      </c:choose>

      <input type="hidden" name="id" value="${ user.userId }">

      <label>名前:
        <input type="text" name="name" value="${ user.studentName }" required>
      </label>

      <label>役職:
        <select name="role" required>
          <c:forEach var="role" items="${ roles }">
            <c:choose>
              <c:when test="${ user.role.id == role.id }">
                <option value="${ role.id }:${role.roleName}" selected>${ role.roleName }</option>
              </c:when>
              <c:otherwise>
                <option value="${ role.id }:${role.roleName}">${ role.roleName }</option>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </select>
      </label>

      <label>所属学校:
        <select name="school" required>
          <c:forEach var="school" items="${ schools }">
            <c:choose>
              <c:when test="${ user.school.id == school.id }">
                <option value="${ school.id }:${ school.name }" selected>${ school.name }</option>
              </c:when>
              <c:otherwise>
                <option value="${ school.id }:${ school.name }">${ school.name }</option>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </select>
      </label>

      <input type="submit" value="登録">
    </form>
          <form action="UserView.action" method="get">
        <input type="submit" value="戻る">
      </form>
  </div>

</body>
</html>
