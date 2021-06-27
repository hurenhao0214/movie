<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
<%--dianying/xiangqing.js 获取电影介绍信息--%>
<%

    //解决乱码问题
    request.setCharacterEncoding("UTF-8");

    int sp_id = Integer.parseInt(request.getParameter("sp_id"));
    //读取产品信息

    String sp_neirong = "";

    //读取信息
    Statement stmt_0 = null;
    ResultSet rs_0 = null;
    String sql_0 ="select * from shipin where id="+sp_id;  //查询语句
    stmt_0 = conn.createStatement();
    rs_0 = stmt_0.executeQuery(sql_0);
    if (rs_0.next()) {
        sp_neirong = rs_0.getString("xinxi_neirong");
    }
    out.print(sp_neirong);
%>

<% conn.close(); %>