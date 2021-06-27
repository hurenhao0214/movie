<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
<%--dianying/xiangqing.js 获取视频信息--%>
<%

    //解决乱码问题
    request.setCharacterEncoding("UTF-8");

    int sp_id = Integer.parseInt(request.getParameter("sp_id"));
    //读取产品信息

    String mingcheng = "";

    int id = 0;
    int sp_jiage = 0;

    int diqu_lxid = 0;
    int leixing_lxid = 0;
    int niandai_lxid = 0;

    String diqu="";
    String leixing="";
    String niandai ="";

    int shichang = 0;

    String xinxi_biaoti = "";
    String xinxi_jianjie = "";
    String xinxi_riqi = "";
    String xinxi_neirong = "";
    String xinxi_tupian = "";

     //读取信息
    Statement stmt_0 = null;
    ResultSet rs_0 = null;
    String sql_0 ="select * from shipin where id="+sp_id;  //查询语句
    stmt_0 = conn.createStatement();
    rs_0 = stmt_0.executeQuery(sql_0);
    while (rs_0.next()) {

        id = rs_0.getInt("id");
        sp_jiage = rs_0.getInt("sp_jiage");
        diqu_lxid = rs_0.getInt("diqu_lxid");
        leixing_lxid = rs_0.getInt("leixing_lxid");
        niandai_lxid = rs_0.getInt("niandai_lxid");
        shichang = rs_0.getInt("shichang");

        xinxi_biaoti = rs_0.getString("xinxi_biaoti");
        xinxi_jianjie = rs_0.getString("xinxi_jianjie");
        xinxi_riqi = rs_0.getString("xinxi_riqi");
        xinxi_neirong = rs_0.getString("xinxi_neirong");
        xinxi_tupian = rs_0.getString("xinxi_tupian");
    }

    //读取分类信息 类型
    Statement stmt_fz = null;
    ResultSet rs_fz = null;
    String sql_fz ="select * from dianying_fenlei where id=" + leixing_lxid;  //查询语句
    stmt_fz = conn.createStatement();
    rs_fz = stmt_fz.executeQuery(sql_fz);
    if (rs_fz.next()) {
        leixing = rs_fz.getString("caidan_mingcheng");
    }
    //读取分类信息 地区
    sql_fz ="select * from dianying_fenlei where id=" + diqu_lxid;  //查询语句
    rs_fz = stmt_fz.executeQuery(sql_fz);
    if (rs_fz.next()) {
        diqu = rs_fz.getString("caidan_mingcheng");
    }
    //读取分类信息 年代
    sql_fz ="select * from dianying_fenlei where id=" + niandai_lxid;  //查询语句
    rs_fz = stmt_fz.executeQuery(sql_fz);
    if (rs_fz.next()) {
        niandai = rs_fz.getString("caidan_mingcheng");
    }

    //如果传入用户的id，判断用户是否购买
    String  sp_goumai = "n";
    Statement stmt_goumai = null;
    ResultSet rs_goumai = null;
    String sql_goumai ="select  * from  shipin_dingdan where dianying_id=" + sp_id;  //查询语句
    stmt_goumai = conn.createStatement();
    rs_goumai = stmt_goumai.executeQuery(sql_goumai);
    if (rs_goumai.next()) {
        sp_goumai = "y";
    }else{

    }
%>

{
"sp_id" : <%=sp_id%>,
"sp_mc" : "<%=xinxi_biaoti%>",
"sp_jianjie" : "<%=xinxi_jianjie%>",
"xinxi_riqi" : "<%=xinxi_riqi%>",
"sp_tupian" : "<%=web_dizhi2 %>/<%=xinxi_tupian%>",
"sp_jiage" : <%=sp_jiage%>,
"sp_goumai" : "<%=sp_goumai%>",
"shichang" : <%=shichang%>,
"diqu" : "<%=diqu%>",
"niandai" : "<%=niandai%>",
"leixing" : "<%=leixing%>"
}
<% conn.close(); %>