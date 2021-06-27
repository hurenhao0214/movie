<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
<%--huiyuan_yuyue_list 电影订单付款--%>
<%
    int uid= 0;   //用户id
    int yyid = 0; //预约id

    //时间
    java.util.Date Dates = new java.util.Date();
    out.println("原始时间："+Dates+"<br>");
    SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
    SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
    String mydate1 = ft1.format(Dates);  //转成指定格式的字符串
    String mydate2 = ft2.format(Dates);  //转成指定格式的字符串
    //out.println("转成日期字符串："+mydate1+"<br>");
    //out.println("转成时间字符串："+mydate2+"<br>");
    //java.util.Date mydate2 = ft.parse(mydate1);
    //out.println("转成时间类型："+mydate2+"<br>");

    String jieguo_xinxi ="";
    if(request.getParameter("uid")=="" || request.getParameter("uid")==null)
    {
        jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
    }else{

        uid = Integer.parseInt(request.getParameter("uid"));
        yyid = Integer.parseInt(request.getParameter("yyid"));

        //付款更新zt=2
        String sql_Update="update shipin_dingdan set zt=2,shijian_fukuan=? where id=? and u_id=?";
        PreparedStatement pstmt2=conn.prepareStatement(sql_Update);
        pstmt2.setString(1,mydate2);
        pstmt2.setInt(2,yyid);
        pstmt2.setInt(3,uid);
        int n=pstmt2.executeUpdate();

        jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"付款成功\",\"uid\":\"0\"}";
    }
    conn.close();
%>