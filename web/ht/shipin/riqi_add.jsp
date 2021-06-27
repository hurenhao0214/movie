<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.text.*" %>

<%@ include file="../../conn.jsp"%>

<%
int dy_id = Integer.parseInt(request.getParameter("dy_id"));
String dy_mc = request.getParameter("dy_mc");
%>

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
                                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[电影管理]-[<%=dy_mc%>]目录（电影id:<%=dy_id%>）</td>
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






                    <form name="example" method="post" action="riqi_add_act.jsp">

                        <table width="99%" border="0" cellspacing="1" cellpadding="5" bgcolor="#EAEAEA">

                            <tr>
                                <td bgcolor="#FFFFFF" align="center" width="15%">电影日期</td>
                                <td  colspan="2" bgcolor="#FFFFFF" width="85%">
                                    <%
                                        //在引入了Date和sql包时发生的，其主要原因就是sql和Date包中都含有Date类，在引用的时候出现了指向不明确;
                                        //在应用Date类是加入全称，
                                        java.util.Date mydate = new java.util.Date();
                                        SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd");  //一定要转成 年月日格式才能显示
                                        //out.println(ft.format(mydate));
                                    %>
                                    <input type="date" name="riqi" value="<%=ft.format(mydate)%>">
                                </td>
                            </tr>


                            <tr>
                                <td bgcolor="#FFFFFF" align="center">日期说明</td>
                                <td  colspan="2" bgcolor="#FFFFFF">
                                    <input type="text" name="biaoti" size="70" >
                                </td>
                            </tr>


                            <tr>
                                <td bgcolor="#FFFFFF"  align="center">相关备注</td>
                                <td colspan="2" bgcolor="#FFFFFF">
                                    <textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
                                    <br />
                                    <input type="submit" name="button" value="提交内容" /> (提交快捷键日期添加: Ctrl + Enter)
                                    <input type="hidden" name="dy_id" value="<%=dy_id%>" />
                                    <input type="hidden" name="dy_mc" value="<%=dy_mc%>" />
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