<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>


<%

	Class.forName("com.mysql.jdbc.Driver");  ////加载数据库驱动

	String url = "jdbc:MySQL://localhost:3306/db_movie?&useSSL=false&serverTimezone=UTC";

	String username = "root";  //数据库用户名
	String password = "123456";  //数据库用户密码
	Connection conn = DriverManager.getConnection(url, username, password);  //连接数据库

	//连接微信小程序
	String web_dizhi = "http://localhost:8080";
	String web_dizhi2 = "http://localhost:8080";
%>  
