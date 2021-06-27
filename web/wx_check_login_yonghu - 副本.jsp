<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

<% 
	//http://localhost:8080/shop/check_h_login.jsp?cs_yhm=hu&cs_mm=123456
	String yhm = request.getParameter("yhm");
	String mm = request.getParameter("yhm");
	String jieguo_xinxi = ""; //返回信息，初始化
	
	//out.println("用户名：" + yhm + "<br>");
	if(yhm==null || yhm=="" || mm==null || mm==""){
		//{"zt":"no","xinxi":"输入不正确","uid":"0"}  //返回样本   
		//jieguo_xinxi = "{'zt':'no','xinxi':'输入不正确','uid':0'}";  //不能用单号，不然小程序取不到数据
		jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"请输入用户名和密码\",\"uid\":\"0\"}";		
	}else{
		Statement stmt = null;  
		ResultSet rs = null;  
		String sql = "";
		sql = sql + "select  *  from huiyuan " ;  //查询语句 
		sql = sql + " where shouji='" + yhm + "'";
		sql = sql + " and mima='" + mm + "'";
		stmt = conn.createStatement();  
		rs = stmt.executeQuery(sql);  
		if(rs.next()) {  
			jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"登录成功\",\"uid\":\""+rs.getInt("id")+"\"}";
			//out.println(" | yes<br>");
		}else{
			//out.println("no<br>");
			//out.println("<script language='JavaScript' >alert('用户不存在或者密码错误！');</script>");
			jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"用户不存在或者密码错误\",\"uid\":\"0\"}";		
		}


	}

	out.println(jieguo_xinxi);
	conn.close();
%>