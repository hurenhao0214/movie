<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*,java.text.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

<% 
String yhm = request.getParameter("yhm");
String mm = request.getParameter("mm");
String jieguo_xinxi = ""; //返回信息，初始化

//out.println("用户名：" + yhm + "<br>");
if(yhm==null || yhm=="" || mm==null || mm==""){
	//{"zt":"no","xinxi":"输入不正确","uid":"0"}  //返回样本   
	//jieguo_xinxi = "{'zt':'no','xinxi':'输入不正确','uid':0'}";  //不能用单号，不然小程序取不到数据
	jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"请输入用户名和密码\",\"uid\":\"0\"}";
}else{
	Statement stmt = null;  
	ResultSet rs = null;  
	String sql = "";
	sql = sql + "select  *  from huiyuan " ;  //查询语句 
	sql = sql + " where shouji='" + yhm + "'";
	//sql = sql + " and mima='" + mm + "'";
	stmt = conn.createStatement();  
	rs = stmt.executeQuery(sql);  
	if (rs.next()) {  //账号已经注册
		//out.println("<script language='JavaScript' >alert('该账号已经注册！');</script>");
		jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"该账号已经注册\",\"uid\":\"0\"}";
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
	   String sql_insert="Insert into huiyuan(shouji,mima,fl_id,add_riqi,add_shijian) values(?,?,?,?,?)";
	   //PreparedStatement pstmt=conn.prepareStatement(sql_insert);
	   //要获取自动插入的id，请增加,Statement.RETURN_GENERATED_KEYS
       PreparedStatement pstmt=conn.prepareStatement(sql_insert,Statement.RETURN_GENERATED_KEYS); 
	   pstmt.setString(1,yhm);
	   pstmt.setString(2,mm);
	   pstmt.setInt(3,1);
	   pstmt.setString(4,mydate1);
	   pstmt.setString(5,mydate2);
	   int n=pstmt.executeUpdate();

	    //获取插入的id
		ResultSet rs_new = null; 
		int new_dizhiid = 0;
		rs_new = pstmt.getGeneratedKeys(); //得到插入的记录的id
		if(rs_new.next()){
			new_dizhiid = rs_new.getInt(1);
		}
        
	   jieguo_xinxi = "{\"zt\":\"yes\",\"xinxi\":\"注册成功\",\"uid\":\""+new_dizhiid+"\"}";

	}
}

out.println(jieguo_xinxi);
conn.close();
%>