<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科目一覧</title>
<style>
	table {
		border-collapse: collapse;
		width: 100%;
		table-layout: fixed;
	}
	th, td {
		border: 1px solid #ccc;
		text-align: center;
		width: 16.6%;
		padding: 8px;
	}
	.score-box {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 8px;
	}
	
	.score-box div {
		flex: 1;
	}
	
	.score-box .divider {
		width: 1px;
		background-color: #aaa;
		height: 1.5em;
		flex: none;
	}

</style>
</head>
<body>
	<table>
		<tr>
			<th>名前</th>
			<th>db</th>
			<th>java</th>
			<th>python</th>
			<th>html</th>
			<th>aws</th>
		</tr>
		<tr>
			<td>俺</td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
		</tr>
		<tr>
			<td>お前</td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
		</tr>
		<tr>
			<td>君</td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
		</tr>
		<tr>
			<td>あなた</td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>
			<td><div class="score-box"><div>13</div><div class="divider"></div><div>100</div></div></td>		
		</tr>
	</table>
</body>
</html>
