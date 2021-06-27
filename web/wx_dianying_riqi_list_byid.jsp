<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%--dianying/dingzuo.js 根据电影的id，获取排片的日期 列表--%>
<%@ include file="conn.jsp"%>
[
<%
    //要获取评论的电影id
    int sp_id=0;
    sp_id =Integer.parseInt(request.getParameter("sp_id"));

    //读取数量
    Statement stmt_shuliang = null;
    ResultSet rs_shuliang = null;
    String sql_shuliang = "";
    sql_shuliang = sql_shuliang + "select  count(*) totalCount from shipin_mulu " ;  //查询语句
    sql_shuliang = sql_shuliang + " where  up_id=0 and tushu_id=" + sp_id ;
    stmt_shuliang = conn.createStatement();
    rs_shuliang = stmt_shuliang.executeQuery(sql_shuliang);
    int shuliang = 0;
    if(rs_shuliang.next()){
        shuliang = rs_shuliang.getInt("totalCount");
    }
    //out.println("数量："+shuliang+"<br>");

    Statement stmt = null;
    ResultSet rs = null;
    String sql ="select * from shipin_mulu  where   up_id=0 and tushu_id=" + sp_id +" order by id desc" ;  //查询语句
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    int riqi_id = 0;
    String xinxi_riqi = "";

    int xuhao = 0;
    while (rs.next()) {
        xuhao = xuhao + 1;

        riqi_id = rs.getInt("id");
        xinxi_riqi = rs.getString("xinxi_riqi");

%>

{
"riqi_id" : <%=riqi_id%>,
"xinxi_riqi" : "<%=xinxi_riqi%>"
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