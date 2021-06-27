<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.text.*" %>

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
                                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[添加日期]</td>
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
                        //解决乱码问题
                        request.setCharacterEncoding("UTF-8");

                        //获取传递过来的数据

                        int dy_id = Integer.parseInt(request.getParameter("dy_id"));
                        String dy_mc = request.getParameter("dy_mc");

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
                            //插入数据库
                            String sql_insert = "";
                            sql_insert= sql_insert+  "Insert into shipin_mulu(xinxi_biaoti,xinxi_riqi,xinxi_neirong"; //3
                            sql_insert= sql_insert+  ",mulu_jibie,tushu_id,tushu_mc,up_id"; //4
                            sql_insert= sql_insert+  ",add_riqi,add_shijian)";  //2
                            sql_insert= sql_insert+  " values(?,?,?,?,?,?,?,?,?)";
                            PreparedStatement pstmt=conn.prepareStatement(sql_insert);
                            pstmt.setString(1,biaoti);
                            pstmt.setString(2, riqi);
                            pstmt.setString(3,htmlData);

                            pstmt.setInt(4,1);
                            pstmt.setInt(5,dy_id);
                            pstmt.setString(6,dy_mc);
                            pstmt.setInt(7,0);

                            pstmt.setString(8,mydate1);
                            pstmt.setString(9,mydate2);
                            int n=pstmt.executeUpdate();
                            out.print("信息录入成功<br>");
                            //out.print("<script language='JavaScript' >alert('成功登录！');window.location='zixun_list.jsp';</script>");
                            out.print("<meta http-equiv='refresh' content='1;URL=changci_list.jsp?dy_id="+dy_id+"&dy_mc="+dy_mc+"' />");
                            pstmt.close();
                            conn.close();
                        }

                    %>




                    <%!
                        private String htmlspecialchars(String str) {
                            str = str.replaceAll("&", "&amp;");
                            str = str.replaceAll("<", "&lt;");
                            str = str.replaceAll(">", "&gt;");
                            str = str.replaceAll("\"", "&quot;");
                            return str;
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