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
<title>留言管理</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[用户留言]-[留言列表]</td>
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







<table width="99%" border="0" cellspacing="1" cellpadding="5" bgcolor="#F9F9F9">
  <tr>
    <td bgcolor="#F7F7F7" width="10%">时间</td>
    <td bgcolor="#F7F7F7" width="20%">标题</td>
    <td bgcolor="#F7F7F7" width="20%">内容</td>
    <td bgcolor="#F7F7F7" width="10%">联系人</td>
    <td bgcolor="#F7F7F7" width="15%">手机</td>
    <td bgcolor="#F7F7F7" width="15%">邮箱</td>
    <td bgcolor="#F7F7F7" width="10%">&nbsp;</td>
  </tr>




<% 
//初始化设置
int PAGESIZE = 5;  //每页的数据条数  //一页放5个
int pageCount = 0; //总的页数
int curPage = 1;   //当前页数
int shang=0;  //初始化上页数字
int xia = 0;  //初始化下页数字
int size = 0;  //总数据初始化

try{
    String sql = "SELECT * FROM liuyan order by id desc";
    PreparedStatement stat = conn.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
    ResultSet rs = stat.executeQuery();
    rs.last(); //移动到最后一条数据
    size = rs.getRow(); //获得总的数据条数
    pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1); //获得页数 
    String tmp = request.getParameter("curPage");
    if(tmp==null){
        tmp="1";
    }
    curPage = Integer.parseInt(tmp);
    if(curPage>=pageCount) curPage = pageCount;
    boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);
    //out.println(curPage);//输出到屏幕上
    int count = 0;
     
    do{
        if(count>=PAGESIZE)break;
        int lyid = rs.getInt("id");
       
        String xingming = rs.getString("xingming");
        String dianhua = rs.getString("dianhua");
        String youxiang = rs.getString("youxiang");
        String zhuti = rs.getString("zhuti");
        String neirong = rs.getString("neirong");
        String add_date = rs.getString("add_date");

        
        count++;
        %>
  <tr>
    <td bgcolor="#FFFFFF"><%=add_date%> </td>
    <td bgcolor="#FFFFFF"><%=zhuti%> </td>
    <td bgcolor="#FFFFFF"><%=neirong%> </td>
    <td bgcolor="#FFFFFF"><%=xingming%> </td>
    <td bgcolor="#FFFFFF"><%=dianhua%> </td>
    <td bgcolor="#FFFFFF"><%=youxiang%> </td>
    <td bgcolor="#FFFFFF" align="center">
    	<a style='cursor: pointer;' onclick=del('liuyan_del.jsp?id=<%=lyid%>&curPage=<%=curPage%>') >删除</a>
    </td>
  </tr>
      
        <%
    }while(rs.next());
    conn.close();
}
catch(Exception e){
     
}

%>
</table>








        
        
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