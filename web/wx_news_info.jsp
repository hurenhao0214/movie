<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ include file="conn.jsp"%>
<%--xinxi/xiangqing--%>

<% 
//解决乱码问题
//request.setCharacterEncoding("UTF-8"); 
int cs_xinxi_id= Integer.parseInt(request.getParameter("cs_xxid"));

//初始化变量
int xinxi_lxid1 = 0; //1级类型
int xinxi_lxid2 = 0; //2级类型

String xinxi_biaoti = ""; //标题
String xinxi_riqi ="";  //日期

int xinxi_jianjie_yn = 0;  //是否有简介，0无，1有
String xinxi_jianjie = ""; //简介内容

int xinxi_tupian_yn = 0;  //是否有缩略图，0无，1有
String xinxi_tupian = "";  //缩略图 

String xinxi_neirong = "";  //内容

//读取要修改的信息
Statement stmt_0 = null;  
ResultSet rs_0 = null;  
String sql_0 ="select * from zixun where id="+cs_xinxi_id;  //查询语句
stmt_0 = conn.createStatement();  
rs_0 = stmt_0.executeQuery(sql_0);  
while (rs_0.next()) {  
	xinxi_lxid1 = rs_0.getInt("xinxi_lxid1");
	xinxi_lxid2 = rs_0.getInt("xinxi_lxid2");
	xinxi_biaoti = rs_0.getString("xinxi_biaoti");
	xinxi_riqi = rs_0.getString("xinxi_riqi");
	xinxi_biaoti = rs_0.getString("xinxi_biaoti");
	xinxi_jianjie_yn = rs_0.getInt("xinxi_jianjie_yn");
	xinxi_jianjie = rs_0.getString("xinxi_jianjie");
	xinxi_tupian_yn = rs_0.getInt("xinxi_tupian_yn");
	xinxi_tupian = rs_0.getString("xinxi_tupian");		
	xinxi_neirong = rs_0.getString("xinxi_neirong");	
}  	
xinxi_neirong = xinxi_neirong.replaceAll("\"", "'");
xinxi_neirong = xinxi_neirong.replaceAll("<img src='", "<img width='100%' src='"+web_dizhi);
xinxi_neirong = xinxi_neirong.replaceAll("\n", "");  //替换textarea隐藏的换行符
xinxi_neirong = xinxi_neirong.replaceAll("\t", "");  //替换textarea隐藏的换行符
xinxi_neirong = xinxi_neirong.replaceAll("\r", "");  //替换textarea隐藏的换行符
xinxi_neirong = xinxi_neirong.replaceAll("vbCrLf", "");
    //关闭
    stmt_0.close();
	//pstmt_0.close();
	conn.close();
%>
{
"biaoti":"<%=xinxi_biaoti%>",
"neirong":"<%=xinxi_neirong%>"
}

<% conn.close(); %>
