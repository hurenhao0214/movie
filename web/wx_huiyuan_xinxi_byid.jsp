<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ include file="conn.jsp"%>


<%
    String hy_id  =  "";
    String xingming = "";
    String qq = "";
    String email = "";
    String beizhu = "";

    hy_id = request.getParameter("cs_uid");

    String jieguo = "";

    //判断是否登录
    if(hy_id=="" ||hy_id==null){
        jieguo = "{\"zt\":\"no\",\"xinxi\":\"请传入正确参数\",\"uid\":\"0\"}";
    }else{
        Statement stmt = null;
        ResultSet rs = null;
        String sql ="select * from huiyuan where id="+hy_id;  //查询语句
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            xingming = rs.getString("xingming");
            qq  = rs.getString("qq");
            email = rs.getString("email");
            beizhu = rs.getString("beizhu");
        }
    }
%>
{
"hy_id": "<%=hy_id%>",
"xingming" : "<%=xingming%>",
"qq" : "<%=qq%>",
"email" : "<%=email%>",
"beizhu" : "<%=beizhu%>"
}