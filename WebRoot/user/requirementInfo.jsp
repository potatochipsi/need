<%@ page language="java" import="entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions,whw.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>审核需求</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="../js/jquery-1.4.js">
	
	</script>
	
  </head>
  
  <body>
   <%
   		//在jsp页面当中未要使用request.getSession(),直接使用session就行
		String userName = session.getAttribute("userName").toString();
		String name = session.getAttribute("name").toString();
		System.out.println("机构名称             "+name);
		RequirementInfo require = (RequirementInfo)request.getAttribute("require");
		//五个关键字
		String[] keyWord= (String[])request.getAttribute("keyWord");
		for(int i = 0;i < keyWord.length;i++)
		{
			System.out.println(keyWord[i]);
		}
		//把主要问题后面的审核不通过原因去掉
	 %>
	 <center>
	 	 <h3>河北省重大技术需求征集填写</h3>
	 </center>
	
	<fieldset>
		<legend>机构基础信息</legend>
		<br><br>
		<form name="IndustryInfo">
			机构全称<input type="text" readonly="readonly" value="<%=name %>"><br><br>
			用户名<input type="text" readonly="readonly" value="<%=userName %>"><br><br>
		</form>
	</fieldset>
	 <br>
	<fieldset>
		<legend>技术需求基础信息</legend>
		<br><br>
			技术需求编号:<input type="text" name="Num" readonly="readonly" value="<%=require.getRequirementCoding() %>"><br><br>
			技术需求名称:<input type="text" name="Name" readonly="readonly" value="<%=require.getName() %>"><br><br>
			需求时限:<input type="text" name="StartYear" width="105px" readonly="readonly" value="<%=request.getAttribute("startYear") %>">年至<input type="text" name="EndYear" width="105px" readonly="readonly" value="<%=request.getAttribute("endYear") %>">年<br><br>
			技术需求概述<br><br>
			主要问题(限制字数在500以内)<br><textarea cols="130" rows="10" name="Intro_MainProblem" readonly="readonly" ><%=require.getIntroMainProblem() %></textarea><br><br>
			技术关键(限制字数在500以内)<br><textarea cols="130" rows="10" name="Intro_TechnologyKey"readonly="readonly" ><%=require.getIntroTechnologyKey() %></textarea><br><br>
			预期目标(限制字数在500以内)<br><textarea cols="130" rows="10" name="Intro_ExceptGoal" readonly="readonly" ><%=require.getIntroExceptGoal() %></textarea><br><br>
			<%
				if(keyWord.length == 0)
				{
					
			%>
				关键字:<input type="text" name="key1" width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name=key2 width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key3" width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key4" width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key5" width="90px" readonly="readonly" value="<%="未填写" %>"><br><br>
			<%
				}
				else if(keyWord.length == 1)
				{
					
			%>
				关键字:<input type="text" name="key1" width="90px" readonly="readonly" value="<%=keyWord[0] %>">&nbsp;<input type="text" name=key2 width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key3" width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key4" width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key5" width="90px" readonly="readonly" value="<%="未填写" %>"><br><br>
			<%
				}
				else if(keyWord.length == 2)
				{
					
			%>
				关键字:<input type="text" name="key1" width="90px" readonly="readonly" value="<%=keyWord[0] %>">&nbsp;<input type="text" name=key2 width="90px" readonly="readonly" value="<%=keyWord[1] %>">&nbsp;<input type="text" name="key3" width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key4" width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key5" width="90px" readonly="readonly" value="<%="未填写" %>"><br><br>
			<%
				}
				else if(keyWord.length == 3)
				{
					
			%>
				关键字:<input type="text" name="key1" width="90px" readonly="readonly" value="<%=keyWord[0] %>">&nbsp;<input type="text" name=key2 width="90px" readonly="readonly" value="<%=keyWord[1] %>">&nbsp;<input type="text" name="key3" width="90px" readonly="readonly" value="<%=keyWord[2] %>">&nbsp;<input type="text" name="key4" width="90px" readonly="readonly" value="<%="未填写" %>">&nbsp;<input type="text" name="key5" width="90px" readonly="readonly" value="<%="未填写" %>"><br><br>
			<%
				}
				else if(keyWord.length == 4)
				{
					
			%>
				关键字:<input type="text" name="key1" width="90px" readonly="readonly" value="<%=keyWord[0] %>">&nbsp;<input type="text" name=key2 width="90px" readonly="readonly" value="<%=keyWord[1] %>">&nbsp;<input type="text" name="key3" width="90px" readonly="readonly" value="<%=keyWord[2] %>">&nbsp;<input type="text" name="key4" width="90px" readonly="readonly" value="<%=keyWord[3] %>">&nbsp;<input type="text" name="key5" width="90px" readonly="readonly" value="<%="未填写" %>"><br><br>
			<%
				}
				else if(keyWord.length == 5)
				{
					
			%>
				关键字:<input type="text" name="key1" width="90px" readonly="readonly" value="<%=keyWord[0] %>">&nbsp;<input type="text" name=key2 width="90px" readonly="readonly" value="<%=keyWord[1] %>">&nbsp;<input type="text" name="key3" width="90px" readonly="readonly" value="<%=keyWord[2] %>">&nbsp;<input type="text" name="key4" width="90px" readonly="readonly" value="<%=keyWord[3] %>">&nbsp;<input type="text" name="key5" width="90px" readonly="readonly" value="<%=keyWord[4] %>"><br><br>
			<%
				
				}
			 %>
			
			科技活动类型:<input type="text" name="TechnologyType" readonly="readonly" value="<%=require.getIntroTechnologyKey() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			学科分类 :<input type="text" name="SubjectType" readonly="readonly" value="<%=require.getSubjectType() %>"><br><br>
			技术需求所属领域:<input type="text" name="TechnologyArea" readonly="readonly" value="<%=require.getTechnologyArea() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			技术需求应用行业:<input type="text" name="ApplyIndustury" readonly="readonly" value="<%=require.getApplyIndustry() %>"><br><br>
			技术需求解决方式:<input type="text" name="DealWay" readonly="readonly" value="<%=require.getDealWay() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			合作意向单位:<input type="text" name="TechnologyType" readonly="readonly" value="<%=require.getCooperationIndustry() %>"><br><br>
			需求资金总额:<input type="text" name="TechnologyType" readonly="readonly" value="<%=require.getMoneyNeed() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			拟投入自有资金总额:<input type="text" name="SelfInvestment"><br><br>
			<hr>
		当前状态：<%=require.getNowState() %><br>
		备注：<br/>
		<textarea rows="10" cols="120"><%=require.getSelfInvestment() %></textarea>
	</fieldset>
  </body>
</html>
