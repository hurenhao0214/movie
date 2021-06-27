<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%--dianying/dingzuo.js 选择订单座位--%>
<%@ include file="conn.jsp"%>

<%
    //时间
    java.util.Date Dates = new java.util.Date();
    //out.println("原始时间："+Dates+"<br>");
    SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
    SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
    String mydate1 = ft1.format(Dates);  //转成指定格式的字符串
    String mydate2 = ft2.format(Dates);  //转成指定格式的字符串


    int u_id = 0;
    int dianying_id = 0;
    String dianying_mc = "";
    String yuyue_riqi = "";
    int yuyue_riqiid = 0;
    String yuyue_changci = "";
    int yuyue_changciid = 0;
    String yuyue_zuoweis = "";
    int yuyue_piaoshu = 0;
    int yuyue_feiyong = 0;

    dianying_mc = request.getParameter("dianying_mc");
    yuyue_riqi = request.getParameter("yuyue_riqi");
    yuyue_changci = request.getParameter("yuyue_changci");
    yuyue_zuoweis = request.getParameter("yuyue_zuoweis");

    u_id = Integer.parseInt( request.getParameter("u_id"));
    dianying_id = Integer.parseInt( request.getParameter("dianying_id"));
    yuyue_riqiid = Integer.parseInt( request.getParameter("yuyue_riqiid"));
    yuyue_changciid = Integer.parseInt( request.getParameter("yuyue_changciid"));
    yuyue_piaoshu = Integer.parseInt( request.getParameter("yuyue_piaoshu"));
    yuyue_feiyong = Integer.parseInt( request.getParameter("yuyue_feiyong"));

    String  jieguo_xinxi = "";

    if(request.getParameter("u_id")=="" || request.getParameter("u_id")==null){
        jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
    }else{
        String sql_insert = "";
        sql_insert= sql_insert + "insert into shipin_dingdan(u_id,dianying_id,dianying_mc,yuyue_riqi,yuyue_riqiid,yuyue_changci,yuyue_changciid"; //7
        sql_insert= sql_insert + ",yuyue_zuoweis,yuyue_piaoshu,yuyue_feiyong,riqi,shijian,zt"; //6
        sql_insert= sql_insert + ") values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement pstmt=conn.prepareStatement(sql_insert);
        pstmt.setInt(1,u_id);
        pstmt.setInt(2,dianying_id);
        pstmt.setString(3,dianying_mc);
        pstmt.setString(4,yuyue_riqi);
        pstmt.setInt(5,yuyue_riqiid);
        pstmt.setString(6,yuyue_changci);
        pstmt.setInt(7,yuyue_changciid);

        pstmt.setString(8,yuyue_zuoweis);
        pstmt.setInt(9,yuyue_piaoshu);
        pstmt.setInt(10,yuyue_feiyong);
        pstmt.setString(11,mydate1);
        pstmt.setString(12,mydate2);
        pstmt.setInt(13,1);

        pstmt.executeUpdate();
        jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"预约成功\",\"uid\":\"0\"}";

        pstmt.close();
        conn.close();
    }


    out.println(jieguo_xinxi);
%>
<% conn.close(); %>