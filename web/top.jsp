<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>顶部文件</title>
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
        .STYLE2 {font-size: 9px}
        .STYLE3 {
            color: #033d61;
            font-size: 12px;
        }
        -->
    </style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="70" background="images/main_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="24"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="270" height="24" background="images/high01.jpg">&nbsp;</td>
                        <td width="625" background="images/high02.jpg" align="right">

                        </td>
                        <td width="410">
                            <div align="right"><span class="STYLE1"><span class="STYLE2">■</span> 今天是
<script language=JavaScript>
 today=new Date();
 function initArray(){
     this.length=initArray.arguments.length
     for(var i=0;i<this.length;i++)
         this[i+1]=initArray.arguments[i]  }
 var d=new initArray(
     "星期日",
     "星期一",
     "星期二",
     "星期三",
     "星期四",
     "星期五",
     "星期六");
 document.write(
     "<font color=white style='font-size:9pt;font-family: 宋体'> ",
     today.getMonth()+1,"月",
     today.getDate(),"日 ",
     d[today.getDay()+1],
     "</font>" );
</script>
                </span></div>
                        </td>
                        <td width="21"><img src="images/high03.jpg" width="21" height="24"></td>
                    </tr>
                </table></td>
            </tr>
            <tr>
                <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="270" height="50" background="images/top06.jpg">&nbsp;</td>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="77%" height="25" valign="bottom" style="color:white;">
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
                                            out.print("用户名："+u_name+ " | 用户id：" + u_id + " | 分组id："+u_fzid);
                                        }

                                    %>
                                </td>
                                <td width="220" valign="bottom"  nowrap="nowrap" style="color:white;">

                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="26"><div align="center"><img src="images/main_21.gif" width="26" height="19"></div></td>
                                            <td width="50" height="19">
                                                <div align="center">
                                                    <a href="main.jsp" target="mainFrame"><img src="images/main_12.gif" width="49" height="19"></a>
                                                </div>
                                            </td>
                                            <td width="100">
                                                <div align="center">
                                                    <a href="ht/QuanXian/mima.jsp" target="I2"><img src="images/main_22.gif" width="98" height="19"></a>
                                                </div>
                                            </td>
                                            <td width="50"><div align="center"><a href="logout.jsp"  target="I2"><img src="images/main_20.gif" width="48" height="19" border="0"></a></div></td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table></td>
                        <td width="21"><img src="images/right01.jpg" width="21" height="38"></td>
                    </tr>
                </table></td>
            </tr>
            <tr>

            </tr>
        </table></td>
    </tr>
    <tr>
        <td height="28" background="images/main_36.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="177" height="28" background="images/main_32.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="20%"  height="22">&nbsp;</td>
                        <td width="59%" valign="bottom"><div align="center" class="STYLE1">影院后台管理系统</div></td>
                        <td width="21%">&nbsp;</td>
                    </tr>
                </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>


                        <%
                            Statement stmt = null;
                            ResultSet rs = null;
                            String sql ="select * from quanxian_fenzu where id="+u_fzid;  //查询语句
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);
                            if (rs.next()) {
                                //out.println(rs.getString("quanxian_1") + " | "); //将数据库表格查询结果输出
                                String Array1[] = rs.getString("quanxian_1").split(",");
                                //for( int j = 1; j < Array1.length-1; j++ ) {
                                for( int j = 1; j < Array1.length; j++ ) {
                                    //out.println(Array1[j]);  //每个成员是1级权限的数字id
                                    //根据菜单的数字id，读取菜单名称

                                    Statement stmt_cdmc = null;
                                    ResultSet rs_cdmc = null;
                                    String sql_cdmc ="select * from quanxian_caidan where id="+Array1[j];
                                    stmt_cdmc = conn.createStatement();
                                    rs_cdmc = stmt_cdmc.executeQuery(sql_cdmc);
                                    if(rs_cdmc.next()){
                                        //out.println(rs_cdmc.getString("caidan_mingcheng")+ " | ");
                        %>
                        <td width="65" height="28">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="23" valign="bottom">
                                        <table width="58" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td height="20" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#a6d0e7'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
                                                    <div align="center" class="STYLE3">

                                                        <%
                                                            out.println("<a href='left.jsp?int_qx_id1="+Array1[j]+"&str_mc="+rs_cdmc.getString("caidan_mingcheng")+"' target='I1'>");
                                                            out.println(rs_cdmc.getString("caidan_mingcheng"));
                                                            out.println("</a>");
                                                        %>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="3"><img src="images/main_34.gif" width="3" height="28"></td>

                        <%
                                    }

                                }
                            }

                        %>










                        <td>&nbsp;</td>
                    </tr>
                </table></td>
                <td width="21"><img src="images/main_37.gif" width="21" height="28"></td>
            </tr>
        </table></td>
    </tr>
</table>
</body>
</html>
