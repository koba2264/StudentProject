<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>学生編集画面</title>
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
    <h2>学生編集画面</h2>
    <p>${ message }</p>

    <form action="UpdateStu.action">
      <label>名前:
        <input type="text" name="name" value="${ name }" required>
      </label>
	      <label>クラス:
	        <select name="class" required>
	        	<option value="131" selected>1-31</option>
	        	<option value="231" selected>2-31</option>
	        </select>
	      </label>
	  <input type="hidden" value="${ id }" name="id">
      <input type="submit" value="登録">
    </form>
          <form action="UserView.action" method="get">
        <input type="submit" value="戻る">
      </form>
  </div>

</body>
</html>
