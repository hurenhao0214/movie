<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.*" %>

<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="conn.jsp"%>
<%--index/index--%>
[
<% 
//初始化设置
int PAGESIZE = 10;   //每页的数据条数，一页放5个
int pageCount = 0;   //总的页数
int curPage = 1;     //当前页数
int shang=0;         //初始化上页数字
int xia = 0;         //初始化下页数字
int size = 0;        //总数据初始化

try{
  String sql = "SELECT * FROM zixun order by id desc limit 3";
  PreparedStatement stat = conn.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
  ResultSet rs = stat.executeQuery();
  rs.last();          //移动到最后一条数据
  size = rs.getRow(); //获得总的数据条数
  pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1); //获得页数，注意余数
  String tmp = request.getParameter("curPage");
  if(tmp==null){
      tmp="1";
  }
  curPage = Integer.parseInt(tmp);
  if(curPage>=pageCount) curPage = pageCount;
  boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);
  //out.println(curPage);   输出到屏幕上
  int count = 0;
   
  do{
      if(count>=PAGESIZE)break;
      int zxid = rs.getInt("id");
      int xinxi_lxid1 = rs.getInt("xinxi_lxid1");
      int xinxi_lxid2 = rs.getInt("xinxi_lxid2");
      
      String xinxi_biaoti = rs.getString("xinxi_biaoti");
      String xinxi_riqi = rs.getString("xinxi_riqi");
      
      int xinxi_jianjie_yn = rs.getInt("xinxi_jianjie_yn");
      String xinxi_jianjie = rs.getString("xinxi_jianjie");
      
      int xinxi_tupian_yn = rs.getInt("xinxi_tupian_yn");
      String xinxi_tupian = rs.getString("xinxi_tupian");        
      
      String xinxi_neirong = rs.getString("xinxi_neirong");
      
      count++;
%>

    {
        "myid" : <%=zxid %>,
        "mybiaoti" : "<%=xinxi_biaoti %>",
        "myshijian" : "<%=xinxi_riqi %>"
    }
    <%
    if(count==3){
    	
    }else{
    	out.println(",");
    }
    %>
    
      <%
  }while(rs.next());

  //关闭节省资源
  stat.close();
  rs.close();
  //pstmt_0.close();
  conn.close();
}
catch(Exception e){
   
}

%>
]
<% conn.close(); %>