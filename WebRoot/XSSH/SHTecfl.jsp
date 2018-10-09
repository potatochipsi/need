<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>河北省重大技术需求征集系统——查看</title>
<style type="text/css">
<!--
h1,h2,h3,h4,h5,h6 {
	font-family: 楷体, 隶书, 幼圆, 微软雅黑;
	font-weight: bold;
}
.STYLE2 {
	font-family: "幼圆";
	font-size: 18px;
	color: #000000;
	font-weight: bold;
}
.red{
	color: #ff0000;}
-->
</style>
</head>
<body>
	<div class="STYLE2" align="center">
		企业重大技术
	</div>
	<p />
	<div class="STYLE2">
		选择检索条件
	</div>
	<p />
	<table border="1" align="center">
		<tr>
			<th>技术编号</th>
			<th>企业名称</th>
			<th>技术需求名称</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<jsp:useBean id="db" class="needs.DBean" scope="page" />
		<%
			request.setCharacterEncoding("UTF-8");
			String s = "select T_ID,C_Name,T_Name,sh from technology join Company on technology.C_ID=Company.C_ID  where sh like'"
					+"%审核%'";
			ResultSet rs = db.executeQuery(s);
			while (rs.next())
			{
				out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) 
				        + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4)
						+"</td><td><a href='SHTecCK.jsp?T_ID=" + rs.getString(1)
						+ "'>查看详情</a></td></tr>");
			}
			rs.close();
			db.close();
		%>
	</table>
</body>
</html>