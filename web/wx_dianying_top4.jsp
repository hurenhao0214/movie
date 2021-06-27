<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
[
<%
    //首页展示前四部电影
    Statement stmt_sp1 = null;
    ResultSet rs_sp1 = null;
    String sql_sp1 ="select  * from shipin   order by id desc limit 4";  //查询语句
    stmt_sp1 = conn.createStatement();
    rs_sp1 = stmt_sp1.executeQuery(sql_sp1);

    int id = 0;
    String xinxi_biaoti = "";
    String xinxi_jianjie = "";
    String xinxi_tupian = "";
    int sp_jiage = 0;

    // 循环
    int xuhao  = 0;
    while (rs_sp1.next()) {
        xuhao  = xuhao + 1;
        id = rs_sp1.getInt("id");
        xinxi_biaoti =rs_sp1.getString("xinxi_biaoti");
        xinxi_jianjie =rs_sp1.getString("xinxi_jianjie");
        xinxi_tupian =rs_sp1.getString("xinxi_tupian");
        sp_jiage = rs_sp1.getInt("sp_jiage");
%>
<%--生成对象，生成数组--%>
{
"sp_id" : <%=id%>,
"sp_mc" : "<%=xinxi_biaoti%>",
"sp_jianjie" : "<%=xinxi_jianjie%>",
"sp_tupian" : "<%=web_dizhi2 %>/<%=xinxi_tupian%>",
"sp_jiage" : <%=sp_jiage%>
}
<%
    if(xuhao==4){}
    else{
        out.println(",");
    }
%>
<%
    }
%>
]
<% conn.close(); %>
