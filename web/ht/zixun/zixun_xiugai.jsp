<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.text.*"  %>

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
 


	<link rel="stylesheet" href="../../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../../kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="../../kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="../../kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="../../kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '../../kindeditor/plugins/code/prettify.css',
				uploadJson : '../../kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '../../kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[资讯中心]-[修改资讯]</td>
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

<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>


<%
//解决乱码问题
request.setCharacterEncoding("UTF-8"); 

//默认进入修改页面
if(request.getParameter("act")=="" || request.getParameter("act")==null)
{
	out.println("修改内容<br>");
	//读取要修改的资讯信息  //获取参数
	int id = Integer.parseInt(request.getParameter("id"));//获取的id
	int curPage = Integer.parseInt(request.getParameter("curPage"));//获取的id
	
	//初始化变量
    int zxid = 0;
    int xinxi_lxid1 = 0; //1级类型
    int xinxi_lxid2 = 0; //2级类型
    
    String xinxi_biaoti = ""; //标题
    String xinxi_riqi ="";  //日期
    
    int xinxi_jianjie_yn = 0;  //是否有简介，0无，1有
    String xinxi_jianjie = ""; //简介内容
    
    int xinxi_tupian_yn = 0;  //是否有缩略图，0无，1有
    String xinxi_tupian = "";  //缩略图 
    
    String xinxi_neirong = "";  //内容
    
    //读取要修改的信息
	Statement stmt_0 = null;  
	ResultSet rs_0 = null;  
	String sql_0 ="select * from zixun where id="+id;  //查询语句
	stmt_0 = conn.createStatement();  
	rs_0 = stmt_0.executeQuery(sql_0);  
	while (rs_0.next()) {  
		zxid = rs_0.getInt("id");
		xinxi_lxid1 = rs_0.getInt("xinxi_lxid1");
		xinxi_lxid2 = rs_0.getInt("xinxi_lxid2");
		xinxi_biaoti = rs_0.getString("xinxi_biaoti");
		xinxi_riqi = rs_0.getString("xinxi_riqi");
		xinxi_biaoti = rs_0.getString("xinxi_biaoti");
		xinxi_jianjie_yn = rs_0.getInt("xinxi_jianjie_yn");
		xinxi_jianjie = rs_0.getString("xinxi_jianjie");
		xinxi_tupian_yn = rs_0.getInt("xinxi_tupian_yn");
		xinxi_tupian = rs_0.getString("xinxi_tupian");		
		xinxi_neirong = rs_0.getString("xinxi_neirong");	
	}  	
	
	xinxi_neirong = htmlspecialchars(xinxi_neirong);  //函数处理

	
%>

<form name="example" method="post" action="?act=add">

<table width="99%" border="0" cellspacing="1" cellpadding="5" bgcolor="#EAEAEA">

  <tr>
    <td bgcolor="#FFFFFF" width="15%" align="center">资讯类型</td>
    <td width="85%" colspan="2" bgcolor="#FFFFFF">
		<select name="lxid">
		<% 
		 //1级菜单
		 Statement stmt_a1 = null;  
		 ResultSet rs_a1 = null;  
		 String sql_a1 ="select * from zixun_fenlei where caidan_jibie=1 ";  //查询语句
		 stmt_a1 = conn.createStatement();  
		 rs_a1 = stmt_a1.executeQuery(sql_a1);  
		 while(rs_a1.next()) {  
			 out.println("<option  value='"+rs_a1.getInt("id")+"'  ");
			 //选择
			 if(rs_a1.getInt("id")==xinxi_lxid1){ 
			 	out.print(" selected='selected'  ");  
			 }
			 out.println(">" + rs_a1.getString("caidan_mingcheng") + "</option>");
			 	 //2级菜单
				 Statement stmt_a2 = null;  
				 ResultSet rs_a2 = null;  
				 String sql_a2 ="select * from zixun_fenlei where caidan_jibie=2  and  caidan_suoshu="+rs_a1.getInt("id");  //查询语句
				 stmt_a2 = conn.createStatement();  
				 rs_a2 = stmt_a2.executeQuery(sql_a2);  
				 while(rs_a2.next()) {  
					 out.println("<option  value='"+rs_a1.getInt("id")+","+rs_a2.getInt("id")+"'  "); //分隔符用|出错，这里用逗号,
					 //选择
					 if(rs_a2.getInt("id")==xinxi_lxid2){ 
					 	out.print(" selected='selected'  ");  
					 }					 
					 out.println(">&nbsp;&nbsp;&nbsp;&nbsp;|----" + rs_a2.getString("caidan_mingcheng") + "</option>");
				 }			 
		 }
		%>
		</select>    
    </td>
  </tr>
  
  <tr>
    <td bgcolor="#FFFFFF" align="center">资讯标题</td>
    <td  colspan="2" bgcolor="#FFFFFF">
		<input type="text" name="biaoti" size="70" value="<%=xinxi_biaoti%>" >
      <input type="hidden" name="zxid" value="<%=id%>" >
      <input type="hidden" name="curPage" value="<%=curPage%>" >
	</td>
  </tr>  
  
  <tr>
    <td bgcolor="#FFFFFF" align="center">发布日期</td>
    <td  colspan="2" bgcolor="#FFFFFF">
	<%
	//在引入了Date和sql包时发生的，其主要原因就是sql和Date包中都含有Date类，在引用的时候出现了指向不明确;
	//在应用Date类是加入全称，	
	out.print(xinxi_riqi);
	java.util.Date mydate = new java.util.Date();
	SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd");  //一定要转成 年月日格式(时间或者字符串类型)才能显示
	//out.println(ft.format(mydate));
	%>
	<input type="date" name="riqi" value="<%=xinxi_riqi%>"  >
	</td>
  </tr>  
  
  <tr>
    <td bgcolor="#FFFFFF" align="center">附加选项</td>
    <td  colspan="2" bgcolor="#FFFFFF">

	    <input type="checkbox" name="jianjie_yn" id="ck01" onClick="tuijian();"
	    	<% 
	    	if(xinxi_jianjie_yn==1){
	    		out.println(" checked ");
	    	}
	    	%>
	    >
	    <label for="ck01">有推荐内容</label>
	    <script>
			function tuijian(){
				if(document.example.jianjie_yn.checked == true){
					document.getElementById("tj").style.display ="";
				}else
				{
					document.getElementById("tj").style.display ="none";
				}
			}
		</script>
	    &nbsp;&nbsp;&nbsp;&nbsp;
	    
	    <input type="checkbox" name="tupian_yn" id="ck02" onClick="slt();"
	    	<% 
	    	if(xinxi_tupian_yn ==1){
	    		out.println(" checked ");
	    	}
	    	%>	    
	    >
	    <label for="ck02">有缩略图片</label>
	    <script>
			function slt(){
				if(document.example.tupian_yn.checked == true){
					document.getElementById("slt").style.display ="";
				}else
				{
					document.getElementById("slt").style.display ="none";
				}
			}
		</script>
    
    </td>
  </tr>      

  <tr  id="tj" 
	   	<% 
	   	if(xinxi_jianjie_yn==1){
	   	}else{
	   		out.println(" style='display:none;' ");
	   	}
	   	%>  
  >
    <td bgcolor="#FFFFFF" align="center">推荐简介</td>
    <td  colspan="2" bgcolor="#FFFFFF">
		<textarea name="jianjie" rows="5" cols="70"><%=xinxi_jianjie%></textarea>
	</td>
  </tr>    
  
  <tr  id="slt" 
	   	<% 
	   	if(xinxi_tupian_yn==1){
	   	}else{
	   		out.println(" style='display:none;' ");
	   	}
	   	%>  
	>
    <td bgcolor="#FFFFFF"  align="center" height="50">缩略图片</td>
    <td bgcolor="#FFFFFF" width="30%">
    <input type="text" name="tupian" id="tupian" size="40" value="<%=xinxi_tupian%>" >
    <!-- 上传 这里 form name="example" 要是是这个，下面就传了返回的字段作为参数；表单名称没有作为参数-->
    </td>
    <td bgcolor="#FFFFFF"><iframe frameborder="0" src="../../up.jsp?fmid=tupian" width="100%" height="25"></iframe> 
    </td>
  </tr>  
  
  <tr>
    <td bgcolor="#FFFFFF"  align="center">资讯内容</td>
    <td colspan="2" bgcolor="#FFFFFF">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=xinxi_neirong %></textarea>
		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)   
    </td>
  </tr>

  <tr>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>

</form>


<% 
}

if("add".equals(request.getParameter("act")) )
{
	int zxid = Integer.parseInt(request.getParameter("zxid"));//获取的id
	int curPage = Integer.parseInt(request.getParameter("curPage"));//获取的id
	out.println("参数：" + zxid + " | " + curPage + "<br>");


	//获取传递过来的数据

	//获取类型 
	//int lxid = Integer.parseInt(request.getParameter("lxid"));  //资讯类型
	String lxids = request.getParameter("lxid");  //资讯类型
	out.print("资讯类型："+lxids + "<br>");
	int xinxi_lxid1 =0;
	int xinxi_lxid2 =0;
	//先判断是否选择了2级分类
	if(lxids.indexOf(",")!=-1){ //选择2级分类
		String Array1[] = lxids.split(",");
		//out.print("数组长度："+Array1.length+"<br>");
		//这里不用循环；固定的2个
		xinxi_lxid1 = Integer.parseInt(Array1[0]);//字符串要转成int
		xinxi_lxid2 = Integer.parseInt(Array1[1]);	
	}else{ //没有选择2级分类
		xinxi_lxid1 = Integer.parseInt(lxids);
	}
	out.print("资讯类型1="+xinxi_lxid1 + " | 资讯类型2="+xinxi_lxid2 + "<br>");

	//获取标题 
	String biaoti = request.getParameter("biaoti"); 
	out.print("标题："+biaoti + "<br>");

	//获取日期 
	String riqi = request.getParameter("riqi");  //日期
	out.print("日期："+riqi + "<br>");
	//转日期
	SimpleDateFormat sdf  =   new  SimpleDateFormat( "yyyy-MM-dd" ); 
	java.util.Date riqi2 = sdf.parse(riqi);
	out.print("日期："+riqi2 + "<br>");

	//获取是否推荐 
	int var_jianjie_yn = 0;
	String jianjie_yn = request.getParameter("jianjie_yn");  //选中on，未选中null
	out.print("推荐："+jianjie_yn);
	if("on".equals(jianjie_yn)){  //jianjie_yn == "on" 无效
		var_jianjie_yn = 1;
	}
	out.print(" | 推荐："+var_jianjie_yn+"<br>");

	String jianjie = request.getParameter("jianjie");
	out.print(" | 推荐内容："+jianjie+"<br>");

	//获取是否缩略图 
	int var_tupian_yn = 0;
	String tupian_yn = request.getParameter("tupian_yn");  //选中on，未选中null
	out.print("缩略图："+tupian_yn);
	if("on".equals(tupian_yn)){  //jianjie_yn == "on" 无效
		var_tupian_yn = 1;
	}
	out.print(" | 缩略图："+var_tupian_yn+"<br>");

	String tupian = request.getParameter("tupian");
	out.print(" | 缩略图内容："+tupian+"<br>");

	//下面获取在线编辑器的内容
	//String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";  //3元运算
	String htmlData  = "";
	if(request.getParameter("content1")==null || request.getParameter("content1")==""){
		
	}else{
		htmlData =  request.getParameter("content1");
	}

	//时间
	 java.util.Date Dates = new java.util.Date();
	 out.println("原始时间："+Dates+"<br>"); 
	 SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
	 SimpleDateFormat ft2 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	 String mydate1 = ft1.format(Dates);  //转成指定格式的字符串 
	 String mydate2 = ft2.format(Dates);  //转成指定格式的字符串
	 out.println("转成日期字符串："+mydate1+"<br>"); 
	 out.println("转成时间字符串："+mydate2+"<br>"); 
	 //java.util.Date mydate2 = ft.parse(mydate1); 
	 //out.println("转成时间类型："+mydate2+"<br>"); 
	//判断是否输入标题和内容 
	 if(biaoti==null||"".equals(biaoti)  ||"".equals(htmlData)){
	 	out.print("请输入标题和内容<br>");
	 }else{
		 
		 //更新数据
		 String sql_Update = "";
		 sql_Update=sql_Update + "update zixun set xinxi_lxid1=?,xinxi_lxid2=?";
		 sql_Update=sql_Update + ",xinxi_biaoti=?,xinxi_riqi=?";
		 sql_Update=sql_Update + ",xinxi_jianjie_yn=?,xinxi_jianjie=?,xinxi_tupian_yn=?,xinxi_tupian=?";
		 sql_Update=sql_Update + ",xinxi_neirong=?,add_riqi=?,add_shijian=?";
		 sql_Update=sql_Update + " where id=?";
		 PreparedStatement pstmt2=conn.prepareStatement(sql_Update);
		    pstmt2.setInt(1,xinxi_lxid1);
		    pstmt2.setInt(2,xinxi_lxid2);
		    pstmt2.setString(3,biaoti);
		    pstmt2.setString(4, riqi);
		    pstmt2.setInt(5,var_jianjie_yn);
		    pstmt2.setString(6,jianjie);
		    pstmt2.setInt(7,var_tupian_yn);
		    pstmt2.setString(8,tupian);
		    pstmt2.setString(9,htmlData);
		    pstmt2.setString(10,mydate1);
		    pstmt2.setString(11,mydate2);
		    pstmt2.setInt(12,zxid);
		 int n=pstmt2.executeUpdate();
		 out.println("执行结果n所示:"+n+"<hr>");
		 
	 
		 out.println("<meta http-equiv='refresh' content='1;URL=zixun_list.jsp?curPage="+curPage+"' />"); 
		 
	 }	 
	
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