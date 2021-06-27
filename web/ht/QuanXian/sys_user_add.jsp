<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,java.text.*" %>

<%@ include file="../../conn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[权限和用户管理]-[添加用户]</td>
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
if(request.getParameter("act")=="" || request.getParameter("act")==null)
{
%>
    <form action="?act=add"   method="post"><br>
    <table width="99%" border="0" cellspacing="1" cellpadding="5" align="center" bgcolor="#F2F2F2">
      <tr>
        <td bgcolor="#FFFFFF" width="20%" align="center">账号</td>
        <td bgcolor="#FFFFFF" width="80%" >
            <input type="text" name="zh" >
        </td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF" align="center">密码</td>
        <td bgcolor="#FFFFFF">
            <input type="text" name="mm">
        </td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF" align="center">备注</td>
        <td bgcolor="#FFFFFF">
            <input type="text" name="bz">
        </td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF" align="center">角色</td>
        <td bgcolor="#FFFFFF">&nbsp;
            <!--输出1级分类，供选择-开始(左侧)-->
            <select name="fzid">
 				<% 
 				 Statement stmt = null;  
 				 ResultSet rs = null;  
 				 String sql ="select * from quanxian_fenzu order by id desc ";  //查询语句
 				 stmt = conn.createStatement();  
 				 rs = stmt.executeQuery(sql);  
 				 while(rs.next()) {  
 					 out.println("<option  value='"+rs.getInt("id")+"'  ");
 					 out.println(">" + rs.getString("fenzu_mingcheng") + "</option>");
 				 }
 				%>
            </select>
            <!--输出1级分类，供选择-开始（左侧）-->
        </td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF">&nbsp;</td>
        <td bgcolor="#FFFFFF">
            <input type="submit" value=" 添加账号 " >
        </td>
      </tr>
    </table>
    </form>
<% 
}

//录入数据
if("add".equals(request.getParameter("act")) ){
	//获取数据
	String zh = request.getParameter("zh");
	String mm = request.getParameter("mm");
	//String bz = request.getParameter("bz"); //乱码问题
	String bz = new String(request.getParameter("bz").getBytes("ISO8859_1"), "UTF-8");
	int fzid = Integer.parseInt(request.getParameter("fzid"));
	
	//在引入了Date和sql包时发生的，其主要原因就是sql和Date包中都含有Date类，在引用的时候出现了指向不明确;
	//在应用Date类是加入全称，
	//Date dNow = new Date( ); //修改为下面的语句
	//SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss"); //要引入,java.text.*
	
	//插入时间也可以使用下面代码
	java.util.Date Dates = new java.util.Date();
    java.sql.Timestamp time = new java.sql.Timestamp(Dates.getTime());
    //psmt.setTimestamp(3, time);


	//插入数据
	String sql_insert="Insert into quanxian_yonghu(user_name,user_password,beizhu,fenzu_id,add_date) values(?,?,?,?,?)";
    PreparedStatement pstmt=conn.prepareStatement(sql_insert);
    pstmt.setString(1,zh);
	pstmt.setString(2,mm);
	pstmt.setString(3,bz);
	pstmt.setInt(4,fzid);
	pstmt.setTimestamp(5, time);
	int n=pstmt.executeUpdate();
	out.println("执行结果n所示:"+n+"<hr>"); 	
	
	out.println("<meta http-equiv='refresh' content='1;URL=sys_user_list.jsp' />"); 	
	
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