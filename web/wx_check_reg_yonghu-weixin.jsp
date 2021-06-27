<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

<% 
String wx_openid = request.getParameter("wx_openid");
String wx_nicheng = request.getParameter("wx_nicheng");
String wx_touxiang = request.getParameter("wx_touxiang");

String jieguo_xinxi = ""; //返回信息，初始化


if(wx_openid=="" || wx_openid==null){
	//{"zt":"no","xinxi":"输入不正确","uid":"0"}  //返回样本   
	//jieguo_xinxi = "{'zt':'no','xinxi':'输入不正确','uid':0'}";  //不能用单号，不然小程序取不到数据
	jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"输入不正确\",\"uid\":\"0\"}";
}else{
	Statement stmt = null;  
	ResultSet rs = null;  
	String sql = "";
	sql = sql + "select  *  from huiyuan " ;  //查询语句 
	sql = sql + " where wx_openid='" + wx_openid + "'";
	//sql = sql + " and mima='" + mm + "'";
	stmt = conn.createStatement();  
	rs = stmt.executeQuery(sql);  
	int fl_id =1;
	int uid;
	if (rs.next()) {  //账号已经注册
		fl_id = rs.getInt("fl_id");
		uid = rs.getInt("id");
		//jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"该账号已经注册\",\"uid\":\"0\"}";	
		jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"该账号已经注册\",\"fl_id\":"+fl_id+",\"uid\":"+uid+"}";		
	}else{
		//可以注册，写入注册的用户信息
		
	   //时间
	   java.util.Date Dates = new java.util.Date();
	   //out.println("原始时间："+Dates+"<br>"); 
	   SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
	   SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	   String mydate1 = ft1.format(Dates);  //转成指定格式的字符串 
	   String mydate2 = ft2.format(Dates);  //转成指定格式的字符串		
		 
		//out.println(" | yes<br>");
	   String sql_insert="Insert into huiyuan(wx_openid,wx_nicheng,wx_touxiang,fl_id,add_riqi,add_shijian) values(?,?,?,?,?,?)";
	   //要获取自动插入的id，请增加,Statement.RETURN_GENERATED_KEYS
	   PreparedStatement pstmt=conn.prepareStatement(sql_insert,Statement.RETURN_GENERATED_KEYS);
	   pstmt.setString(1,wx_openid);
	   pstmt.setString(2,wx_nicheng);
	   pstmt.setString(3,wx_touxiang);
	   pstmt.setInt(4,1);
	   pstmt.setString(5,mydate1);
	   pstmt.setString(6,mydate2);
	   uid=pstmt.executeUpdate();
	   
		//获取插入的id
		ResultSet rs_new = null; 
		int new_dizhiid = 0;
		rs_new = pstmt.getGeneratedKeys(); //得到插入的记录的id
		if(rs_new.next()){
			uid = rs_new.getInt(1);
		}
	   

		fl_id =1;
	   //jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"登录成功\",\"uid\":\"0\"}";
		jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"该账号已经注册\",\"fl_id\":"+fl_id+",\"uid\":"+uid+"}";	
	}
}

out.println(jieguo_xinxi);
conn.close();
%>