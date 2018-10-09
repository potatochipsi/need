<%@ page language="java" contentType="text/html; charset=utf-8" import="entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions,java.util.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看我的需求</title>
<style type="text/css">
	td
	{
		text-align: center;
	}
</style>
</head>
<body>
	<center>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><font color="red">添加需求</font></a><br><br>
		<table width="1000px" border="1" cellspacing="0">
			
			<tr>
				<th>需求编号</th><th>需求名称</th><th>发布时间</th><th>当前状态</th> 
			</tr>
			<%
				//为什么提示重复
				Session session2 = HibernateSessionFactory.getSession();  
				Criteria criteria = session2.createCriteria(RequirementInfo.class);
			
				String institutionCoding = request.getAttribute("institutionCoding").toString();
				criteria.add(Restrictions.eq("institutionCoding",institutionCoding));
				List requirementList = criteria.list();
				session2.close();
				Iterator it = requirementList.iterator();
				while(it.hasNext())
				{
					RequirementInfo require = new RequirementInfo();
					require = (RequirementInfo)(it.next());
			 %>
			 <tr>
			 	<td><%=require.getRequirementCoding() %> </td> <td><a href="<%=request.getContextPath() %>/RequirementServlet?action=normalUser&requirementCoding=<%=require.getRequirementCoding() %>"><%=require.getName() %></a> </td>
				<td><%=require.getAddTime() %></td><td><%=require.getNowState() %></td>
			 </tr>
			 <%
			 	}
			  %>
		</table>
	</center>
</body>
</html>