<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
}
-->
</style>
<style type="text/css">
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #ffffff; POSITION: relative; TOP: 2px 
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #FFCC00; POSITION: relative; TOP: 2px
}

</style>
<script>
var he=document.body.clientHeight-105
document.write("<div id=tt style=height:"+he+";overflow:hidden>")
</script>

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
                 
				 %>
				 
<table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" background="images/main_40.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="19%">&nbsp;</td>
        <td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
    
    
    
    
    
    
    
    
    
    
<% 
int int_qx_id1 = Integer.parseInt(request.getParameter("int_qx_id1"));//获取1级分类的id
String str_mc = request.getParameter("str_mc");//获取1级分类的名称
//out.println(int_qx_id1 + " | " + str_mc);

String qx_2= "";  //2级权限内容
String qx_3= "";  //3级权限内容

//根据传递过来的1级菜单的id，读取该分类下面的所有2级菜单
//根据该用户的2级菜单权限，有权限的则显示

//第1步：读取该用户的所有2级和3级菜单的id集合
Statement stmt = null;  
ResultSet rs = null;  
String sql ="select * from quanxian_fenzu where id="+u_fzid;  //查询语句
stmt = conn.createStatement();  
rs = stmt.executeQuery(sql);  
if (rs.next()) {  
	qx_2 = rs.getString("quanxian_2");
	qx_3 = rs.getString("quanxian_3");
}

//第2步：读取和显示2级菜单

Statement stmt_cdmc = null;  
ResultSet rs_cdmc = null;  
String sql_cdmc ="select * from quanxian_caidan where caidan_suoshu="+int_qx_id1+" and id in(0"+qx_2+"0)";  
stmt_cdmc = conn.createStatement();  
rs_cdmc = stmt_cdmc.executeQuery(sql_cdmc);  	
while(rs_cdmc.next()){
	//out.println(rs_cdmc.getString("caidan_mingcheng"));


%>    
    
    
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23" background="images/main_47.gif" id="imgmenu1" class="menu_title" onMouseOver="this.className='menu_title2';" onClick="showsubmenu(1)" onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="18%">&nbsp;</td>
                <td width="82%" class="STYLE1"><%=rs_cdmc.getString("caidan_mingcheng")%></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td background="images/main_51.gif" id="submenu1">
			 <div class="sec_menu" >  
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                
                
                <% 
                //读取3级菜单
				Statement stmt_cdmc3 = null;  
				ResultSet rs_cdmc3 = null;  
				String sql_cdmc3 ="select * from quanxian_caidan where caidan_suoshu="+rs_cdmc.getString("id")+" and id in(0"+qx_3+"0)";  
				stmt_cdmc3 = conn.createStatement();  
				rs_cdmc3 = stmt_cdmc3.executeQuery(sql_cdmc3);  	
				while(rs_cdmc3.next()){
					
				     
                %>
                <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="16%" height="25"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
                    <td width="84%" height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'">
                          <span class="STYLE3">
                          <% 
                          out.println("<a href='"+rs_cdmc3.getString("caidan_lujing")+"' target='I2'>");
                          out.println(rs_cdmc3.getString("caidan_mingcheng"));
                          out.println("</a>");
                          %>
                          </span>
                          </td>
                        </tr>
                    </table></td>
                  </tr>
                </table>
                <% } %>
                
                
                
                </td>
              </tr>
              <tr>
                <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
              </tr>
            </table></div></td>
          </tr>
          
        </table></td>
      </tr>
      
 <%
}
 %>     
      
      
      
      
      
      
     
      
      
      
      
      
      
      
    </table></td>
  </tr>
  <tr>
    <td height="18" background="images/main_58.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="18" valign="bottom"><div align="center" class="STYLE3">version:1.0.1</div></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>




function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
imgmenu = eval("imgmenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
imgmenu.background="images/main_47.gif";
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
imgmenu.background="images/main_48.gif";
}
}

</script>