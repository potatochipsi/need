<%@ page language="java" import="whw.*,entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions,java.util.*" 
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showAllRequirement.jsp' starting page</title>
    
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
    <center>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><font color="red">添加需求</font></a><br><br>
		<table width="1000px" border="1" cellspacing="0">
			
			<tr>
				<th>需求编号</th><th>需求名称</th><th>发布机构</th><th>发布时间</th><th>当前状态</th>
			</tr>
			<%
			
				HttpSession session3 = request.getSession();
				String roleId = session3.getAttribute("roleId").toString();
				
				String[] authArray = Service.getAuthIdsByRoleId(roleId);
				
				//可以形式审核
				if(Service.isExit(authArray,"10"))
				{
					//为什么提示重复
					Session session2 = HibernateSessionFactory.getSession();  
					Criteria criteria = session2.createCriteria(RequirementInfo.class);
					criteria.add(Restrictions.eq("nowState","提交待形式审核"));
					List<RequirementInfo> requirementList = criteria.list();
					System.out.println("所有待审核的需求的数量为");
					session2.close();
					Iterator it = requirementList.iterator();
					while(it.hasNext())
					{
						RequirementInfo require = new RequirementInfo();
						require = (RequirementInfo)(it.next());
			 %>
			 <tr>
			 	<td><%=require.getRequirementCoding() %> </td> <td><a href="<%=request.getContextPath() %>/RequirementServlet?action=showDetail&requirementCoding=<%=require.getRequirementCoding() %>"><%=require.getName() %></a> </td>
				<td><%=Service.getInsNameByInsCoding(require.getInstitutionCoding()) %> </td><td><%=require.getAddTime() %></td><td><%=require.getNowState() %></td>
			 </tr>
			 <%
			 		}
			 	}
			 	//可以技术审核
			 	if(Service.isExit(authArray,"20"))
				{
					//为什么提示重复
					Session session2 = HibernateSessionFactory.getSession();  
					Criteria criteria = session2.createCriteria(RequirementInfo.class);
					criteria.add(Restrictions.eq("nowState","形式审核通过待技术审核"));
					List requirementList = criteria.list();
					session2.close();
					Iterator it = requirementList.iterator();
					while(it.hasNext())
					{
						RequirementInfo require = new RequirementInfo();
						require = (RequirementInfo)(it.next());
			 %>
			 <tr>
			 	<td><%=require.getRequirementCoding() %> </td> <td><a href="<%=request.getContextPath() %>/RequirementServlet?action=showDetail&requirementCoding=<%=require.getRequirementCoding() %>"><%=require.getName() %></a> </td>
				<td><%=Service.getInsNameByInsCoding(require.getInstitutionCoding()) %> </td><td><%=require.getAddTime() %></td><td><%=require.getNowState() %></td>
			 </tr>
			 <%
			 		}
			 	}
			 	else
			 	{
			 		System.out.println("输出的信息是232333");
			 		//为什么提示重复
					Session session5 = HibernateSessionFactory.getSession();  
					Criteria criteria = session5.createCriteria(RequirementInfo.class);
					//criteria.add(Restrictions.eq("nowState","提交待形式审核"));
					//criteria.add(Restrictions.eq("nowState","形式审核通过待技术审核"));
					//criteria.add(Restrictions.eq("nowState","技术审核通过"));
					List requirementList = criteria.list();
					session5.close();
					Iterator it = requirementList.iterator();
			 		while(it.hasNext())
					{
						RequirementInfo require = new RequirementInfo();
						require = (RequirementInfo)(it.next());
						if(require != null)
						{
			 %>
			 <tr>
			 	<td><%=require.getRequirementCoding() %> </td> <td><%=require.getName() %></a> </td>
				<td><%=Service.getInsNameByInsCoding(require.getInstitutionCoding()) %> </td><td><%=require.getAddTime() %></td><td><%=require.getNowState() %></td>
			 </tr>
			 <%
			 			}
			 		}
			 	}
			 		
			  %>
		</table>
	</center>
  </body>
</html>
