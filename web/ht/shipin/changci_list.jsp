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
                                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[电影管理]-[场次目录]</td>
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
    int dy_id = Integer.parseInt(request.getParameter("dy_id"));
    String dy_mc = request.getParameter("dy_mc");
    out.print("电影id=" + dy_id + " | 电影名称=" + dy_mc + "<br>");
%>


<a href="riqi_add.jsp?dy_id=<%=dy_id%>&dy_mc=<%=dy_mc%>">录入电影日期(放映日期)</a> <br>


<%

    //（1）读取时间列表
    Statement stmt_sp1 = null;
    ResultSet rs_sp1 = null;
    String sql_sp1 ="select  * from shipin_mulu  where mulu_jibie=1 and tushu_id=" + dy_id;  //查询语句
    stmt_sp1 = conn.createStatement();
    rs_sp1 = stmt_sp1.executeQuery(sql_sp1);
    while (rs_sp1.next()) {
        out.print("<hr>");
        int mulu_id = rs_sp1.getInt("id");
        int sj_id = rs_sp1.getInt("id");
        int jibie1_id = rs_sp1.getInt("id");
        String xinxi_biaoti =rs_sp1.getString("xinxi_biaoti");
        String xinxi_riqi =rs_sp1.getString("xinxi_riqi");

        out.print(xinxi_riqi);  //显示日期
        out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        out.print("&nbsp;&nbsp;&nbsp;&nbsp;<a href='changci_add.jsp?dy_id="+dy_id+"&dy_mc="+dy_mc+"&jibie1_id="+jibie1_id+"'>录入场次</a>");
        //out.print("&nbsp;&nbsp;&nbsp;&nbsp;<a href='riqi_xiugai.jsp?dy_id="+dy_id+"&dy_mc="+dy_mc+"&sj_id="+sj_id+"'>修改日期</a>");
        out.print("&nbsp;&nbsp;&nbsp;&nbsp;<a href='riqi_del.jsp?dy_id="+dy_id+"&dy_mc="+dy_mc+"&sj_id="+sj_id+"'>删除日期</a><br>");

        //（2）读取 当前日期下的 场次列表
        Statement stmt_sp2 = null;
        ResultSet rs_sp2 = null;
        String sql_sp2 ="select * from  shipin_mulu where mulu_jibie=2 and tushu_id=" + dy_id +" and up_id=" + jibie1_id ;  //查询语句
        stmt_sp2 = conn.createStatement();
        rs_sp2 = stmt_sp2.executeQuery(sql_sp2);
        while (rs_sp2.next()) {
            int changci_id =rs_sp2.getInt("id");
            int ting =rs_sp2.getInt("ting");
            String xinxi_biaoti2 =rs_sp2.getString("xinxi_biaoti");
            out.print("&nbsp;&nbsp;&nbsp;&nbsp;|-"+xinxi_biaoti2 + "（ " + ting +"号厅）");
            out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
            out.print("<a href='changci_xiugai.jsp?dy_id="+dy_id+"&dy_mc="+dy_mc+"&jibie1_id="+jibie1_id+"&changci_id="+changci_id+"'>修改场次</a>");
            out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
            out.print("<a href='changci_del.jsp?dy_id="+dy_id+"&dy_mc="+dy_mc+"&jibie1_id="+jibie1_id+"&changci_id="+changci_id+"'>删除场次</a>");
            out.print("<br>");

        } //while (rs_sp2.next()) {

    }//while (rs_sp1.next()) {
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