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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[类型修改]</td>
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










<form method="post" name="form1" action="hy_leixing_xiugai_act.jsp">
<% 
//解决乱码问题
request.setCharacterEncoding("UTF-8");

int id = Integer.parseInt(request.getParameter("id"));//获取的id
int curPage = Integer.parseInt(request.getParameter("curPage"));//获取的id

int fl_id = 0;
String beizhu = "";

Statement stmt = null;  
ResultSet rs = null;  
String sql ="select * from huiyuan where id="+id;  //查询语句
stmt = conn.createStatement();  
rs = stmt.executeQuery(sql);  
while (rs.next()) {  
	fl_id = rs.getInt("fl_id");
	beizhu = rs.getString("beizhu");
}  		
%>
<table width="99%" border="0" cellspacing="1" cellpadding="5"  bgcolor="#F0F0F0" align="center">
  <tr>
    <td bgcolor="#FFFFFF" width="15%" align="center">会员类型</td>
    <td width="85%" bgcolor="#FFFFFF">
          <select name="lxid">
 				<% 
 				 Statement stmt_2 = null;  
 				 ResultSet rs_2 = null;  
 				 String sql_2 ="select * from huiyuan_fenlei order by id desc ";  //查询语句
 				 stmt_2 = conn.createStatement();  
 				 rs_2 = stmt_2.executeQuery(sql_2);  
 				 while(rs_2.next()) {  
 					 out.println("<option  value='"+rs_2.getInt("paixu_id")+"'  ");
	 					if(rs_2.getInt("paixu_id")==fl_id){ 
							out.print(" selected='selected'  ");  
						}
 					 out.println(">" + rs_2.getString("caidan_mingcheng") + "</option>");
 				 }
 				%>
            </select>
      
      <input type="hidden" name="hyid" value="<%=id%>" >
      <input type="hidden" name="curPage" value="<%=curPage%>">
      
    </td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" align="center">会员备注</td>
    <td bgcolor="#FFFFFF"><input type="text" name="beizhu" size="70" value="<%=beizhu%>"></td>
  </tr>

  
  <tr>
    <td height="56" align="center" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">
      <input type="submit" value=" 修改会员类型 ">
      </td>
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