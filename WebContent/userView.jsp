<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー一覧</title>
</head>
<body>
	<h2>ユーザー一覧</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>名前</th>
			<th>役職</th>
			<th>所属学校</th>
			<th>編集</th>
			<th>削除</th>
		</tr>
		<c:forEach var="user" items="${ users }">
			<tr>
				<td>${ user.userId }</td>
				<td>${ user.studentName }</td>
				<td>${ user.role.roleName }</td>
				<td>${ user.school.name }
				<td>
					<form action="UserEditor.action" method="post">
						<input type="hidden" value="${ user.userId }" name="id">
						<input type="submit" value="編集">
					</form>
				</td>
				<td>
					<form action="UserDelete.action" method="post" onSubmit="return CheckDelete()">
		          		<input type="hidden" value="${ user.userId }" name="id">
		          		<input type="submit" value="削除">
	          		</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<form action="Role.action" method="get">
		<input type="submit" value="戻る">
	</form>
	<script>
	    function CheckDelete(){
	        if(confirm('削除しますか？')){
	            return true;
	        }else{
	            alert('キャンセルされました');
	            return false;
	        }
	    }
	</script>
</body>
</html>