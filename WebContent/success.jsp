
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="org.apache.commons.dbutils.*"%>
<%@ page import="org.apache.commons.dbutils.handlers.ArrayHandler"%>
<%@ page import="org.apache.commons.dbutils.handlers.MapHandler"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>判断登录</title>
</head>
<body>
	<!--
		JDBC 驱动名及数据库 URL 数据库的用户名与密码，需要根据自己的设置useUnicode=true&characterEncoding=utf-8 防止中文乱码
	 -->
<%
	/*获取到从登陆页面传过来的参数  */
		String name = request.getParameter("name").trim();
		String password = request.getParameter("password").trim();

		String jdbcDriver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/test";
		String dbUserName = "root";
		String dbPassword = "root";

		Connection conn;
		QueryRunner queryRunner = new QueryRunner();
		ArrayHandler arrayHandler = new ArrayHandler();
	try {
		Class.forName(jdbcDriver);
		conn = DriverManager.getConnection(url, dbUserName, dbPassword);
		
		String sql = "SELECT * FROM `user` WHERE `name` =?";
		Map<String, Object> resultMap = queryRunner.query(conn, sql, new MapHandler(), name);
		// 检查用户是否存在
		if (Objects.nonNull(resultMap)) {
			 sql = "SELECT * FROM `user` WHERE `name` =? AND `password` = ?";
			 resultMap = queryRunner.query(conn, sql, new MapHandler(), name,password);
			//检查密码
			if (Objects.nonNull(resultMap)) {
				out.print(name + "登录成功");
			} else {
				/* 登陆失败 */
				out.print("<font color=red>" + name + "</font>密码错误！！！<br>"
				+ "请点击<a href=\"index.jsp\">重新登录</a>");
			}
		} else {
			/* 登陆失败 */
			out.print("<font color=red>" + name + "</font>用户不存在！<br>"
			+ "请点击<a href=\"registered.jsp\">注册</a>");
		}
	
		} catch (Exception ex) {
			ex.printStackTrace();
		}
%>
</body>
</html>
