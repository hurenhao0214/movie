<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>


<%
int ddid= 0;
int gwc_id = 0;
int cpid = 0;
int user_id = 0;
int xx = 0;
String pinlun_neirong = "";
int cs_niming = 0;

String  jieguo_xinxi = "";

//时间
java.util.Date Dates = new java.util.Date();
//out.println("原始时间："+Dates+"<br>"); 
SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
String mydate1 = ft1.format(Dates);  //转成指定格式的字符串 
String mydate2 = ft2.format(Dates);  //转成指定格式的字符串	

if(request.getParameter("user_id")=="" || request.getParameter("user_id")==null)
{
	jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
}else{
	
	ddid = Integer.parseInt(request.getParameter("ddid"));
	cpid = Integer.parseInt(request.getParameter("cpid"));
	user_id = Integer.parseInt(request.getParameter("user_id"));
	xx = Integer.parseInt(request.getParameter("xx"));
	pinlun_neirong = request.getParameter("pinlun_neirong");
	cs_niming = Integer.parseInt(request.getParameter("cs_niming"));
	gwc_id = Integer.parseInt(request.getParameter("gwc_id"));
	
	Statement stmt = null;  
	ResultSet rs = null;  
	String sql = "";
	sql = sql + "select  *  from huiyuan_pingjia " ;  //查询语句 
	sql = sql + " where  danhao=" + ddid + " and cpid=" + cpid ;
	sql = sql + " and u_id=" + user_id;
	stmt = conn.createStatement();  
	rs = stmt.executeQuery(sql);  
	if (rs.next()) {  
		//out.println("<script language='JavaScript' >alert('已经评论过该电影！');</script>");
		jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"已经评论过该电影\",\"uid\":\"0\"}";
	}else{
		 
		//out.println(" | yes<br>");
	   String sql_insert = "";
	   sql_insert=sql_insert + "Insert into huiyuan_pingjia(danhao,cpid,u_id,xing,neirong,niming"; //6
	   sql_insert=sql_insert + ",riqi,shijian)"; //2
	   sql_insert=sql_insert + "  values(?,?,?,?,?,?,?,?)";
	   PreparedStatement pstmt=conn.prepareStatement(sql_insert);
	   pstmt.setInt(1,ddid);
	   pstmt.setInt(2,cpid);
	   pstmt.setInt(3,user_id);
	   pstmt.setInt(4,xx);
	   pstmt.setString(5,pinlun_neirong);
	   pstmt.setInt(6,cs_niming);
	   
	   pstmt.setString(7,mydate1);
	   pstmt.setString(8,mydate2);
	   //pstmt.setString(4,mydate1);
	  
	   int n=pstmt.executeUpdate();

	 	 String sql_Update="update gouwuche set pinglun_yn='是'  where id="+gwc_id;
		 PreparedStatement pstmt2=conn.prepareStatement(sql_Update);
		 pstmt2.executeUpdate();
		   
	   jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"评论成功\",\"uid\":\"0\"}";
	}
}

out.println(jieguo_xinxi);
conn.close();

%>