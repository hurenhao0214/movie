

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>



<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<style type="text/css">
<!--
*{
	 margin:0; padding:0;
}

-->
</style> 
<title>文件上传</title>
<script>
    function initname(){
      var filename = formname.fileforload.value;
      if(filename == "" || filename == null){
        alert(" 请先选择您要上传的文件");
      }else if(check(filename)){
        alert("只能上传doc,xls,jpg,zip格式的压缩文件");
      }else{
        formname.submit();
      }
    }
    
    function check(filename){
      var index = filename.lastIndexOf(".");
      var endname = filename.substr(index+1);
      var str = "pdf||doc||xls||jpg||DOC||XLS||JPG||ZIP||zip";
      if(str.indexOf(endname)<0){
        return true;
      }else{
        return false;
      }
    }
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form action="up2.jsp?fmid=<%=request.getParameter("fmid")%>" method="post" name="formname" enctype="multipart/form-data">
  请选择图片文件：
  <input name="fileforload" style="height:20px;width:160px" type="file"/>
  <a href="javascript:initname();" style="text-decoration: none;background-color:#0cf;padding:0px 5px;">上传文件</a>
  
</form>

 
</body>
</html>
 