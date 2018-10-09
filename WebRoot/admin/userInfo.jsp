<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%
  		HttpSession webSession = request.getSession();
  		String userName = webSession.getAttribute("userName").toString();
  		String name = webSession.getAttribute("name").toString();
  	 %>
  	<center>
    <form method="post" action="UserServlet?action=editHandin">
    	<table border="1" width="1050px" >
    		<caption><%=userName %>信息</caption>
    		<tr>
    			<td>用户名</td><td><input type="text" value="<%=userName %>" disabled="disabled"></td>
    		</tr>
    		<tr>
    			<td>用户所属机构名称</td><td><input type="text" value="<%=name %>" disabled="disabled"></td>
    		</tr>
    		<tr>
    			<td>用户简介</td><td><textarea cols="100" rows="10" disabled="disabled"><%=request.getAttribute("introduction") %></textarea></td>
    		</tr>
    	</table>
    	<input type="button" value="启用编辑">&nbsp;&nbsp;&nbsp;<input type="submit" value="提交" disabled="disabled">
    </form>
    </center>
  </body>
</html>
