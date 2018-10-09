<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showAuth.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">

<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	
		$(function(){
		$("#tree").tree({
			lines:true,
			url:'AuthServlet?action=menu&parentId=-1',
			onLoadSuccess:function(){
				$("#tree").tree('expandAll');
			},
			onClick:function(node){
				
			}
		});
		
		$("#btn_submit").click(function(){
		//alert("hh");
		var a = "";
		var nodes = [];
		nodes = $("#tree").tree("getChecked");
		
		//获取所选权限的id
     	for(var i=0;i<nodes.length;i++){  
        //获取选中节点的值  
         // ids.push(nodes[i].id); 
         a = a +  nodes[i].id + ",";
        // v+=nodes[i].id + ",";  
        //alert(nodes[i].id);   
     	}  
     	
     	$("#role").val(a);
		//var roleName = $("#roleName").val();
		//var roleDec = $("#roleDec").val();
		//alert(roleName+"     "+roleDec);
		//传输数据
		/*$.ajax({
			
			url:"RoleServlet?action=addRoleHandin",
			type:"post",
			dataType:"json",
			data:
			{
				"data":a,
				"roleName":roleName,
				"roleDec":roleDec
			},
			success:function(returnData)
			{
				//alert("数据返回l;a");
				//异步提交请求时该属性失效
				
				window.location.href = "admin/showRole.jsp?page=1";
				return false;
			}
		});*/
		
      });
		
	});
	
	
	
	
</script>
<style type="text/css">
	input
	{
		font-size:16px;
	}
	textarea
	{
		font-size:16px;
	}
</style>		

	

  </head>
  
  <body>
  	
  	<form action="<%=request.getContextPath() %>/RoleServlet?action=addRoleHandin" method="post">
  		角色名称<br>
  		<input type="text" id="roleName" name="roleName"/><br>
  		角色描述<br>
  		<textarea rows="5" cols="80" id="roleDec" name="roleDec"></textarea><br>
  		请您选择该角色对应的权限<br>
  		<div region="center" style="width: 160px;padding: 5px; font-size:20px;" title="导航菜单" split="true">
	
			<ul id="tree" class="easyui-tree" data-options="checkbox:true"></ul>
			<input type="hidden" name="roleId" id="role">
  		</div>
  		<input type="submit" name="submit" id="btn_submit" value="确认">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
  	
  	</form>
  </body>
</html>
