
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*,java.util.*,com.jspsmart.upload.*" %>



<%
String fmid = request.getParameter("fmid");
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
</head>
<body>
 
<%
try{
 SmartUpload mySmartUpload = new SmartUpload();
mySmartUpload.initialize(pageContext);
mySmartUpload.upload();
//将上传的文件全部保存在/upload目录下
String keepFilePath = request.getRealPath("/")+"/tupian";
if( mySmartUpload.getFiles().getCount()<=0){
 out.print("<script>alert('找不到您要上传的文件!');</script>");
}
for (int i = 0; i < mySmartUpload.getFiles().getCount(); i++) { 
	com.jspsmart.upload.File file = mySmartUpload.getFiles().getFile(i);
 String oldFileName=file.getFileName();
System.out.println("oldFileName="+oldFileName);

String uuid=UUID.randomUUID().toString();
int beginIndex=oldFileName.lastIndexOf(".");
String newFileName=uuid+oldFileName.substring(beginIndex, oldFileName.length());
if (file.isMissing()) continue; 
 System.out.println("size="+file.getSize());
if(file.getSize()<= 10*1024*1024){
file.saveAs(keepFilePath+"/"+newFileName);
 out.print( "<script language='JavaScript'>window.parent.document.example."+fmid+".value='"+"tupian/"+newFileName+"';</script>");
 out.println("<meta http-equiv='refresh' content='1;URL=up.jsp?fmid="+fmid+"' />");
 out.print("文件上传成功!");
} else{
out.print("<script>alert('您上传的文件不能大于10MB！');</script>");
out.print("文件上传失败!");
}
}

}catch(Exception e){
out.print("upload error.");
 e.printStackTrace();
}
 %>
 
</body>
</html>

