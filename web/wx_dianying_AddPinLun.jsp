<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
<%--huiyuan_yuyue_list 添加电影评论--%>

<%
    int ddid= 0;  //订单id
    int uid = 0;  //用户id
    int xing = 0; //评价几星
    int dyid = 0; //电影id
    String neirong = "";  //评论内容

    String  jieguo_xinxi = "";

    //时间
    java.util.Date Dates = new java.util.Date();
    //out.println("原始时间："+Dates+"<br>");
    SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
    SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
    String mydate1 = ft1.format(Dates);  //转成指定格式的字符串
    String mydate2 = ft2.format(Dates);  //转成指定格式的字符串

    if(request.getParameter("uid")=="" || request.getParameter("uid")==null)
    {
        jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
    }else{

        ddid = Integer.parseInt(request.getParameter("ddid"));
        uid = Integer.parseInt(request.getParameter("uid"));
        xing = Integer.parseInt(request.getParameter("xing"));
        dyid = Integer.parseInt(request.getParameter("dyid"));
        neirong = request.getParameter("neirong");

        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";
        sql = sql + "select  *  from shipin_pinglun " ;  //查询语句
        sql = sql + " where  dingdan_id=" + ddid ;
        sql = sql + " and u_id=" + uid;
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            //out.println("<script language='JavaScript' >alert('已经评论过该电影！');</script>");
            jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"已经评论\",\"uid\":\"0\"}";
        }else{

            //out.println(" | yes<br>");
            String sql_insert = "";
            sql_insert=sql_insert + "Insert into shipin_pinglun(u_id,dingdan_id"; //2
            sql_insert=sql_insert + ",xing,neiring,dianying_id,riqi,shijian)"; //5
            sql_insert=sql_insert + "  values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt=conn.prepareStatement(sql_insert);
            pstmt.setInt(1,uid);
            pstmt.setInt(2,ddid);
            pstmt.setInt(3,xing);
            pstmt.setString(4,neirong);
            pstmt.setInt(5,dyid);

            pstmt.setString(6,mydate1);
            pstmt.setString(7,mydate2);
            //pstmt.setString(4,mydate1);

            int n=pstmt.executeUpdate();

            //更新电影的评论状态
            String sql_Update="update shipin_dingdan set zt=3  where id="+ddid;
            PreparedStatement pstmt2=conn.prepareStatement(sql_Update);
            pstmt2.executeUpdate();

            jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"评论成功\",\"uid\":\"0\"}";
        }
    }

    out.println(jieguo_xinxi);
    conn.close();

%>