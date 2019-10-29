
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
<title>注册成功页面</title>
</head>
<body>
	<!--
		JDBC 驱动名及数据库 URL 数据库的用户名与密码，需要根据自己的设置useUnicode=true&characterEncoding=utf-8 防止中文乱码
	 -->
	<%
		/*获取到从登陆页面传过来的参数  */
			String name = request.getParameter("name").trim();//去除首尾空格
			String password = request.getParameter("password").trim();
			String refill = request.getParameter("refill").trim();
			
			//校验参数
			if(!password.equals(refill)){
				out.print("<font color=red>" + name + "</font>两次密码不一致！<br>"
						+ "请点击<a href=\"registered.jsp\">注册</a>");
				return;
			}

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
					/* 登陆失败 */
					out.print("<font color=red>" + name + "</font>用户已存在！<br>"
					+ "请点击<a href=\"registered.jsp\">注册</a>");
				} else {
					 sql = "INSERT INTO `user` VALUES(UUID(),25,?,?)";
					 Object[] objectArr= queryRunner.insert(conn, sql, arrayHandler, name, password);
					 System.out.println("数组长度：" + objectArr.length );
					 out.print("用户： <h1> " + name + "</h1>注册成功！<br>"
								+ "请点击<a href=\"index.jsp\">重新登录</a>");
				}
		
			} catch (Exception ex) {
				ex.printStackTrace();
			}
	%>


</body>
</html>
