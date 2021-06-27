<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%--dianying/xiangqing.js 获取评论信息--%>
<%@ include file="conn.jsp"%>
[
<%
    //要获取评论的电影id
    int dyid=0;
    dyid =Integer.parseInt(request.getParameter("dyid"));

     //读取数量
    Statement stmt_shuliang = null;
    ResultSet rs_shuliang = null;
    String sql_shuliang = "";
    sql_shuliang = sql_shuliang + "select  count(*) totalCount from shipin_pinglun " ;  //查询语句
    sql_shuliang = sql_shuliang + " where dianying_id=" + dyid ;
    stmt_shuliang = conn.createStatement();
    rs_shuliang = stmt_shuliang.executeQuery(sql_shuliang);
    int shuliang = 0;
    if(rs_shuliang.next()){
        shuliang = rs_shuliang.getInt("totalCount");
    }
    //out.println("数量："+shuliang+"<br>");

    Statement stmt = null;
    ResultSet rs = null;
    String sql ="select * from shipin_pinglun  where   dianying_id=" + dyid +" order by id desc" ;  //查询语句
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    int pinglun_id = 0;
    int u_id = 0;
    String riqi = "";
    String xing = "";
    String neiring = "";

    int xuhao = 0;
    while (rs.next()) {
        xuhao = xuhao + 1;

        u_id = rs.getInt("u_id");
        pinglun_id = rs.getInt("id");
        riqi = rs.getString("riqi");
        xing = rs.getString("xing");
        neiring = rs.getString("neiring");

        int hy_lxid=0;
        String touxiang = "";
        Statement stmt_hy = null;
        ResultSet rs_hy = null;
        String sql_hy ="select * from huiyuan where id="+u_id;  //查询语句
        //out.println(sql_hy);
        stmt_hy = conn.createStatement();
        rs_hy = stmt_hy.executeQuery(sql_hy);
        String tmp_yonghu = "";
        if (rs_hy.next()) {

            if(rs_hy.getString("shouji")=="" || rs_hy.getString("shouji")==null){}
            else{
                tmp_yonghu =rs_hy.getString("shouji"); //将数据库表格查询结果输出
                tmp_yonghu = tmp_yonghu.substring(0,8)+"***"; //隐藏最后3个号码
            }
            if(rs_hy.getString("wx_nicheng")=="" || rs_hy.getString("wx_nicheng")==null){}
            else{
                tmp_yonghu = rs_hy.getString("wx_nicheng"); //将数据库表格查询结果输出
            }
        }
%>

{
"pinglun_id" : <%=pinglun_id%>,
"user_name" : "<%=tmp_yonghu%>",
"add_date" : "<%=riqi%>",
"xing" : "<%=xing%>",
"neiring" : "<%=neiring%>"
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