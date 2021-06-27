<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
<%--dianying/index--%>
[
<%
    //初始化设置
    int PAGESIZE = 6;  //每页的数据条数  //一页放5个
    int pageCount = 0; //总的页数
    int curPage = 1;   //当前页数
    int shang=0;  //初始化上页数字
    int xia = 0;  //初始化下页数字
    int size = 0;  //总数据初始化

    //int cs_lxid= Integer.parseInt(request.getParameter("cs_lxid"));
    String cs_neirong = request.getParameter("cs_neirong");
    String sql = "";

    try{
        if(cs_neirong=="" || cs_neirong ==null){
            sql = "SELECT * FROM shipin order by id desc";
        }else{
            sql = "SELECT * FROM shipin where xinxi_biaoti like '%" + cs_neirong + "%' order by id desc  ";
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

        int id = 0;
        String xinxi_biaoti = "";
        String xinxi_jianjie = "";
        String xinxi_tupian = "";
        int sp_jiage = 0;

        do{
            if(count>=PAGESIZE)break;

            id = rs.getInt("id");
            xinxi_biaoti =rs.getString("xinxi_biaoti");
            xinxi_jianjie =rs.getString("xinxi_jianjie");
            xinxi_tupian =rs.getString("xinxi_tupian");
            sp_jiage = rs.getInt("sp_jiage");

            count++;


%>

{
"sp_id" : <%=id%>,
"sp_mc" : "<%=xinxi_biaoti%>",
"sp_jianjie" : "<%=xinxi_jianjie%>",
"sp_tupian" : "<%=web_dizhi2 %>/<%=xinxi_tupian%>",
"sp_jiage" : <%=sp_jiage%>,
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

