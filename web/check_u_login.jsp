<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>


<%@ include file="conn.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<body>

<%  
	//http://localhost:8080/shop/check_h_login.jsp?cs_yhm=hu&cs_mm=123456
	String yhm = request.getParameter("cs_yhm");
	String mm = request.getParameter("cs_mm");
	//out.println("用户名：" + yhm + "<br>");
	if(yhm==null || yhm=="" || mm==null || mm==""){
		out.println("<script language='JavaScript' >alert('请输入用户名和密码！');</script>");
	}else{
		Statement stmt = null;  
		ResultSet rs = null;  
		String sql = "";
		sql = sql + "select  *  from huiyuan " ;  //查询语句 
		sql = sql + " where shouji='" + yhm + "'";
		sql = sql + " and mima='" + mm + "'";
		stmt = conn.createStatement();  
		rs = stmt.executeQuery(sql);  
		if (rs.next()) {  
			//out.println(rs.getString("id") + "|" + rs.getString("fenzu_id") );
			
			Cookie u_id = new Cookie("hy_id", rs.getString("id"));
			u_id.setMaxAge(60*60*24);   //设置cookie过期时间为24小时。
			response.addCookie(u_id); //在响应头部添加cookie

			Cookie u_fzid = new Cookie("hy_fzid", rs.getString("fl_id"));
			u_fzid.setMaxAge(60*60*24);   //设置cookie过期时间为24小时。
			response.addCookie(u_fzid); //在响应头部添加cookie	

			Cookie u_name = new Cookie("hy_name", yhm);
			u_name.setMaxAge(60*60*24);   //设置cookie过期时间为24小时。
			response.addCookie(u_name); //在响应头部添加cookie	
			
			out.println("<script language='JavaScript' >alert('成功登录！');window.parent.location='u_index.jsp';</script>");
			 
			//out.println(" | yes<br>");
		}else{
			//out.println("no<br>");
			out.println("<script language='JavaScript' >alert('用户不存在或者密码错误！');</script>");
		}
 
 
	}

%>  

</body>
</html>