<%@ page language="java" import="entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions,whw.*,java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showuser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		td
		{
			text-align: center;
		}
	</style>
  </head>
  
  <body>
  	<center>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><font color="red">添加用户</font></a><br><br>
		<table width="1000px" border="1" cellspacing="0">
			<caption>用户信息</caption>
			<tr>
				<th>用户编号</th><th>用户名称</th><th>用户描述</th><th>用户信息</th><th>删除用户</th>
			</tr>
    <%
    	Session session1 = HibernateSessionFactory.getSession();
    	Criteria criteria = session1.createCriteria(UserInfo.class);
    	if(criteria.list().size() > 0)
    	{
    		Iterator it = criteria.list().iterator();
    		while(it.hasNext())
    		{
    			UserInfo user = (UserInfo)it.next();
     %>
     <tr>
		<td><%=user.getUserId() %></td><td><%=user.getUserName() %></t><td><%=user.getUserDec() %></td><td><a href="<%=request.getContextPath()%>/UserServlet?action=showDetail&userId=<%=user.getUserId() %>">查看</a></td><td><a href="<%=request.getContextPath()%>/UserServlet?action=del">删除</a></td>
	 </tr>
	
	<%
			}
		}
	 %>
	 </table>
  </body>
</html>
