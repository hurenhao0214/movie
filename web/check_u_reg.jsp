<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*,java.text.*"%>
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
	//sql = sql + " and mima='" + mm + "'";
	stmt = conn.createStatement();  
	rs = stmt.executeQuery(sql);  
	if (rs.next()) {  //账号已经注册
		//out.println("no<br>");
		out.println("<script language='JavaScript' >alert('该账号已经注册！');</script>");
	}else{
		//可以注册，写入注册的用户信息
		
		 //时间
		 java.util.Date Dates = new java.util.Date();
		 out.println("原始时间："+Dates+"<br>"); 
		 SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
		 SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		 String mydate1 = ft1.format(Dates);  //转成指定格式的字符串 
		 String mydate2 = ft2.format(Dates);  //转成指定格式的字符串		
		 
		//out.println(" | yes<br>");
	   String sql_insert="Insert into huiyuan(shouji,mima,fl_id,add_riqi,add_shijian) values(?,?,?,?,?)";
	   PreparedStatement pstmt=conn.prepareStatement(sql_insert);
	   pstmt.setString(1,yhm);
	   pstmt.setString(2,mm);
	   pstmt.setInt(3,1);
	   pstmt.setString(4,mydate1);
	   pstmt.setString(5,mydate2);
	   int n=pstmt.executeUpdate();
        
	   /*
		Cookie u_id = new Cookie("hy_id", rs.getString("id"));
		u_id.setMaxAge(60*60*24);   //设置cookie过期时间为24小时。
		response.addCookie(u_id); //在响应头部添加cookie

		Cookie u_fzid = new Cookie("hy_fzid", rs.getString("fl_id"));
		u_fzid.setMaxAge(60*60*24);   //设置cookie过期时间为24小时。
		response.addCookie(u_fzid); //在响应头部添加cookie	

		Cookie u_name = new Cookie("hy_name", yhm);
		u_name.setMaxAge(60*60*24);   //设置cookie过期时间为24小时。
		response.addCookie(u_name); //在响应头部添加cookie	
		*/
		
		out.println("<script language='JavaScript' >alert('注册成功！');window.parent.location='u_login.jsp';</script>");
	}
}
%>


</body>
</html>