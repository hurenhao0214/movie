<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

 <%  
 //时间
 java.util.Date Dates = new java.util.Date();
 //out.println("原始时间："+Dates+"<br>"); 
 SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
 SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
 String mydate1 = ft1.format(Dates);  //转成指定格式的字符串 
 String mydate2 = ft2.format(Dates);  //转成指定格式的字符串	
 
 String lianxiren = "";
 String shouji = "";
 String youxiang = "";
 String neirong = "";

// 获取传过来的参数，这个参数
 lianxiren = request.getParameter("lianxiren");
 shouji = request.getParameter("shouji");
 youxiang = request.getParameter("youxiang");
 neirong = request.getParameter("neirong");
 
 String  jieguo_xinxi = "";

// 开始判断参数
 if(lianxiren=="" || lianxiren==null){
	 jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
 }else{
//     如果传参数了，就将信息写入数据库，这样在后台就看到了
	   String sql_insert="insert into liuyan(xingming,dianhua,youxiang,zhuti,neirong,riqi,shijian,add_date) values(?,?,?,?,?,?,?,?)";
	   PreparedStatement pstmt=conn.prepareStatement(sql_insert);
	   pstmt.setString(1,lianxiren);
	   pstmt.setString(2,shouji);
	   pstmt.setString(3,youxiang);
	   pstmt.setString(4,"微信小程序留言");
	   pstmt.setString(5,neirong);
	   pstmt.setString(6,mydate1);
	   pstmt.setString(7,mydate2);
	   pstmt.setString(8,mydate1);
	   pstmt.executeUpdate();
	   jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"留言成功\",\"uid\":\"0\"}";

	   pstmt.close();
	   conn.close(); 
 }


	out.println(jieguo_xinxi);
%>  
<% conn.close(); %>