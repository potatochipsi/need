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
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.js">
	</script>
	<script type="text/javascript">
		$(function(){
			$("input:radio[name=checkState]").click(function (){
	
		var type = $("input:radio[name=checkState]:checked").val();
		if(type == "形式审核通过")
		{
			$("#notPass").hide();
			$("#formPass").show();
		}
		else
		{
			$("#notPass").show();
			$("#formPass").hide();
		
		}
	});
		});
	</script>
  </head>
  
  <body>
   <%
		HttpSession webSession = request.getSession();	
		String userName = webSession.getAttribute("userName").toString();
		String name = webSession.getAttribute("name").toString();
		System.out.println("机构名称             "+name);
		RequirementInfo require = (RequirementInfo)request.getAttribute("require");
		String[] keyWord= (String[])request.getAttribute("keyWord");
		
	 %>
	 <center>
	 	 <h3>河北省重大技术需求征集填写</h3>
	 </center>
	
	<fieldset>
		<legend>机构基础信息</legend>
		<br><br>
		
			机构全称<input type="text" readonly="readonly" value="<%=name %>"><br><br>
			用户名<input type="text" readonly="readonly" value="<%=userName %>"><br><br>
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
			关键字:<input type="text" name="key1" width="90px" readonly="readonly" value="<%=keyWord[0] %>">&nbsp;<input type="text" name=key2 width="90px" readonly="readonly" value="<%=keyWord[1] %>">&nbsp;<input type="text" name="key3" width="90px" readonly="readonly" value="<%=keyWord[0] %>">&nbsp;<input type="text" name="key4" width="90px" readonly="readonly" value="<%=keyWord[0] %>">&nbsp;<input type="text" name="key5" width="90px" readonly="readonly" value="<%=keyWord[0] %>"><br><br>
			科技活动类型:<input type="text" name="TechnologyType" readonly="readonly" value="<%=require.getIntroTechnologyKey() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			学科分类 :<input type="text" name="SubjectType" readonly="readonly" value="<%=require.getSubjectType() %>"><br><br>
			技术需求所属领域:<input type="text" name="TechnologyArea" readonly="readonly" value="<%=require.getTechnologyArea() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			技术需求应用行业:<input type="text" name="ApplyIndustury" readonly="readonly" value="<%=require.getApplyIndustry() %>"><br><br>
			技术需求解决方式:<input type="text" name="DealWay" readonly="readonly" value="<%=require.getDealWay() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			合作意向单位:<input type="text" name="TechnologyType" readonly="readonly" value="<%=require.getCooperationIndustry() %>"><br><br>
			需求资金总额:<input type="text" name="TechnologyType" readonly="readonly" value="<%=require.getMoneyNeed() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			拟投入自有资金总额:<input type="text" name="SelfInvestment"><br><br>
			<hr>
			<form name="TechnologyNeed" method="post" action="<%=request.getContextPath() %>/RequirementServlet?action=checkRequireHandin">
			审核状态<br><br>
			<input type="hidden" name="requireCoding" value="<%=require.getRequirementCoding() %> " />
			<input type="radio" id="pass" name="checkState" value="形式审核通过" onclick="showReason"/>通过  &nbsp;&nbsp;&nbsp;
			<input type="radio" id="notpass" name="checkState" value="形式审核未通过" onclick="hideReason"/>未通过<br><br>
			
			<div id="formPass" style="display:none">
				<label>技术审核部门</label>
				<select name="manageDepart">
					<option value="请选择">请选择</option>
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
				</select>
			</div>
			
			<div id="notPass" style="display:none">
			<label name="reason" id="labelReason" >未通过理由</label><br><br>
			<textarea name="reason" id="textReason" cols="130" rows="10" ></textarea><br><br>
			</div>
			
			<input type="submit" value="提交" name="save"/>&nbsp;&nbsp;<input type="reset" value="重置" name="reset">
		</form>
	</fieldset>
  </body>
</html>
					