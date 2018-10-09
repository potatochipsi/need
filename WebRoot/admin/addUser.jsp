<%@ page language="java" import="entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions,whw.*,java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
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
  		<form method="post" action="<%=request.getContextPath() %>/UserServlet?action=addUserHandin">
   			用户名<br>
  			<input type="text" id="userName" name="userName"/><br>
  			密码<br>
  			<input type="password" id="pwd" name="pwd"/><br>
  			确认密码<br>
  			<input type="password" id="pwdSure" name="pwdSure"/><br>
  			用户所属机构名称<br>
  			<select name="instName">
					<option value="请选择">请选择</option>
					<option value="形式审核所属部门">形式审核所属部门</option>
					<option value="办公室">办公室</option>
					<option value="人事处">人事处</option>
					<option value="机关党委">机关党委</option>
					<option value="政策法规处">政策法规处</option>
					<option value="计划财务处">计划财务处</option>
					<option value="平台与基础处">平台与基础处</option>
					<option value="国际合作处">国际合作处</option>
					<option value="高新技术处">高新技术处</option>
					<option value="农村科技处">农村科技处</option>
					<option value="社会发展处">社会发展处</option>
					<option value="成果与市场处">成果与市场处</option>
					<option value="监察室">监察室</option>
					<option value="离退休干部处">离退休干部处</option>
					<option value="知识产权局">知识产权局</option>
					<option value="半干旱中心">半干旱中心</option>
					<option value="山办">山办</option>
					<option value="机关服务中心">机关服务中心</option>
					<option value="科技研发中心">科技研发中心</option>
					<option value="科技情报研究院">科技情报研究院</option>
					<option value="器材公司">器材公司</option>
					<option value="基金办">基金办</option>
					<option value="档案馆">档案馆</option>
					<option value="科技管理信息中心">科技管理信息中心</option>
					<option value="科技投资中心">科技投资中心</option>
					<option value="成果转换中心">成果转换中心</option>
					<option value="中小企业创新资金管理中心">中小企业创新资金管理中心</option>
					<option value="对外交流中心">对外交流中心</option>
				</select><br/>
  			用户描述<br>
  			<textarea rows="5" cols="80" id="roleDec" name="roleDec"></textarea><br>
  			请您选择该用户对应的角色<select name="role" id="role">
  			<%
  				Session session1 = HibernateSessionFactory.getSession();
  				Criteria criteria = session1.createCriteria(RoleInfo.class);
  				Iterator it = criteria.list().iterator();
  				while(it.hasNext())
  				{
  					RoleInfo role = (RoleInfo)it.next();
  			%>
  				<option value="<%=role.getRoleName() %>"><%=role.getRoleName() %></option>
  				<%
  					}
  					session1.close();
  				 %>
  			</select><br><br>
  			<input type="submit" name="submit" id="btn_submit" value="确认">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
  		</form>
  </body>
</html>
