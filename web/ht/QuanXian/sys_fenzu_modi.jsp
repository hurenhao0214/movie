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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[权限分组修改]</td>
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









<form  action="sys_fenzu_modi_save.jsp" method="post">
<%
int fz_id = Integer.parseInt(request.getParameter("id"));
%>
<table width="99%" border="0" cellspacing="1" cellpadding="5" bgcolor="#F2F2F2">
  <tr>
    <td bgcolor="#E2F4FF" align="center" width="20%;"><strong>角色</strong></td>
    <td bgcolor="#E2F4FF" align="center" width="80%;"><strong>权限</strong>
    <input type="hidden" name="id" value="<%=fz_id%>">
    </td>
  </tr>



<% 
Statement stmt = null;  
ResultSet rs = null;  
String sql ="select * from quanxian_fenzu where id=" + fz_id;  //查询语句
stmt = conn.createStatement();  
rs = stmt.executeQuery(sql);  
while(rs.next()) {  
%>
      <tr>
        <td bgcolor="#FFFFFF" align="center"><%=rs.getString("fenzu_mingcheng")%></td>
        <td bgcolor="#FFFFFF">
	        <% 
	        //权限列表
	        String quanxian_1 = rs.getString("quanxian_1");  //表示1级菜单的id集合
	        String quanxian_2 = rs.getString("quanxian_2");  //表示1级菜单的id集合
	        String quanxian_3 = rs.getString("quanxian_3");  //表示1级菜单的id集合
	        out.println(quanxian_3+ "<br>");
	        
	       	 //读取1级菜单权限和名称
	       	 Statement stmt_1 = null;  
	       	 ResultSet rs_1 = null;  
	       	 String sql_1 ="select * from quanxian_caidan where caidan_jibie=1";  //查询语句
	       	 stmt_1 = conn.createStatement();  
	       	 rs_1 = stmt_1.executeQuery(sql_1); 	
	       	 while(rs_1.next()) {  
	       		 out.println("<font color=red>=="+rs_1.getString("caidan_mingcheng") + "==</font><br>" );
	       		 
		         //读取2级菜单权限和名称
	        	 Statement stmt_2 = null;  
	        	 ResultSet rs_2 = null;  
	        	 String sql_2 ="select * from quanxian_caidan where caidan_jibie=2  and  caidan_suoshu="+rs_1.getInt("id"); 
	        	 stmt_2 = conn.createStatement();  
	        	 rs_2 = stmt_2.executeQuery(sql_2); 	
	        	 while(rs_2.next()) {  
	        		 out.println("<b>"+rs_2.getString("caidan_mingcheng") + "</b><br>" );
	        		 
		        	 //读取3级菜单权限和名称
		        	 Statement stmt_3 = null;  
		        	 ResultSet rs_3 = null;  
		        	 String sql_3 ="select * from quanxian_caidan where caidan_jibie=3  and caidan_suoshu="+rs_2.getInt("id"); 
		        	 stmt_3 = conn.createStatement();  
		        	 rs_3 = stmt_3.executeQuery(sql_3); 	
		        	 while(rs_3.next()) {  
		        		 //写checkbox选择框
		        		 out.println("<input type='checkbox' name='quanxian_3' value='"+rs_3.getInt("id")+"'");
		        		 if(quanxian_3.indexOf(String.valueOf(rs_3.getInt("id")))!=-1){ //id需要转成字符串后在比较
		        			 out.println(" checked ");
		        		 }
		        		 out.println( " >" + rs_3.getString("caidan_mingcheng") + " | " );
		        	 }	
		        	 out.println("<br>");
	        	 }	        	
	       	 }//读取1级菜单权限和名称
	       	 
	        
	        %>
        </td>
      </tr>
<% 
}
%>


    <tr>
        <td bgcolor="#E2F4FF" align="center"  colspan="2" > <input type="submit" value="修改分组权限信息" ></td>
    </tr>
  
</table>
</form>
        
        







        
        
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