<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*,java.text.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

[
<% 
int user_id = 0;
String  jieguo_xinxi = "";

if(request.getParameter("uid")=="" || request.getParameter("uid")==null){
	jieguo_xinxi = "{\"zt\":\"no\",\"xinxi\":\"参数不正确\",\"uid\":\"0\"}";
	//out.println(jieguo_xinxi);
}else{
	user_id = Integer.parseInt(request.getParameter("uid"));
	
	//读取数量
	Statement stmt_shuliang = null;  
	ResultSet rs_shuliang = null;  
	String sql_shuliang = "";
	sql_shuliang = sql_shuliang + "select  count(*) totalCount from huiyuan_shoucang " ;  //查询语句 
	sql_shuliang = sql_shuliang + " where u_id=" + user_id ;
	stmt_shuliang = conn.createStatement();  
	rs_shuliang = stmt_shuliang.executeQuery(sql_shuliang);  
	int shuliang = 0;
	if(rs_shuliang.next()){
		shuliang = rs_shuliang.getInt("totalCount");
	}
	//out.println("数量："+shuliang+"<br>");
	
	
	Statement stmt = null;  
	ResultSet rs = null;  
	String sql ="select  * from huiyuan_shoucang where u_id="+user_id+" order by id desc";  //查询语句
	stmt = conn.createStatement();  
	rs = stmt.executeQuery(sql);  
	int shoucang_cpid = 0;
	int shoucang_id = 0;
	String shoucang_riqi = "";
	int xuhao= 0;
	while (rs.next()) {
		xuhao = xuhao +1;
		shoucang_id = rs.getInt("id");
		shoucang_cpid = rs.getInt("cpid");
		shoucang_riqi = rs.getString("riqi");

		//读取产品信息
		String mingcheng = "";

		int lx_id1 = 0;
		int lx_id2 = 0;
		int kucun = 0;
		int yixiaoshou = 0;
		int jiage1 = 0;
		int jiage2 = 0;
		int jiage3 = 0;

		String cp_tupian = "";
		int cp_tupian_yn = 0;
		String cp_tupian1 = "";
		String cp_tupian2 = "";
		String cp_tupian3 = "";
		String cp_tupian4 = "";

		int zhuangtai_yn = 0;
		int tuijian_yn = 0;
		int jianjie_yn = 0;

		String jianjie = "";
		String neirong = "";
		String fabu_riqi = "";
		String add_riqi = "";

		//读取要修改的信息
		Statement stmt_0 = null;  
		ResultSet rs_0 = null;  
		String sql_0 ="select * from shangpin where id="+shoucang_cpid;  //查询语句
		stmt_0 = conn.createStatement();  
		rs_0 = stmt_0.executeQuery(sql_0);  
		while (rs_0.next()) {  
		    mingcheng = rs_0.getString("mingcheng");
		    
		    lx_id1 = rs_0.getInt("lx_id1");
		    lx_id2 = rs_0.getInt("lx_id2");
		    kucun = rs_0.getInt("kucun");
		    yixiaoshou = rs_0.getInt("yixiaoshou");
		    jiage1 = rs_0.getInt("jiage1");
		    jiage2 = rs_0.getInt("jiage2");
		    jiage3 = rs_0.getInt("jiage3");     
		    
		    cp_tupian = rs_0.getString("cp_tupian");
		    cp_tupian_yn = rs_0.getInt("cp_tupian_yn");   
		    cp_tupian1 = rs_0.getString("cp_tupian1");
		    cp_tupian2 = rs_0.getString("cp_tupian2");
		    cp_tupian3 = rs_0.getString("cp_tupian3");
		    cp_tupian4 = rs_0.getString("cp_tupian4");
		    
		    zhuangtai_yn = rs_0.getInt("zhuangtai_yn");
		    tuijian_yn = rs_0.getInt("tuijian_yn");
		    jianjie_yn = rs_0.getInt("jianjie_yn");
		    
		    jianjie = rs_0.getString("jianjie");
		    neirong = rs_0.getString("neirong");
		    fabu_riqi = rs_0.getString("fabu_riqi");
		    
		    //neirong = htmlspecialchars(neirong);
		}  	
%>

        {
        "sc_id" : "<%=shoucang_id%>",
        "add_date" : "<%=shoucang_riqi%>",
        "cp_mingcheng" : "<%=mingcheng%>",
        "cp_tupian" : "<%=web_dizhi2 %>/<%=cp_tupian%>",
        "cp_kucu" : "<%=kucun%>",
        "xiangou_shuliang" : "<%=yixiaoshou%>",
        "jiage" : "<%=jiage1%>"
        }
	    <% 
	    if(xuhao==shuliang){}
	    else{
	    	out.println(",");
	    }
	    %>	

<%		
	} 
} //是否传入正确参数

%>
]
<% conn.close(); %>