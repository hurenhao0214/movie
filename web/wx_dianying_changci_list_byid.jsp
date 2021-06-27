<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%--dianying/dingzuo.js 根据电影id，排片的日期，获取具体的场次--%>
<%@ include file="conn.jsp"%>
[
<%
    //要获取评论的电影id
    int rqid=0;
    rqid =Integer.parseInt(request.getParameter("rqid"));

    //读取数量
    Statement stmt_shuliang = null;
    ResultSet rs_shuliang = null;
    String sql_shuliang = "";
    sql_shuliang = sql_shuliang + "select  count(*) totalCount from shipin_mulu " ;  //查询语句
    sql_shuliang = sql_shuliang + " where up_id=" + rqid ;
    stmt_shuliang = conn.createStatement();
    rs_shuliang = stmt_shuliang.executeQuery(sql_shuliang);
    int shuliang = 0;
    if(rs_shuliang.next()){
        shuliang = rs_shuliang.getInt("totalCount");
    }
    //out.println("数量："+shuliang+"<br>");

    Statement stmt = null;
    ResultSet rs = null;
    String sql ="select * from shipin_mulu  where up_id=" + rqid +" order by id desc" ;  //查询语句
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    int changci_id = 0;     //场次id
    String changci_mc = ""; //场次名称
    String ting = "";       //几号厅

    int xuhao = 0;
    while (rs.next()) {
        xuhao = xuhao + 1;

        //获取数据库中信息
        changci_id = rs.getInt("id");
        changci_mc = rs.getString("xinxi_biaoti");
        ting = rs.getString("ting");

%>

{
"changci_id" : <%=changci_id%>,
"changci_mc" : "<%=changci_mc%>",
"ting" : "<%=ting%>"
}
<%
    if(xuhao==shuliang){}
    else{
        out.println(",");
    }
%>

<%
    }
%>
]
<% conn.close(); %>