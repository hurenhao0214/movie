<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

[
<%
    int user_id = 0;
    String  jieguo_xinxi = "";

    int sc_id = 0;
    int dy_id = 0;
    String dy_mc = "";
    String add_date = "";

    if(request.getParameter("uid")=="" || request.getParameter("uid")==null){
        jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
        //out.println(jieguo_xinxi);
    }else{
        user_id = Integer.parseInt(request.getParameter("uid"));

        //读取数量
        Statement stmt_shuliang = null;
        ResultSet rs_shuliang = null;
        String sql_shuliang = "";
        sql_shuliang = sql_shuliang + "select  count(*) totalCount from shipin_shoucang " ;  //查询语句
        sql_shuliang = sql_shuliang + " where u_id=" + user_id ;
        stmt_shuliang = conn.createStatement();
        rs_shuliang = stmt_shuliang.executeQuery(sql_shuliang);
        int shuliang = 0;
        if(rs_shuliang.next()){
            shuliang = rs_shuliang.getInt("totalCount");
        }
        //out.println("数量："+shuliang+"<br>");


        Statement stmt = null;
        ResultSet rs = null;
        String sql ="select  * from shipin_shoucang where u_id="+user_id+" order by id desc";  //查询语句
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        int shoucang_cpid = 0;
        int shoucang_id = 0;
        String shoucang_riqi = "";
        int xuhao= 0;

        while (rs.next()) {
            xuhao = xuhao +1;

            sc_id = rs.getInt("id");
            dy_id = rs.getInt("dianying_id");
            dy_mc = rs.getString("dianying_mc");
            add_date = rs.getString("riqi");

            //读取详细信息
            String xinxi_biaoti = "";
            String xinxi_tupian = "";

            //读取要修改的信息
            Statement stmt_0 = null;
            ResultSet rs_0 = null;
            String sql_0 ="select * from shipin where id="+dy_id;  //查询语句
            stmt_0 = conn.createStatement();
            rs_0 = stmt_0.executeQuery(sql_0);
            while (rs_0.next()) {
                xinxi_biaoti = rs_0.getString("xinxi_biaoti");
                xinxi_tupian = rs_0.getString("xinxi_tupian");
            }
%>

{
"sc_id" : <%=sc_id%>,
"add_date" : "<%=add_date%>",
"kc_id" : <%=dy_id%>,
"kc_mc" : "<%=dy_mc%>",
"kc_tupian" : "<%=web_dizhi2 %>/<%=xinxi_tupian%>"
}

<%
    if(xuhao==shuliang){}
    else{
        out.println(",");
    }
%>

<%
        }
    } //是否传入正确参数

%>
]
<% conn.close(); %>