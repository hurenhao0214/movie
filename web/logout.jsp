<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>


<%@ include file="conn.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登出</title>
</head>
<body>
<%
Cookie cookies[] = request.getCookies();
//删除Cookie
for(int i=0;i<cookies.length;i++){
	cookies[i].setMaxAge(0);
	response.addCookie(cookies[i]);
}
out.print("<script language='JavaScript' >alert('成功退出！');window.parent.location='login.jsp';</script>");
%>

</body>
</html>