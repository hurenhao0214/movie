<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="../../conn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>

<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[密码修改]</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td  height="250" valign="top">







<%
 	//读取cookie u_id  u_fzid  u_name
    String u_id = "";
    String u_fzid = "";
    String u_name = "";
    Cookie cookie = null;
    Cookie[] cookies = null;
    // 获取 cookies 的数据,是一个数组
    cookies = request.getCookies();
     if(cookies !=null){
          for (int i = 0; i < cookies.length; i++){
             cookie = cookies[i];                       
             //out.print("参数名 : " + cookie.getName());
             //out.print(" | 参数值: " + URLDecoder.decode(cookie.getValue(), "utf-8") +" <br>");
             if(cookie.getName().equals("u_id")){ //  == 判断可能无效
            	 u_id = URLDecoder.decode(cookie.getValue(), "utf-8");
             }
             if(cookie.getName().equals("u_fzid")){ //  == 判断可能无效
            	 u_fzid = URLDecoder.decode(cookie.getValue(), "utf-8");
             }
             if(cookie.getName().equals("u_name")){ //  == 判断可能无效
            	 u_name = URLDecoder.decode(cookie.getValue(), "utf-8");
             }                         
             
          } 
     //out.print("用户id："+u_id+ " | 用户分组id：" + u_fzid + " | 用户名："+u_name);
     }
     
     
     //获取数据
     String mm1 = request.getParameter("mm1");
     String mm2 = request.getParameter("mm2");
     
	Statement stmt = null;  
	ResultSet rs = null;  
	String sql = "";
	sql = sql + "SELECT * FROM quanxian_yonghu where id="+u_id ;  //查询语句 
	sql = sql + " and user_password='" + mm1 + "'";
	//out.print(sql);
	stmt = conn.createStatement();  
	rs = stmt.executeQuery(sql);      
	if (rs.next()) {  
		//更新密码 
		 String sql_Update="Update quanxian_yonghu Set user_password=? where id=?";
		 PreparedStatement pstmt2=conn.prepareStatement(sql_Update);
		 pstmt2.setString(1,mm2);
		 pstmt2.setInt(2,Integer.parseInt(u_id));
		 int n=pstmt2.executeUpdate();
		 out.println("密码修改成功！1秒后返回！");
		 out.println("<meta http-equiv='refresh' content='1;URL=mima.jsp' />");
	}else{
		//原始密码错误
		out.println("<script language='JavaScript' >alert('原始密码错误！');window.location='mima.jsp';</script>");
	}
             
 %>








        
        
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>&nbsp;</td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>