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
<title>修改分组权限信息</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[修改分组权限信息]</td>
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
	//【原理】我们先获取3级菜单；然后逆向获取对应的2级菜单和1级菜单的权限
	String qx_1 = ",";
	String qx_2 = ",";
	String qx_3 = ",";
	
	//获取选中的3级id数组
	String[] quanxian;
	//用来获取多个复选按钮的值
	quanxian = request.getParameterValues("quanxian_3");
	//out.println(quanxian.length);
	for(int x=0;x<quanxian.length;x++){
		//out.println(quanxian[x]+"|");	//quanxian[x]表是一个3级菜单id
		qx_3 = qx_3 + quanxian[x] + ",";
	}
	out.println("3级菜单字符串集合："+qx_3+"<br>");
	
	//获取2级菜单和权限   //第1步：读取1级菜单
	Statement stmt_a1 = null;  
	ResultSet rs_a1 = null;  
	String sql_a1 ="select * from quanxian_caidan where caidan_jibie=1  ";  
	stmt_a1 = conn.createStatement();  
	rs_a1 = stmt_a1.executeQuery(sql_a1);
	while(rs_a1.next()){
		//获取2级菜单和权限   //第2步：读取2级菜单
		Statement stmt_a2 = null;  
		ResultSet rs_a2 = null;  
		String sql_a2 ="select * from quanxian_caidan where caidan_jibie=2  and caidan_suoshu="+rs_a1.getInt("id");
		stmt_a2 = conn.createStatement();  
		rs_a2 = stmt_a2.executeQuery(sql_a2);
		while(rs_a2.next()){
			//获取2级菜单和权限   //第3步：读取3级菜单 
			Statement stmt_a3 = null;  
			ResultSet rs_a3 = null;  
			String sql_a3 ="select * from quanxian_caidan where caidan_jibie=3  and caidan_suoshu="+rs_a2.getInt("id")+" and id in (0"+qx_3+"0) ";
			stmt_a3 = conn.createStatement();  
			rs_a3 = stmt_a3.executeQuery(sql_a3);
			while(rs_a3.next()){
				qx_2 = qx_2 + rs_a2.getInt("id") + ",";
				break;
			}
		}
	}
	out.println("2级菜单字符串集合："+qx_2+"<br>");
	
	//和上面原理一样；我们来获取1级菜单
	Statement stmt_b1 = null;  
	ResultSet rs_b1 = null;  
	String sql_b1 ="select * from quanxian_caidan where caidan_jibie=1  ";  
	stmt_b1 = conn.createStatement();  
	rs_b1 = stmt_a1.executeQuery(sql_b1);
	while(rs_b1.next()){
		Statement stmt_b2 = null;  
		ResultSet rs_b2 = null;  
		String sql_b2 ="select * from quanxian_caidan where caidan_jibie=2  and caidan_suoshu="+rs_b1.getInt("id")+" and id in (0"+qx_2+"0) ";
		stmt_b2 = conn.createStatement();  
		rs_b2 = stmt_b2.executeQuery(sql_b2);
		while(rs_b2.next()){
			qx_1 = qx_1 + rs_b1.getInt("id") + ",";
			break;
		}
	}
	out.println("1级菜单字符串集合："+qx_1+"<br>");
	
	//更新当前用户分组的权限设置
	int fz_id = Integer.parseInt(request.getParameter("id"));
	out.println("当前分组id："+fz_id+"<br>");
	
	 String sql_Update="Update quanxian_fenzu Set quanxian_1=?,quanxian_2=?,quanxian_3=? where id=?";
	 PreparedStatement pstmt2=conn.prepareStatement(sql_Update);
	 pstmt2.setString(1,qx_1);
	 pstmt2.setString(2,qx_2);
	 pstmt2.setString(3,qx_3);
	 pstmt2.setInt(4,fz_id);
	 int n=pstmt2.executeUpdate();
	 out.println("执行结果n所示:"+n+"<hr>"); 
	 //跳转回列表页面
	 out.println("<meta http-equiv='refresh' content='1;URL=sys_fenzu_list.jsp' />");
	
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