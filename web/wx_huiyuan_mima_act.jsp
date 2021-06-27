<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
<%--修改前端用户密码--%>
<%
    String u_id = request.getParameter("cs_uid");
    String mm1 = request.getParameter("cs_pwd1");
    String mm2 = request.getParameter("cs_pwd2");
    //out.println("用户名：" + yhm + "<br>");

    String jieguo_xinxi="";
    if(u_id==null || u_id=="" || mm1==null || mm1==""|| mm2==null || mm2==""){
        jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"输入不正确\",\"uid\":\"0\"}";
    }else{
        //先判断原始密码
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";
        sql = sql + "select  *  from huiyuan " ;  //查询语句
        sql = sql + " where id=" + u_id;
        sql = sql + " and mima='" + mm1 + "'";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        if (rs.next()) {  //原始密码正确，修改新密码
            String sql_Update="Update huiyuan Set mima=? where id=?";
            PreparedStatement pstmt2=conn.prepareStatement(sql_Update);
            pstmt2.setString(1,mm2);
            pstmt2.setInt(2,Integer.parseInt(u_id));
            int n=pstmt2.executeUpdate();
            jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"修改成功\",\"uid\":\"0\"}";
        }else{
            //原始密码错误
            jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"原始密码错误\",\"uid\":\"0\"}";
        }
    }
    out.print(jieguo_xinxi);
%>

