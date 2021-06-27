<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
<%--xinxi/list--%>
[
<%
    //初始化设置
    int PAGESIZE = 12;  //每页的数据条数  //一页放5个
    int pageCount = 0; //总的页数
    int curPage = 1;   //当前页数
    int shang=0;  //初始化上页数字
    int xia = 0;  //初始化下页数字
    int size = 0;  //总数据初始化

    //int cs_lxid= Integer.parseInt(request.getParameter("cs_lxid"));
    String cs_lxid = request.getParameter("cs_lxid");
    String sql = "";

    try{
        if(cs_lxid=="" || cs_lxid=="0" || cs_lxid ==null){
            sql = "SELECT * FROM zixun order by id desc";
        }else{
            sql = "SELECT * FROM zixun where xinxi_lxid1=" + Integer.parseInt(cs_lxid) + " order by id desc  ";
        }
        //out.print(sql);

        PreparedStatement stat = conn.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stat.executeQuery();
        rs.last(); //移动到最后一条数据
        size = rs.getRow(); //获得总的数据条数
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1); //获得页数
        String tmp = request.getParameter("curPage");
        if(tmp==null){
            tmp="1";
        }
        curPage = Integer.parseInt(tmp);
        if(curPage>=pageCount) curPage = pageCount;
        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);
        //out.println(curPage);//输出到屏幕上
        int count = 0;

        do{
            if(count>=PAGESIZE)break;
            int zxid = rs.getInt("id");
            int xinxi_lxid1 = rs.getInt("xinxi_lxid1");
            int xinxi_lxid2 = rs.getInt("xinxi_lxid2");

            String xinxi_biaoti = rs.getString("xinxi_biaoti");
            String xinxi_riqi = rs.getString("xinxi_riqi");

            int xinxi_jianjie_yn = rs.getInt("xinxi_jianjie_yn");
            String xinxi_jianjie = rs.getString("xinxi_jianjie");

            int xinxi_tupian_yn = rs.getInt("xinxi_tupian_yn");
            String xinxi_tupian = rs.getString("xinxi_tupian");

            String xinxi_neirong = rs.getString("xinxi_neirong");

            count++;

            //读取1级菜单名称
            Statement stmt_fz = null;
            ResultSet rs_fz = null;
            String sql_fz ="select * from zixun_fenlei where id=" + xinxi_lxid1;  //查询语句
            stmt_fz = conn.createStatement();
            rs_fz = stmt_fz.executeQuery(sql_fz);
            while (rs_fz.next()) {
                //out.println( rs_fz.getString("caidan_mingcheng") ); //将数据库表格查询结果输出
            }
            //读取2级菜单名称
            if(xinxi_lxid2>0){
                Statement stmt_fz2 = null;
                ResultSet rs_fz2 = null;
                String sql_fz2 ="select * from zixun_fenlei where id=" + xinxi_lxid2;  //查询语句
                stmt_fz2 = conn.createStatement();
                rs_fz2 = stmt_fz2.executeQuery(sql_fz2);
                while (rs_fz2.next()) {
                    //out.println(" > "+rs_fz2.getString("caidan_mingcheng")); //将数据库表格查询结果输出
                }
            }


%>

{
"myid":<%=zxid%>,
"mybiaoti":"<%=xinxi_biaoti%>",
"myshijian":"<%=xinxi_riqi%>",
"yeshu" :<%=pageCount%>,
"curPage":<%=curPage%>,
"size": <%=size%>,
"count": <%=count%>
}
<%
    if(curPage < pageCount){
        if(count == PAGESIZE){
        }else{
            out.print(",");
        }
    }else{
        // 计算最后一页的数量
        int zuihoushu = size % PAGESIZE;
        if(zuihoushu==0){
            if(count==PAGESIZE){
            }else{
                out.print(",");
            }
        }else {
            if(count==zuihoushu){
            }else{
                out.print(",");
            }
        }
    }
%>

<%

        }while(rs.next());
        conn.close();
    }
    catch(Exception e){

    }

%>
]

