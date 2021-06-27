<%--权限管理的三级菜单分类--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="../../conn.jsp"%>


<% 
int upid = Integer.parseInt(request.getParameter("bigclassid"));
String myhtml = "";
myhtml = myhtml + "<select name='jb2'  onchange='get_j3(this.value);'>";
myhtml = myhtml + "<option value='0' selected>请选择2级菜单</option>";

Statement stmt = null;  
ResultSet rs = null;  
String sql ="select * from quanxian_caidan where caidan_jibie=2  and caidan_suoshu="+upid;  //查询语句
stmt = conn.createStatement();  
rs = stmt.executeQuery(sql);  
while (rs.next()) {  		
	myhtml = myhtml + "<option  value='"+rs.getInt("id")+"'  >";
	myhtml = myhtml + rs.getString("caidan_mingcheng") + "-" + rs.getInt("id") + "</option>";	
}  	


myhtml = myhtml + "</select>";

out.println(myhtml);

myhtml ="";


%>