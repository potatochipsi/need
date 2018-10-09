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
				List<RequirementInfo> requireList = (List<RequirementInfo>)request.getAttribute("requireList");
				if(requireList != null)
				{
					for(RequirementInfo require : requireList)
				{
			 %>
			 <tr>
			 	<td><%=require.getRequirementCoding() %> </td> <td><a href="<%=request.getContextPath() %>/RequirementServlet?action=technologyCheck&requirementCoding=<%=require.getRequirementCoding() %>"><%=require.getName() %></a> </td>
				<td><%=Service.getInsNameByInsCoding(require.getInstitutionCoding()) %> </td><td><%=require.getAddTime() %></td><td><%=require.getNowState() %></td>
			 </tr>
			 <%
			 		}
			 	}
			 %>
		</table>
	</center>
</body>