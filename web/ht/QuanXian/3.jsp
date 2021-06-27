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
<title>3级菜单下的</title>
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
            <script language="javascript">
                function del(url)
                {
                    if (confirm("确定要删除该信息？删除后不可恢复!"))
                    {
                        window.location.href=url;
                    }
                }
            </script>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[3级菜单管理]</td>
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
int int_jb2_id = Integer.parseInt(request.getParameter("int_jb2_id"));
out.println("2级分类id："+int_jb2_id);
%>


<% 
//原理：如果没有任何操作，显示添加界面；如果有参数，则按根据参数来显示修改界面和修改功能，删除功能
if( "modi".equals(request.getParameter("act")) || "modi_save".equals(request.getParameter("act")) )
{
	//先处理修改显示，然后处理修改录入数据功能
	if( "modi".equals(request.getParameter("act")) ){
		int_jb2_id = Integer.parseInt(request.getParameter("int_jb2_id")); //2级id
		int cdid = Integer.parseInt(request.getParameter("id")); //产品id
		String cdmc ="";  //产品名称
		String lj = ""; //产品路径
		int cdpx=0; //产品排序
		//读取修改信息
		Statement stmt_cdmc = null;  
		ResultSet rs_cdmc = null;  
		String sql_cdmc ="select * from quanxian_caidan where id="+cdid;  
		stmt_cdmc = conn.createStatement();  
		rs_cdmc = stmt_cdmc.executeQuery(sql_cdmc);  	
		while(rs_cdmc.next()){
			cdmc = rs_cdmc.getString("caidan_mingcheng");
			lj = rs_cdmc.getString("caidan_lujing");
			cdpx = rs_cdmc.getInt("paixu_id");
		}		
%>
<form name="form_add" method="post" action="?act=modi_save">
    <table width="100%" border="0" cellspacing="0" cellpadding="10" align="center">
        <tr>
            <td bgcolor="#E4E4E4">
                1级菜单名称 <input type="text" size="15" name="mc" value="<%=cdmc%>">
              	 程序路径 <input type="text" size="35" name="lj" value="<%=lj%>">
                                        排序ID <input type="number" name="px" style="width: 50px;" value="<%=cdpx%>">
                <input type="hidden" name="myid" value="<%=cdid%>" />
                <input type="hidden" name="int_jb2_id" value="<%=int_jb2_id%>" />
                <input type="submit" value=" 修改1级菜单名称 " onClick="return checkinfo();">（id越大排序在前面）
            </td>
        </tr>
    </table>
    <script language="javascript">
        function checkinfo()
        {
            if(document.form_add.mc.value=="")
            {
                document.form_add.mc.focus();
                alert("对不起，请填写3级菜单名称！");
                return false;
            }
        }
    </script>
</form>

<%	
	}//修改界面 结束
	
	if( "modi_save".equals(request.getParameter("act"))  ){
		//修改信息处理
		int_jb2_id = Integer.parseInt(request.getParameter("int_jb2_id")); //2级id
		String cdmc = new String((request.getParameter("mc")).getBytes("ISO-8859-1"),"UTF-8"); //名称
		String lj = request.getParameter("lj");  //路径
		int cdpx = Integer.parseInt(request.getParameter("px"));  //排序
		int cdid = Integer.parseInt(request.getParameter("myid")); //产品id
		String sql_Update="Update quanxian_caidan Set caidan_mingcheng=?,paixu_id=?,caidan_lujing=? where id=?";
	    PreparedStatement pstmt2=conn.prepareStatement(sql_Update);
	    pstmt2.setString(1,cdmc);
	    pstmt2.setInt(2,cdpx);
	    pstmt2.setString(3,lj);
	    pstmt2.setInt(4,cdid);
	    int n=pstmt2.executeUpdate();	
	    out.println("记录更新成功<br>");
	    out.println("<meta http-equiv='refresh' content='1;URL=?int_jb2_id="+int_jb2_id+"' />");
	}
 
}else{
	//没有参数，则显示录入界面
	int_jb2_id = Integer.parseInt(request.getParameter("int_jb2_id"));
%>
	    <!--添加功能-开始-->
         <form name="form_add" method="post" action="?act=add">
            <table width="100%" border="0" cellspacing="0" cellpadding="10" align="center">
            <tr>
            <td bgcolor="#E4E4E4">
            	 3级菜单名称 <input type="text" size="15" name="mc">
            	 程序路径 <input type="text" size="35" name="lj">
                                          排序ID <input type="number" name="px" style="width: 50px;" value="1">
                <input type="hidden" name="int_jb2_id" value="<%=int_jb2_id%>" />
				<input type="submit" value=" 添加1级菜单 " onClick="return checkinfo();">（id越大排序在前面）
            </td>
           </tr>
          </table>
             <script language="javascript">
                 function checkinfo()
                 {
                     if(document.form_add.mc.value=="")
                     {
                         document.form_add.mc.focus();
                         alert("对不起，请填写3级菜单名称！");
                         return false;
                     }
                 }
             </script>
         </form>
         <!--添加功能-结束-->
<%	
}
%>



<% 
//录入分类
if("add".equals(request.getParameter("act"))){
	int_jb2_id = Integer.parseInt(request.getParameter("int_jb2_id")); 
	String cdmc = new String((request.getParameter("mc")).getBytes("ISO-8859-1"),"UTF-8");
	String cdpx = request.getParameter("px");
	String lj = request.getParameter("lj");
	String sql_insert="Insert into quanxian_caidan(caidan_mingcheng,caidan_jibie,paixu_id,caidan_suoshu,caidan_lujing) values(?,?,?,?,?)";
	PreparedStatement pstmt=conn.prepareStatement(sql_insert);
	pstmt.setString(1,cdmc);
	pstmt.setInt(2,3);
	pstmt.setString(3,cdpx);
	pstmt.setInt(4,int_jb2_id);
	pstmt.setString(5,lj);
	int n=pstmt.executeUpdate();
	//out.println("执行结果n所示:"+n+"<hr>"); 
	pstmt.close();	
}

%>


<% 
//删除分类
if("del".equals(request.getParameter("act"))){
	int_jb2_id = Integer.parseInt(request.getParameter("int_jb2_id")); 
	int cdid = Integer.parseInt(request.getParameter("id"));
	String sql_del="delete from quanxian_caidan where id=?";
	PreparedStatement pstmt=conn.prepareStatement(sql_del);
	pstmt.setInt(1,cdid);
	int n=pstmt.executeUpdate();
	out.println("<meta http-equiv='refresh' content='1;URL=?int_jb2_id="+int_jb2_id+"' />");
}

%>






<% 
//显示一级菜单列表  int_jb2_id
Statement stmt = null;  
ResultSet rs = null;  
String sql ="select * from quanxian_caidan where caidan_jibie=3 and  caidan_suoshu="+int_jb2_id;  //查询语句
stmt = conn.createStatement();  
rs = stmt.executeQuery(sql);  

out.println("<table width='100%'  cellpadding='5' cellspacing='0' >");
while(rs.next()){
	out.println("<tr>");
	out.println("<td style='border-bottom: 1px dotted #eeeeee;'>"+rs.getString("caidan_mingcheng")+"</td>");
	out.println("<td style='border-bottom: 1px dotted #eeeeee;'>"+rs.getString("caidan_lujing")+"</td>");
	out.println("<td style='border-bottom: 1px dotted #eeeeee;'>"+rs.getString("paixu_id")+"</td>");
	out.println("<td style='border-bottom: 1px dotted #eeeeee;'><a href='?act=modi&id="+rs.getInt("id")+"&int_jb2_id="+int_jb2_id+"'>修改</a>");
	out.println("&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;<a style='cursor: pointer;' onclick=del('?act=del&id="+rs.getInt("id")+"&int_jb2_id="+int_jb2_id+"') >删除</a></td>");
	out.println("</tr>");
}
out.println("</table>");


conn.close();
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