<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ page import="java.net.*" %><%@ page import="com.mysql.jdbc.Driver" %><%@ page import="java.sql.*"%><%@ page import="java.io.*,java.util.*" %><%@ include file="conn.jsp"%><%  
    //获取会员分类
    //解决乱码问题
request.setCharacterEncoding("UTF-8");
int cs_flid = Integer.parseInt(request.getParameter("cs_flid"));
Statement stmt_fz = null;
ResultSet rs_fz = null;
String sql_fz ="select * from huiyuan_fenlei where paixu_id=" + cs_flid;  //查询语句
stmt_fz = conn.createStatement();
rs_fz = stmt_fz.executeQuery(sql_fz);
while (rs_fz.next()) {  
out.print(rs_fz.getString("caidan_mingcheng") ); //将数据库表格查询结果输出   
}  	   
%>  
<% conn.close(); %>