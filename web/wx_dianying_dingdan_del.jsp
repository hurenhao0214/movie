<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%--huiyuan_yuyue_list 电影订单删除--%>
<%@ include file="conn.jsp"%>

<%
    int uid= 0;   //用户id
    int yyid = 0; //预约id
    String  jieguo_xinxi = "";

    if(request.getParameter("uid")=="" || request.getParameter("uid")==null)
    {
        jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
    }else{
        uid = Integer.parseInt(request.getParameter("uid"));
        yyid = Integer.parseInt(request.getParameter("yyid"));

        String sql_insert="delete from shipin_dingdan where u_id=? and id=?";
        PreparedStatement pstmt=conn.prepareStatement(sql_insert);
        pstmt.setInt(1,uid);
        pstmt.setInt(2,yyid);
        int n=pstmt.executeUpdate();

        jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"删除成功\",\"uid\":\"0\"}";
    }

    out.println(jieguo_xinxi);
    conn.close();
%>