<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>


<%


String wz1 = "";
String tpdz1 = "";
String ljdz1 = "";

String wz2 = "";
String tpdz2 = "";
String ljdz2 = "";

String wz3 = "";
String tpdz3 = "";
String ljdz3 = "";

String wz4 = "";
String tpdz4 = "";
String ljdz4 = "";

//读取要修改的信息
Statement stmt_0 = null;  
ResultSet rs_0 = null;  
String sql_0 ="select * from guanggao where id=2";  //查询语句
stmt_0 = conn.createStatement();  
rs_0 = stmt_0.executeQuery(sql_0);  
while (rs_0.next()) {  
	wz1 = rs_0.getString("wz1");
	tpdz1 = rs_0.getString("tpdz1");
	ljdz1 = rs_0.getString("ljdz1");

	wz2 = rs_0.getString("wz2");
	tpdz2 = rs_0.getString("tpdz2");
	ljdz2 = rs_0.getString("ljdz2");
	
	wz3 = rs_0.getString("wz3");
	tpdz3 = rs_0.getString("tpdz3");
	ljdz3 = rs_0.getString("ljdz3");
	
	wz4 = rs_0.getString("wz4");
	tpdz4 = rs_0.getString("tpdz4");
	ljdz4 = rs_0.getString("ljdz4");	
}  	
%>
[
{"tupian":"<%=web_dizhi2 %>/<%=tpdz1%>","dizhi":"<%=ljdz1%>"},
{"tupian":"<%=web_dizhi2 %>/<%=tpdz2%>","dizhi":"<%=ljdz2%>"},
{"tupian":"<%=web_dizhi2 %>/<%=tpdz3%>","dizhi":"<%=ljdz3%>"},
{"tupian":"<%=web_dizhi2 %>/<%=tpdz4%>","dizhi":"<%=ljdz4%>"}
]
<% conn.close(); %>

