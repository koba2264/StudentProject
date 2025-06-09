<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>メインメニュー</title>
  <style>
    body {
      font-family: "Segoe UI", sans-serif;
      background-color: #0d0d0d;
      color: #00ffff;
      margin: 0;
      padding: 40px;
      line-height: 1.6;
    }

    h2 {
      text-align: center;
      color: #00ffff;
      text-shadow: 0 0 8px #00ffff;
      margin-bottom: 30px;
    }

	ul {
	  list-style-type: none;
	  padding: 0;
	  text-align: center;
	}
	
	li {
	  margin: 12px auto;
	  width: 250px;
	}
	
	a {
	  display: block;
	  text-decoration: none;
	  color: #00ffff;
	  font-size: 18px;
	  padding: 12px 0;
	  border: 1px solid #00ffff;
	  border-radius: 8px;
	  transition: background-color 0.3s, box-shadow 0.3s;
	  box-shadow: 0 0 10px #00ffff40;
	  width: 100%;
}

    a:hover {
      background-color: #00ffff20;
      box-shadow: 0 0 15px #00ffff, 0 0 30px #00ffff;
    }

    p {
      color: #66ffff;
      text-align: center;
    }

    hr {
      border: 0;
      height: 1px;
      background: #00ffff;
      box-shadow: 0 0 8px #00ffff;
      margin: 30px auto;
      width: 80%;
    }
  </style>
</head>
<body>
  <h2>メインメニュー</h2>
  <ul>
    <li><a href="Student.action">学生情報管理</a></li>
    <li><a href="Score.action">得点情報管理</a></li>
    <li><a href="Subject.action">科目情報管理</a></li>
    <li><a href="Role.action">権限管理</a></li>
    <li><a href="Logout.action">ログアウト</a></li>
  </ul>

  <br>
  <p>情報が届いているか確認するために表示させています</p>
  <p>ログインユーザー : ${ sessionScope.user.studentName }</p>
  <p>ユーザーid : ${ sessionScope.user.userId }</p>
  <p>パスワード : ${ sessionScope.user.password }</p>
  <hr>
  <p>学校id : ${ sessionScope.user.school.getId() }</p>
  <p>学校名 : ${ sessionScope.user.school.getName() }</p>
  <hr>
  <p>権限id : ${ sessionScope.user.role.getId() }</p>
  <p>権限名 : ${ sessionScope.user.role.getRoleName() }</p>
</body>
</html>
