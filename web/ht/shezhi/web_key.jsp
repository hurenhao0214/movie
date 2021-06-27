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
<title>网站名称设置</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[初始设置]-[网站名称设置]</td>
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
//先读取原先的设置信息
	Statement stmt = null;  
	ResultSet rs = null;  
	String sql ="select * from web_key where id=1";  //查询语句
	stmt = conn.createStatement();  
	rs = stmt.executeQuery(sql);  
	
	int var_id = 0;
	String var_mc= "";  //网站名称
	String var_gjz = "";//关键字
	String var_ms = ""; //描述 

	while (rs.next()) {  
		var_id = rs.getInt("id");
		var_mc =rs.getString("Mingcheng");
		var_gjz =rs.getString("Guanjianzi");
		var_ms =rs.getString("Miaoshu");
	}  		
	
	stmt.close();
	conn.close(); 
%>
<form name="form1"  action="web_key_act.jsp" method="post">
<table width="99%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td width="20%" align="right" bgcolor="#F1FAFF">&nbsp;</td>
    <td width="80%" bgcolor="#F1FAFF">设置网站的名称、关键字、描述
    <input type="hidden" name="myid" value="<%=var_id%>" >
    </td>
  </tr>
  <tr>
    <td align="right">网站名称：</td>
    <td><input type="text" name="mc" size="50" value="<%=var_mc%>"></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#F1FAFF">网站关键字：</td>
    <td bgcolor="#F1FAFF">
    	<input type="text" name="gjz" size="100" value="<%=var_gjz%>">
    </td>
  </tr>
  <tr>
    <td align="right">网站名称：</td>
    <td><textarea cols="50" rows="3" name="ms"><%=var_ms%></textarea>
    </td>
  </tr>  
  <tr>
    <td bgcolor="#F1FAFF">&nbsp;</td>
    <td bgcolor="#F1FAFF"><input type="submit" value=" 提交设置信息  " onClick="return check_info();"></td>
  </tr>
</table>
		<script>
		function check_info()
		{
			if(document.form1.mc.value=="" || document.form1.gjz.value=="" || document.form1.ms.value=="")
			{
				alert("请填写信息！");
				return false;
			}
		}
		</script>
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