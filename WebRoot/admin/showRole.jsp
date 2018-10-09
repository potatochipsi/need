<%@ page language="java" import="whw.*,entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions,whw.*,java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showRole.jsp' starting page</title>
    
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><font color="red">添加角色</font></a><br><br>
		<table width="1000px" border="1" cellspacing="0">
			<caption>角色信息</caption>
			<tr>
				<th>角色编号</th><th>角色名称</th><th>角色描述</th><th>角色信息</th><th>删除角色</th>
			</tr>
			
    <%
    
    	Page page1 = (Page)request.getAttribute("page");
    	List<Object> dataList = page1.getDataList();
    	if(dataList.size() > 0)
    	{
    		for(int i = 0;i < dataList.size();i++)
    		{
    			RoleInfo role = (RoleInfo)(dataList.get(i));
     %>
     <tr>
		<td><%=role.getRoleId() %></td><td><%=role.getRoleName() %></t><td><%=role.getRoleDec() %></td><td><a href="<%=request.getContextPath()%>/RoleServlet?action=showDetail&roleId=<%=role.getRoleId() %>">查看</a></td><td><a href="<%=request.getContextPath()%>/RoleServlet?action=del">删除</a></td>
	 </tr>
	
	<%
			}
		}
	 %>
	 </table>
	 <form method="post" action="RoleServlet?action=showRole">
	 <br>
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=1">首页</a>
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-1 %>">上一页</a>
	 
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+1 %>">下一页</a>
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getTotalPage() %>">尾页</a>
	 
	 <%
	 	//显示当前页之前的数据
	 	//当前页前面至少还有两页
	 	if(page1.getCurrentPage() == page1.getTotalPage()-1)
	 	{
	 	if(page1.getCurrentPage() - 3 > 0)
	 	{
	 		
	  %>
	  <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-3 %>"><%=page1.getCurrentPage()-3 %></a>
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-2 %>"><%=page1.getCurrentPage()-2 %></a>
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-1 %>"><%=page1.getCurrentPage()-1 %></a>
	 
	 <%
	 	}
	 	//当前页前面不够两页
	 	else
	 	{
	 		//显示当前页之前的所有数据
	 		for(int i = 1;i < page1.getCurrentPage();i++)
	 		{
	 			
	  %>
	  <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=i %>"><%=i %></a>
	  <%
	  		}
	  	}
	  	}
	  	else if(page1.getCurrentPage() == page1.getTotalPage())
	 	{
	 		if(page1.getCurrentPage() - 4 > 0)
	 		{
	 		
	  %>
	  <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-4 %>"><%=page1.getCurrentPage()-4 %></a>
	  <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-3 %>"><%=page1.getCurrentPage()-3 %></a>
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-2 %>"><%=page1.getCurrentPage()-2 %></a>
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-1 %>"><%=page1.getCurrentPage()-1 %></a>
	 
	 <%
	 		}
	 	//当前页前面不够两页
	 		else
	 		{
	 		//显示当前页之前的所有数据
	 			for(int i = 1;i < page1.getCurrentPage();i++)
	 			{
	 			
	  %>
	  <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=i %>"><%=i %></a>
	  <%
	  			}
	  		}
	  	}
	  	else
	 	{
	 		if(page1.getCurrentPage() - 2 > 0)
	 		{
	 		
	  %>
	  <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-2 %>"><%=page1.getCurrentPage()-2 %></a>
	 <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()-1 %>"><%=page1.getCurrentPage()-1 %></a>
	 
	 <%
	 		}
	 	//当前页前面不够两页
	 		else
	 		{
	 		//显示当前页之前的所有数据
	 			for(int i = 1;i < page1.getCurrentPage();i++)
	 			{
	 			
	  %>
	  <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=i %>"><%=i %></a>
	  <%
	  			}
	  		}
	  	}
	   %>
	   <!-- 显示当前页的数据 -->
	   <%=page1.getCurrentPage() %>
	   <%
	  
	   //显示当前页之后的数据
	   //当前页之后至少还有两页的数据 在向后显示两页的数据    从1开始后面还需要显示4条数据
	   if(page1.getCurrentPage() == 1)
	   {
	   		if(page1.getTotalPage() - page1.getCurrentPage() >= 4)
	   		{
	   %>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+1 %>"><%=page1.getCurrentPage()+1 %></a>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+2 %>"><%=page1.getCurrentPage()+2 %></a>
	    <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+3 %>"><%=page1.getCurrentPage()+3 %></a>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+4 %>"><%=page1.getCurrentPage()+4 %></a>
	   
	   <%
	   		}
	   //当前页之后不足两页数据 把当前页之后的数据全部显示出来
	   		else
	  		{
	   			for(int i = page1.getCurrentPage() + 1;i <= page1.getTotalPage();i++)
	   			{
	    %>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=i %>"><%=i %></a>
	   <%
	   			}
	   		}
	   }
	   else if(page1.getCurrentPage() == 2)
	   {
	   		if(page1.getTotalPage() - page1.getCurrentPage() >= 3)
	   		{
	   %>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+1 %>"><%=page1.getCurrentPage()+1 %></a>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+2 %>"><%=page1.getCurrentPage()+2 %></a>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+3 %>"><%=page1.getCurrentPage()+3 %></a>
	   <%
	   		}
	   //当前页之后不足两页数据 把当前页之后的数据全部显示出来
	   		else
	  		{
	   			for(int i = page1.getCurrentPage() + 1;i <= page1.getTotalPage();i++)
	   			{
	    %>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=i %>"><%=i %></a>
	   <%
	   			}
	   		}
	   }
	   else
	   {
	   		if(page1.getTotalPage() - page1.getCurrentPage() >= 2)
	   		{
	   %>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+1 %>"><%=page1.getCurrentPage()+1 %></a>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=page1.getCurrentPage()+2 %>"><%=page1.getCurrentPage()+2 %></a>
	   <%
	   		}
	   //当前页之后不足两页数据 把当前页之后的数据全部显示出来
	   		else
	  		{
	   			for(int i = page1.getCurrentPage() + 1;i <= page1.getTotalPage();i++)
	   			{
	    %>
	   <a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&currentPage=<%=i %>"><%=i %></a>
	   <%
	   			}
	   		}
	   }
	   %>
	   
	   第(<%=page1.getCurrentPage() %>/<%=page1.getTotalPage() %>页)总共<%=page1.getTotalRecord() %>条数据
	
	  跳转到<input type="text" width="10px" name="currentPage"/>页<input type="submit" value="跳转">
	  </form>
  </body>
</html>
