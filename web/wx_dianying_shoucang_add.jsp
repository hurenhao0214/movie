<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>


<%

    //获取参数
    int cs_uid = 0;
    int cs_dyid = 0;
    String cs_dymc = "";

    cs_uid = Integer.parseInt(request.getParameter("cs_uid"));
    cs_dyid = Integer.parseInt(request.getParameter("cs_dyid"));
    cs_dymc = request.getParameter("cs_dymc");

    String jieguo_xinxi = "";

    if(request.getParameter("cs_uid")=="" || request.getParameter("cs_uid")==null){
        jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"请传入参数\",\"uid\":\"0\"}";
    }else{

        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";
        sql = sql + "select  *  from shipin_shoucang " ;  //查询语句
        sql = sql + " where u_id=" + cs_uid ;
        sql = sql + " and dianying_id=" + cs_dyid;
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        if (rs.next()) {  //有数据表示已经收藏
            //out.println("no<br>");
            //out.println("<script language='JavaScript' >alert('已经收藏！');</script>");
            jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"已经收藏\",\"uid\":\"0\"}";
        }else{
            //可以收藏，写入收藏信

            //时间
            java.util.Date Dates = new java.util.Date();
            //out.println("原始时间："+Dates+"<br>");
            SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
            SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
            String mydate1 = ft1.format(Dates);  //转成指定格式的字符串
            String mydate2 = ft2.format(Dates);  //转成指定格式的字符串

            //out.println(" | yes<br>");
            String sql_insert="Insert into shipin_shoucang(u_id,dianying_id,dianying_mc,riqi,shijian) values(?,?,?,?,?)";
            PreparedStatement pstmt=conn.prepareStatement(sql_insert);
            pstmt.setInt(1,cs_uid);
            pstmt.setInt(2,cs_dyid);
            pstmt.setString(3,cs_dymc);
            pstmt.setString(4,mydate1);
            pstmt.setString(5,mydate2);
            int n=pstmt.executeUpdate();

            //out.println("<script language='JavaScript' >alert('收藏成功！');</script>");
            jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"收藏成功\",\"uid\":\"0\"}";
        }
    }

    out.println(jieguo_xinxi);
%>
<% conn.close(); %>