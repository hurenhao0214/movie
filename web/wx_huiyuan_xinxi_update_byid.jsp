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
    xingming = request.getParameter("cs_xingming");
    qq = request.getParameter("cs_qq");
    email = request.getParameter("cs_email");
    beizhu = request.getParameter("cs_beizhu");

    String jieguo= "";
    if(hy_id==null ){
        jieguo = "{\"zt\":\"no\",\"xinxi\":\"请传入正确参数\",\"uid\":\"0\"}";
    }else{
        //先判断原始密码

        String sql = "";
        sql = sql + "update huiyuan " ;  //查询语句
        sql = sql + " set xingming='"+xingming+"',qq='"+qq+"'";
        sql = sql + ",email='"+email+"',beizhu='"+beizhu+"'";
        sql = sql + " where id=" + Integer.parseInt(hy_id);

        PreparedStatement pstmt=conn.prepareStatement(sql);
        int n=pstmt.executeUpdate();

        int fl_id =1;
        if(n==1){
            jieguo = "{\"zt\":\"yes\",\"xinxi\":\"更新成功\",\"uid\":\"0\"}";
        }else{
            jieguo = "{\"zt\":\"no\",\"xinxi\":\"更新失败\",\"uid\":\"0\"}";
        }
    }
    out.print(jieguo);
%>


