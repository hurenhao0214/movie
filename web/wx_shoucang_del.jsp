<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

<% 
int uid = 0;
int scid = 0;

String  jieguo_xinxi = "";
if(request.getParameter("uid") =="" || request.getParameter("uid") ==null){
	jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
}else{
	
	uid = Integer.parseInt(request.getParameter("uid"));
	scid = Integer.parseInt(request.getParameter("scid"));
	
	String sql_insert="delete from huiyuan_shoucang where id="+scid+" and u_id="+uid;
	PreparedStatement pstmt=conn.prepareStatement(sql_insert);
	//pstmt.setInt(1,2);
	int n=pstmt.executeUpdate();

	jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"删除成功\",\"uid\":\"0\"}";
}
out.println(jieguo_xinxi);
%>
<% conn.close(); %>