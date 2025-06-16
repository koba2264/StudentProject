<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>受講科目編集画面</title>
  <style>
    body {
      font-family: 'Meiryo', sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
    }

    .edit-container {
      width: 600px;
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
      font-size: 14px;
      color: #222;
      margin-bottom: 15px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-weight: bold;
      color: #222;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    select {
      width: 60%;
      padding: 8px;
      border: 2px solid #444;
      font-size: 14px;
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #444;
      color: white;
      border: none;
      font-size: 14px;
      cursor: pointer;
      align-self: center;
      margin-top: 10px;
    }

    input[type="submit"]:hover {
      background-color: #000;
    }
  </style>
</head>
<body>
  <div class="edit-container">
    <h2>受講科目編集</h2>
    <p>${ message }</p>
    <p>${ myClass.name }</p>

    <form action="SubjectUpdate.action" method="post">
      <c:forEach var="num" begin="0" end="4">
        <label for="${ num }">
          受講科目${ num + 1 }：
          <select name="sub${ num + 1 }" id="${ num }">
            <c:forEach var="subject" items="${ subjects }">
              <c:choose>
                <c:when test="${ subject.id == enrolledSubjects[num] }">
                  <option value="${ subject.id }" selected>${ subject.name }</option>
                </c:when>
                <c:otherwise>
                  <option value="${ subject.id }">${ subject.name }</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>
        </label>
      </c:forEach>

      <input type="hidden" name="name" value="${ myClass.name }">
      <input type="hidden" name="classId" value="${ myClass.id }">
      <input type="submit" value="更新">
    </form>
  </div>
</body>
</html>
