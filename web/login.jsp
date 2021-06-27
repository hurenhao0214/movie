<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <style type="text/css">
    <!--
    body {
      margin-left: 20%;
      margin-top: 10%;
      margin-right: auto;
      margin-bottom: auto;
      background-color: #eeeeee;
      background: url("images/back.jpg");
      background-size: cover;
      overflow: hidden;
    }

    .STYLE1 {
      color: #000000;
      font-size: 12px;
    }

    -->
  </style>
  <title>登录网站后台</title>
</head>


<body>
<form name="form1">
  <br><br><br><br><br>
  <table width="100%" height="100%" border="0" cellpadding="auto" cellspacing="auto">
    <tr>
      <td>
        <table>

          <tr>
            <td>
              <%--这一段来修改位置--%>
              <table width="100%" border="0" cellspacing="0px" cellpadding="2px">

                <tr>
                  <td width="100%" height="25">
                    <div align="right"><span class="STYLE1">用户</span></div>
                  </td>
                  <td width="57%" height="25">
                    <div align="center">
                      <input type="text" placeholder="请输入用户名" name="yhm" id="yhm"
                             style="width:120px; height:20px; background-color:#eeeeee; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                    </div>
                  </td>

                </tr>
                <tr>
                  <td height="25">
                    <div align="right"><span class="STYLE1">密码</span></div>
                  </td>
                  <td height="25">
                    <div align="center">
                      <input type="password" placeholder="请输入密码" name="mm" id="mm"
                             style="width:120px; height:20px; background-color:#eeeeee; border:solid 1px #7dbad7; font-size:12px; color:#4a90e2">
                    </div>
                  </td>
                  <td height="25">
                    <div align="left">
                      <input class="denglu" type="button" value="点击登录"
                             onClick="return check_login();"
                             style="border: 7;outline: #eeeeee;margin: 5px;">
                    </div>
                    <script>
                      function check_login() {
                        if (document.form1.yhm.value == "" || document.form1.mm.value == "") {
                          alert("请填写你的账户和密码");
                          return false;
                        }
                        var yhm = document.form1.yhm.value;
                        var mm = document.form1.mm.value;
                        frame01.location = "check_h_login.jsp?cs_yhm=" + yhm + "&cs_mm=" + mm;
                      }
                    </script>
                    <iframe width="0" height="0" frameborder="0" name="frame01" src=""></iframe>
                    <%-- 这一行不能删--%>

                  </td>
                </tr>
              </table>
            </td>

          </tr>
        </table>
      </td>
    </tr>

  </table>
  </td>
  </table>
</form>
</body>
</html>