<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高级检索</title>
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"
	type="text/javascript"></script>
	<script
	src="${pageContext.request.contextPath}/static/js/showdate.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
	type="text/javascript"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
   <script type="text/javascript" src="js/jquery-1.4.js"></script>
  <script>
    var num=1;
	function addDiv()
	{
		var div=document.getElementById("div0");
		var node=document.getElementById("div1");
		var cnode=node.cloneNode(true);
		cnode.style.display="";
		if(num<=3)
		{
			div.appendChild(cnode);
			num++;
		}
	}
	function deleteDiv()
	{
		var div=document.getElementById("div0");
		var childs=div.childNodes;
		if(num>1)
		{ 
			div.removeChild(childs[childs.length-1]);
			num--; 
		}
	}
	var num1=1;
	function addDiv1()
	{
		var div=document.getElementById("div2");
		var node=document.getElementById("div3");
		var cnode=node.cloneNode(true);
		cnode.style.display="";
		if(num1<=12)
		{
			div.appendChild(cnode);
			num1++;
		}
	}
	function deleteDiv1()
	{
		var div=document.getElementById("div2");
		var childs=div.childNodes;
		if(num1>1)
		{ 
			div.removeChild(childs[childs.length-1]);
			num1--; 
		}
		
	}
	
	function submit()
	{
		document.form1.submit();
	}
	
	function SetWinHeight(obj) 
	{ 
		var win=window.parent.document.getElementById(obj); 
		if (document.getElementById) 
		{ 
			if (win && !window.opera) 
			{ 
				if (win.contentDocument && win.contentDocument.body.offsetHeight) 
					win.height = win.contentDocument.body.offsetHeight; 
				else if(win.Document && win.Document.body.scrollHeight) 
					win.height = win.Document.body.scrollHeight; 
			} 	
		} 
	} 
  </script>
  <body style="background-color: #E0F0F8;">
  	<form name="form1" action="${pageContext.request.contextPath }/Xuqiu/find1.action" method="post" target="frmright" id="form1">
  		<div style="background-color:#F5F5F5">
  			<h4>输入检索条件:</h4>
				<div id="div0">
					<div>	
						<input type="button" value="+" id="btn1" onclick="addDiv();SetWinHeight('win')">
						<input type="button" value="-" id="btn2" onclick="deleteDiv();SetWinHeight('win')">
						<select style="width:120px" name="firstindex01">
						   <option value="name">机构名称</option>
						   <option value="address">所在地域</option>
						   <option value="shuxing">机构属性</option>
						   <option value="diyu">归口部门</option>
					 	</select>
					 	<input type="text"  size="20" name="firstvalue01">
					 	<select name="firsttype01">
					 		<option value="and">并含</option>
					 		<option value="or">或含</option>
					 		<option value="not">不含</option>
					 	</select>
					 	<input type="text" size="20" name="firstvalue02">
					 	<select name="typefirst01">
						 	<option value="equal">精确</option>
						 	<option value="like">模糊</option>
					 	</select>
					 </div>
				</div>
				<div id="div2">
					<div Style="height:5px"></div>
						<div>
							<input type="button" value="+" id="btn1" onclick="addDiv1();SetWinHeight('win')">
							<input type="button" value="-" id="btn2" onclick="deleteDiv1();SetWinHeight('win')">
							<select style="width:120px" name="firstindex11">
							   
							   <option value="jishuname">需求名称</option>
							   <option value="keyy">关键字</option>
							   <option value="theme">主要问题</option>
							   <option value="type">科技活动类型</option>
							   <option value="email">电子邮箱</option>
						 	</select>
						 	<input type="text"  size="20" name="firstvalue11">
						 	<select name="firsttype11">
						 		<option value="and">并含</option>
					 		<option value="or">或含</option>
					 		<option value="not">不含</option>
						 	</select>
						 	<input type="text" size="20" name="firstvalue12">
						 	<select name="typefirst11">
							 	<option value="equal">精确</option>
							 	<option value="like">模糊</option>
						 	</select>
						 </div>
					</div>
				<div>
					<div style="height:5px"></div>
					<div>
						起始时间:<input type="text" name="time1" id="time1" size="20" onClick="return Calendar('time1');">
					</div>
				</div>
				<div>
					<div style="height:5px"></div>
					<div>
					              截止时间:<input type="text" name="time2" size="20" id="time2" onClick="return Calendar('time2');">
					</div>
				</div>
				<div>
					<div style="height:8px"></div>
					<input name="submit" type="submit" value="检索">
					<input name="submit" type="submit" value="结果中检索">
				</div>
				<br>
  		</div>
  	</form>
  	<div id="div1" style="display:none">
					 	<div Style="height:5px"></div>
					 	<select style="width:66px" name="selecttype01">
					 		<option value="and">并含</option>
					 		<option value="or">或含</option>
					 		<option value="not">不含</option>
					 	</select>
						<select style="width:120px" name="selectindex01">
						    <option value="unitname">机构名称</option>
						   <option value="address">所在地域</option>
						   <option value="jigoushuxing">机构属性</option>
						   <option value="guikoubumen">归口部门</option>
					 	</select>
					 	<input type="text"  size="20" name="selectvalue01">
					 	<select name="selecttype02">
					 		<option value="and">并含</option>
					 		<option value="or">或含</option>
					 		<option value="not">不含</option>
					 	</select>
					 	<input type="text" size="20" name="selectvalue02">
						 <select name="type01">
						 	<option value="equal">精确</option>
						 	<option value="like">模糊</option>
						 </select>
	</div>
	<div id="div3" style="display:none">
				<div Style="height:5px"></div>
					 	<select style="width:66px" name="selecttype11">
					 		<option value="and">并含</option>
					 		<option value="or">或含</option>
					 		<option value="not">不含</option>
					 	</select>
						<select style="width:120px" name="selectindex11">
							   <option value="jishuxuqiumingcheng">需求名称</option>
							   <option value="key1">关键字</option>
							   <option value="mainquestion">主要问题</option>
							   <option value="type">科技活动类型</option>
							   <option value="xuqiujishuyingyonghangye">需求应用行业</option>
					 	</select>
					 	<input type="text" size="20" name="selectvalue11">
					 	<select name="selecttype12">
					 		<option value="and">并含</option>
					 		<option value="or">或含</option>
					 		<option value="not">不含</option>
					 	</select>
					 	<input type="text" name="selectvalue12" size="20">
						 <select name="type11">
						 	<option value="equal">精确</option>
						 	<option value="like">模糊</option>
						 </select>
</div>
<center>
		<div class="row-fluid">
			<div class="col-md-1 "></div>
			<div class="col-md-10 ">
					<table  border="1" style="border-collapse: collapse; margin: 2px auto 0 auto; font-size: 16px; width: 90%">
					<thead>
					<tr style="background-color: #2993FC; color: #FFFFFF">
					<th>需求编号</th>
							<th>需求名称</th>
							<th>研究类型</th>
							<th>需求填报日期</th>
							<th>表单状态</th>
							
						</tr>
					</thead>
					<c:if test="${param.status.equals('1')}">
						<tbody>
							<c:forEach items="${demandBeans}" var="item" varStatus="status">
								<!-- var 定义变量 -->
								<tr>
									<td>${item.id}</td>
									<td>${item.jishuname}</td>
									<td>${item.type }</td>
									
									<td>${item.createdate}</td>
									<td>${item.state}</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
					<c:if test="${param.status.equals('2')}">
						<h3>未检索到内容</h3>
					</c:if>
				</table>
			</div>
		</div>
	</center>
  </body>
</html>
