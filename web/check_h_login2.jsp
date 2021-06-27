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
		sql = sql + "select  count(*) totalCount  from quanxian_yonghu " ;  //查询语句 
		sql = sql + " where user_name='" + yhm + "'";
		sql = sql + " and user_password='" + mm + "'";
		stmt = conn.createStatement();  
		rs = stmt.executeQuery(sql);  
		int shu = 0;
		if(rs.next()){
			shu = rs.getInt("totalCount");
		}
		if(shu>0){
			//设置登录cookie
			
			out.println("<script language='JavaScript' >alert('成功登录！');window.parent.location='main.jsp';</script>");
		}else{
			out.println("<script language='JavaScript' >alert('用户不存在或者密码错误！');</script>");
		}
	}

%>  

</body>
</html>