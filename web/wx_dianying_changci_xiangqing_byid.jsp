<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%--dianying/dingzuo.js 根据具体的场次获取对应的选座情况--%>
<%@ include file="conn.jsp"%>

<%
    //解决乱码问题
    request.setCharacterEncoding("UTF-8");

    //参数：场次id
    int ccid = Integer.parseInt(request.getParameter("ccid"));

    //读取信息
    Statement stmt_0 = null;
    ResultSet rs_0 = null;
    String sql_0 ="select * from shipin_mulu where id="+ccid;  //查询语句
    stmt_0 = conn.createStatement();
    rs_0 = stmt_0.executeQuery(sql_0);

    int changci_id = 0;     //场次id
    String changci_mc = ""; //场次名称
    String ting = "";       //几号厅

    String zuoweis= "";    //该场次id 已经预约的

    if (rs_0.next()) {
        changci_id = rs_0.getInt("id");
        changci_mc = rs_0.getString("xinxi_biaoti");
        ting = rs_0.getString("ting");

        //读取该场次id 已经预约的信息
        Statement stmt_1 = null;
        ResultSet rs_1 = null;
        String sql_1 ="select * from shipin_dingdan where yuyue_changciid="+ccid;  //查询语句
        stmt_1 = conn.createStatement();
        rs_1 = stmt_1.executeQuery(sql_1);
        if(rs_1.next()){
            zuoweis = rs_1.getString("yuyue_zuoweis") + ",";
        }
    }

%>

{
"changci_id" : <%=changci_id%>,
"changci_mc" : "<%=changci_mc%>",
"ting" : "<%=ting%>",
"zuoweis" : "<%=zuoweis%>"
}

<% conn.close(); %>