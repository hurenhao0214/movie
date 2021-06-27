<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%--huiyuan_yuyue_list  获取远程数据--%>
<%@ include file="conn.jsp"%>
[
<%
    //要获取评论的电影id
    int u_id=0;
    u_id =Integer.parseInt(request.getParameter("u_id"));

    //读取数量
    Statement stmt_shuliang = null;
    ResultSet rs_shuliang = null;
    String sql_shuliang = "";
    sql_shuliang = sql_shuliang + "select  count(*) totalCount from shipin_dingdan " ;  //查询语句
    sql_shuliang = sql_shuliang + " where  u_id=" + u_id ;
    stmt_shuliang = conn.createStatement();
    rs_shuliang = stmt_shuliang.executeQuery(sql_shuliang);
    int shuliang = 0;
    if(rs_shuliang.next()){
        shuliang = rs_shuliang.getInt("totalCount");
    }
    //out.println("数量："+shuliang+"<br>");

    Statement stmt = null;
    ResultSet rs = null;
    String sql ="select * from shipin_dingdan where  u_id=" + u_id + " order by id desc" ;  //查询语句
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    int yuyue_id =0;
    int dianying_id = 0;
    String dianying_mc = "";
    String yuyue_riqi = "";
    int yuyue_riqiid = 0;
    String yuyue_changci = "";
    int yuyue_changciid = 0;
    String yuyue_zuoweis = "";
    int yuyue_piaoshu = 0;
    int yuyue_feiyong = 0;
    int zt = 0;

    int xuhao = 0;
    while (rs.next()) {
        xuhao = xuhao + 1;

        yuyue_id = rs.getInt("id");
        dianying_id = rs.getInt("dianying_id");
        dianying_mc = rs.getString("dianying_mc");
        yuyue_riqi = rs.getString("yuyue_riqi");
        yuyue_riqiid = rs.getInt("yuyue_riqiid");
        yuyue_changci = rs.getString("yuyue_changci");
        yuyue_changciid = rs.getInt("yuyue_changciid");
        yuyue_zuoweis = rs.getString("yuyue_zuoweis");
        yuyue_piaoshu = rs.getInt("yuyue_piaoshu");
        yuyue_feiyong = rs.getInt("yuyue_feiyong");
        zt = rs.getInt("zt");

        //对座位信息进行显示处理
        int jipai = 0; //第几排
        int jizuo = 0; //第几座
        String jieguo = "";
        //每排座位10个；如果序号是25就是第3排第5个座位
        if(yuyue_zuoweis.indexOf(",")!=-1){ //多个座位
            String arr[] = yuyue_zuoweis.split(","); //拆分数组
            //循环显示
            for(int x = 0; x<arr.length; x++){
                jipai = Integer.parseInt(arr[x]) /10 +1;
                jizuo = Integer.parseInt(arr[x])%10 + 1;

                jieguo = jieguo + jipai + "排，" + jizuo + "座 | ";
            }
            yuyue_zuoweis = jieguo;

        }else{ //单个座位
            jipai = Integer.parseInt(yuyue_zuoweis) /10 +1;
            jizuo = Integer.parseInt(yuyue_zuoweis)%10 + 1;
            jieguo = jieguo + jipai + "排，" + jizuo + "座 | ";
            yuyue_zuoweis = jieguo;
        }
%>

{
"yuyue_id" : <%=yuyue_id%>,
"u_id" : <%=u_id%>,
"dianying_id" : <%=dianying_id%>,
"dianying_mc" : "<%=dianying_mc%>",
"yuyue_riqi" : "<%=yuyue_riqi%>",
"yuyue_riqiid" : <%=yuyue_riqiid%>,
"yuyue_changci" : "<%=yuyue_changci%>",
"yuyue_changciid" : <%=yuyue_changciid%>,
"yuyue_zuoweis" : "<%=yuyue_zuoweis%>",
"yuyue_piaoshu" : <%=yuyue_piaoshu%>,
"yuyue_feiyong" : <%=yuyue_feiyong%>,
"zt" : <%=zt%>
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