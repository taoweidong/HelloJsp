<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新用户注册</title>
</head>
<body>
	<h2 align="center">新用户注册</h2>
	<form action="registeredSucceed.jsp" method="post">
		<table align="center">
			<tr align="right">
				<td>请输入用户名:</td>
				<td><input type="text" name=name autofocus="autofocus"></td>
			</tr>
			<tr align="right">
				<td>请输入密码:</td>
				<td><input type="password" name=password></td>
			</tr>
			<tr align="right">
				<td>请输入确认密码:</td>
				<td><input type="password" name=refill></td>
			</tr>
		</table>
		<div align="center">
			<input type="submit" name=register value="注册"> <input
				type="reset" name=refill value="重填">
		</div>
	</form>


</body>
</html>
