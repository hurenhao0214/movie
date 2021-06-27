<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.text.*" %>

<%@ include file="../../conn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>电影添加</title>
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
                                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[电影中心]-[添加电影]</td>
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






                    <form name="example" method="post" action="dy_add_act.jsp">

                        <table width="99%" border="0" cellspacing="1" cellpadding="5" bgcolor="#EAEAEA">

                            <tr>
                                <td bgcolor="#FFFFFF" width="15%" align="center">电影类型</td>
                                <td width="85%" colspan="2" bgcolor="#FFFFFF">

                                    地区
                                    <select name="diqu">
                                        <%
                                            Statement stmt_a1 = null;
                                            ResultSet rs_a1 = null;
                                            String sql_a1 ="select * from dianying_fenlei where caidan_jibie=2  and  caidan_suoshu=269 ";  //查询语句
                                            stmt_a1 = conn.createStatement();
                                            rs_a1 = stmt_a1.executeQuery(sql_a1);
                                            while(rs_a1.next()) {
                                                out.println("<option  value='"+rs_a1.getInt("id")+"'  ");
                                                out.println(">" + rs_a1.getString("caidan_mingcheng") + "</option>");
                                            }
                                        %>
                                    </select>

                                    类型
                                    <select name="leixing">
                                        <%
                                            sql_a1 ="select * from dianying_fenlei where caidan_jibie=2  and  caidan_suoshu=270";  //查询语句
                                            rs_a1 = stmt_a1.executeQuery(sql_a1);
                                            while(rs_a1.next()) {
                                                out.println("<option  value='"+rs_a1.getInt("id")+"'  ");
                                                out.println(">" + rs_a1.getString("caidan_mingcheng") + "</option>");
                                            }
                                        %>
                                    </select>

                                    年代
                                    <select name="niandai">
                                        <%
                                            sql_a1 ="select * from dianying_fenlei where caidan_jibie=2  and  caidan_suoshu=271";  //查询语句
                                            rs_a1 = stmt_a1.executeQuery(sql_a1);
                                            while(rs_a1.next()) {
                                                out.println("<option  value='"+rs_a1.getInt("id")+"'  ");
                                                out.println(">" + rs_a1.getString("caidan_mingcheng") + "</option>");
                                            }
                                        %>
                                    </select>


                                </td>
                            </tr>

                            <tr>
                                <td bgcolor="#FFFFFF" align="center">电影名称</td>
                                <td  colspan="2" bgcolor="#FFFFFF">
                                    <input type="text" name="biaoti" size="70">
                                </td>
                            </tr>

                            <tr>
                                <td bgcolor="#FFFFFF" align="center">电影价格</td>
                                <td  colspan="2" bgcolor="#FFFFFF">
                                    <input type="text" name="sp_jiage" size="5" value="50">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    时长<input type="text" name="shichang" size="5" value="90">分钟
                                </td>
                            </tr>

                            <tr>
                                <td bgcolor="#FFFFFF" align="center">发布日期</td>
                                <td  colspan="2" bgcolor="#FFFFFF">
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
                                <td bgcolor="#FFFFFF" align="center">附加选项</td>
                                <td  colspan="2" bgcolor="#FFFFFF">

                                    <input type="checkbox" name="jianjie_yn" id="ck01" onClick="tuijian();">
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

                                    <input type="checkbox" name="tupian_yn" id="ck02" onClick="slt();" checked>
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

                            <tr  id="tj" style="display:none;">
                                <td bgcolor="#FFFFFF" align="center">推荐简介</td>
                                <td  colspan="2" bgcolor="#FFFFFF">
                                    <textarea name="jianjie" rows="5" cols="70"></textarea>
                                </td>
                            </tr>

                            <tr  id="slt" style="display:;">
                                <td bgcolor="#FFFFFF"  align="center" height="50">缩略图片</td>
                                <td bgcolor="#FFFFFF" width="30%">
                                    <input type="text" name="tupian" id="tupian" size="40">
                                    <!-- 上传 这里 form name="example" 要是是这个，下面就传了返回的字段作为参数；表单名称没有作为参数-->
                                </td>
                                <td bgcolor="#FFFFFF"><iframe frameborder="0" src="../../up.jsp?fmid=tupian" width="100%" height="25"></iframe>
                                </td>
                            </tr>

                            <tr>
                                <td bgcolor="#FFFFFF"  align="center">电影内容</td>
                                <td colspan="2" bgcolor="#FFFFFF">
                                    <textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
                                    <br />
                                    <input type="submit" name="button" value="录入电影内容" />
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