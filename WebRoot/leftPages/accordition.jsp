<%@ page language="java" contentType="text/html; charset=utf-8" import="entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions,whw.*"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/2099/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--框架必需start-->
<script type="text/javascript" src="../js/jquery-1.4.js">
	
</script>
<script type="text/javascript" src="../js/framework.js">
	
</script>
<link href="../css/import_basic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" id="skin" />
<!--框架必需end-->
<script type="text/javascript" src="../js/nav/ddaccordion.js">
	
</script>
<script type="text/javascript" src="../js/text/text-overflow.js">
	
</script>
<style>
a {
	
}

.categoryitems span {
	width: 160px;
}
</style>
<script>
	//打开内页时出现进度条
	$(function() {
		$(".categoryitems a[target*=frmright]").click(function() {
			//showProgressBar();
		});
	});
	function ccc() {
		doAjax("../Removeabc", null, function(rstText) {
			var result = eval('(' + rstText + ')');
			if (result.status == 'OK') {
				alert("查询成功");
				return true;
			} else {
				alert("查询失败");
				return false;
			}
		});
	}

	function getXMLHttpResquest() {
		var request;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else {
			try {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				request = new ActiveXObject("Msxml2.XMLHTTP");
			}
		}
		return request;
	}

	function doAjax(url, params, callBack) {
		var req = getXMLHttpResquest();
		if (req != null) {
			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					if (200 == req.status) {
						callBack(req.responseText);

					} else if (404 == req.status) {
						alert('404-HTTP请求路径错误！');
					} else if (500 == req.status) {
						alert('500-HTTP请求路径错误！');
					}

				}

			};
			req.open("POST", url, true);
			req.setRequestHeader("Content-Type","application/x-www-form-urlencoded;;charset=utf-8");
			req.send(params);
		}
	}
	$(function() {
		var power;
		var html = "";
		$
				.ajax({
					url : "../PowerServlet",
					type : "post",
					dataType : "json",
					success : function(data) {
						$
								.each(
										data,
										function(i, item) {
											power = item.power;
											/* alert(item.xqzj_qx);
											alert(item.xqgl_qx);
											alert(item.yhxx_qx);
											alert(item.yhxg_qx);
											alert(item.xssh_qx);
											alert(item.bmsh_qx);
											alert(item.tjcx_qx); */
											if (power == 1) {
												html += "<li><a href='../templete/yygl.jsp' target='frmright'><span class='text_slice'>用户管理</span></a></li>"
														+ "<li><a onclick='ccc()' href='../templete/jsgl.jsp' target='frmright'><span class='text_slice'>角色管理</span></a></li>"
														+ "<li><a href='../templete/qxgl1.jsp' target='frmright'><span class='text_slice'>权限管理</span></a></li>"
														
														+ "<li><a onclick='ccc()' href='../templete/mywj.jsp' target='frmright'><span class='text_slice'>需求管理</span></a></li>"
														+ "<li><a onclick='ccc()' href='../templete/xssh.jsp' target='frmright'><span class='text_slice'>形式审核</span></a></li>"
														+ "<li><a onclick='ccc()' href='../templete/bmsh.jsp' target='frmright'><span class='text_slice'>部门审核</span></a></li>"
														+ "<li><a onclick='ccc()' href='../templete/tongji.jsp' target='frmright'><span class='text_slice'>统计查询</span></a></li>"
														+ "<li><a href='../yonghu/mmxg.jsp' target='frmright'><span class='text_slice'>修改密码</span></a></li>"
														+ "<li><a href='../templete/xtjs.html' target='frmright'><span class='text_slice'>系统介绍</span></a></li>"
														+ "<li><a href='../templete/bzwj.html' target='frmright'><span class='text_slice'>帮助文件</span></a></li>"
														+ "<li><a href='../templete/cjwtjd.html' target='frmright'><span class='text_slice'>常见问题解答</span></a></li>";
														//$("#category").html(html);	
											}
											else{
											if (item.xqzj_qx == 0) {
													html += "<li><a href='../templete/table.jsp' target='frmright'><span class='text_slice'>需求征集</span></a></li>";
											}
											if (item.xqgl_qx == 0) {
													html += "<li><a onclick='ccc()' href='../templete/mywj.jsp' target='frmright'><span class='text_slice'>需求管理</span></a></li>";
											}
											if (item.yhxx_qx == 0) {
													html += "<li><a href='../yonghu/yhxx.jsp' target='frmright'><span class='text_slice'>用户信息</span></a></li>";
											}
											if (item.yhxg_qx == 0) {
													html += "<li><a href='../yonghu/mmxg.jsp' target='frmright'><span class='text_slice'>修改密码</span></a></li>";
											}
											if (item.xssh_qx == 0) {
													html += "<li><a onclick='ccc()' href='../templete/xssh.jsp' target='frmright'><span class='text_slice'>形式审核</span></a></li>";
											}
											if (item.bmsh_qx == 0) {
													html += "<li><a onclick='ccc()' href='../templete/bmsh.jsp' target='frmright'><span class='text_slice'>部门审核</span></a></li>";
											}
											if (item.tjcx_qx == 0) {
													html += "<li><a onclick='ccc()' href='../templete/tongji.jsp' target='frmright'><span class='text_slice'>统计查询</span></a></li>";
											}
											html += "<li><a href='../templete/xtjs.html' target='frmright'><span class='text_slice'>系统介绍</span></a></li>";
											html += "<li><a href='../templete/bzwj.html' target='frmright'><span class='text_slice'>帮助文件</span></a></li>";
											html += "<li><a href='../templete/cjwtjd.html' target='frmright'><span class='text_slice'>常见问题解答</span></a></li>";
											
											}
											$("#category").html(html);

										});
					}
				});

	});
</script>
<body leftFrame="true">
	<div id="scrollContent">
		<div class="arrowlistmenu">
			<div class="menuheader expandable">系统菜单</div>
			<ul class="categoryitems" id="category">
				<%
					HttpSession webSession = request.getSession();
					Object userName = webSession.getAttribute("userName");
					Object name = webSession.getAttribute("name");
					Object roleId = webSession.getAttribute("roleId");
					if(roleId != null)
					{
						String strRoleId = roleId.toString().trim();
						System.out.println("roleId"+"         "+roleId);
						Session hsession1 = HibernateSessionFactory.getSession();
						Criteria criteria = hsession1.createCriteria(RoleInfo.class);
						criteria.add(Restrictions.eq("roleId",Integer.parseInt(strRoleId))); 
						//根据角色的id找到了相应的角色 获取该角色对应的权限
						if(criteria.list().size() > 0)
						{
							RoleInfo role = (RoleInfo)(criteria.list().get(0));
							String authIds = role.getAuthIds();
							String[] authIdArray = authIds.split(",");
							for(int i = 0;i < authIdArray.length;i++)
							{
								System.out.println(authIdArray[i]);
							}
							//用户能够看到  “用户基础信息管理”这个功能模块
							if(Service.isExit(authIdArray,"2"))
							{
								//用户可以看到“查看基础信息”这个功能这个模块    用户可以编辑基础信息
								if((Service.isExit(authIdArray,"3"))&&(Service.isExit(authIdArray,"4")))
								{
						%>
						<li><a><span>用户基础信息管理</span></a>
							<ul>
								<!-- 传递一个参数表示可以编辑基础信息 -->
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=showDetail&editable=enable&userName=<%=userName.toString() %>&name=<%=name.toString() %>" target="frmright"><span>查看基础信息</span></a></li>
							</ul>
						</li>
						<%
								}
								//用户可以看到“查看基础信息”这个功能这个模块    用户不可以编辑基础信息
								else if((Service.isExit(authIdArray,"3"))&&(!Service.isExit(authIdArray,"4")))
								{
						%>
						<li><a><span>用户基础信息管理</span></a>
							<ul>
								<!-- 通过这个超链接传递一个参数表示不可以编辑我的基础信息 -->
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=showDetail&userName=<%=userName.toString() %>&editable=disable&name=<%=name.toString() %>" target="frmright"><span>查看基础信息</span></a></li>
							</ul>
						</li>
						<%
								}
							}//第一个功能模块的if结束语句
							//用户能够看到  “需求基础信息管理”这个功能模块
							if(Service.isExit(authIdArray,"5"))
							{
								System.out.println("5存在权限管理中");
								//用户拥有“查看我的需求” “添加新的需求”两项功能
								if((Service.isExit(authIdArray,"6")) && (Service.isExit(authIdArray,"7")))
								{
									System.out.println("5,7存在权限管理中");
						%>
						<li><a><span>需求基础信息管理</span></a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/RequirementServlet?action=showRequire&userName=<%=userName.toString() %>&name=<%=name.toString() %>" target="frmright"><span>我的需求</span></a></li>
						<li><a href="<%=request.getContextPath() %>/RequirementServlet?action=addRequire&userName=<%=userName.toString() %>&name=<%=name.toString() %>" target="frmright"><span>添加需求</span></a></li>
					</ul>
				</li> 
			
						<%		}//第二个功能的第一个if结束	
								//用户拥有“查看我的需求” 功能  不能“添加新的需求”
								else if((Service.isExit(authIdArray,"6")) && (!Service.isExit(authIdArray,"7")))
								{
						%>
						<li><a><span>需求基础信息管理</span></a>
							<ul>
								<!-- 传递一个参数过去表示不能在查看需求界面点击查看需求的按钮 -->
								<li><a href="<%=request.getContextPath() %>/RequirementServlet?action=showRequire&userName=<%=userName.toString() %>&name=<%=name.toString() %>" target="frmright"><span>查看我的需求</span></a></li>
							</ul>
						</li> 
						<%
								}//第二个功能的第一个else if
								//用户拥有“添加新的需求”功能       不能 “查看我的需求”
								else if((Service.isExit(authIdArray,"7")) && (!Service.isExit(authIdArray,"6")))
								{
						%>
						<li><a><span>需求基础信息管理</span></a>
							<ul>
								<li><a href="<%=request.getContextPath() %>/RequirementServlet?action=addRequire&name=<%=name.toString() %>" target="frmright"><span>添加需求</span></a></li>
							</ul>
						</li> 
						<%
								}//第二个功能的第二个else if
							}//第二个功能的if语句结束
							//用户可以看到“需求审核管理”这个功能模块
							if(Service.isExit(authIdArray,"8"))
							{
								//用户只能查看所有需求 不能进行形式审核和技术审核
								if((Service.isExit(authIdArray,"9")) && (!Service.isExit(authIdArray,"10")) && (!Service.isExit(authIdArray,"20")))
								{
						%>
							<li><a><span>需求审核管理</span></a>
								<ul>
									<li>
										<a href="<%=request.getContextPath() %>/RequirementServlet?action=showAllRequire&userName=all&name=<%=name.toString() %>" target="frmright"><span>查看所有已提交需求</span></a>
									</li>
								</ul>
							</li> 	
						<%	
								}
								//用户可以查看所有需求 也可以进行形式审核 但是不能进行技术审核
								else if((Service.isExit(authIdArray,"9")) && (Service.isExit(authIdArray,"10")) && (!Service.isExit(authIdArray,"20")))
								{
						%>
							<li><a><span>需求审核管理</span></a>
								<ul>
									<li>
										<a href="<%=request.getContextPath() %>/RequirementServlet?action=showAllRequire&userName=all&name=<%=name.toString() %>" target="frmright"><span>查看所有已提交需求</span></a>
									</li>
								</ul>
							</li> 	
						<%	
								}
								//用户可以查看所有需求 不能形式审核 可以技术审核
								else if((Service.isExit(authIdArray,"9")) && (!Service.isExit(authIdArray,"10")) && (Service.isExit(authIdArray,"20")))
								{
						%>
							<li><a><span>需求审核管理</span></a>
								<ul>
									<li>
										<a href="<%=request.getContextPath() %>/RequirementServlet?action=showAllRequire&userName=all&name=<%=name.toString() %>" target="frmright"><span>查看所有已提交需求</span></a>
										<a href="<%=request.getContextPath() %>/RequirementServlet?action=showTechnologyCheck&userName=all&name=<%=name.toString() %>" target="frmright"><span>技术审核</span></a>
									</li>
								</ul>
							</li> 	
						<%	
								}
								//用户不能查看所有需求 不能形式审核 可以技术审核
								else if((!Service.isExit(authIdArray,"9")) && (!Service.isExit(authIdArray,"10")) && (Service.isExit(authIdArray,"20")))
								{
						%>
							<li><a><span>需求审核管理</span></a>
								<ul>
									<li>
										<a href="<%=request.getContextPath() %>/RequirementServlet?action=showTechnologyCheck&userName=all&name=<%=name.toString() %>" target="frmright"><span>技术审核</span></a>
									</li>
								</ul>
							</li> 	
						<%	
								}
								//用户可以查看所有需求 不能形式审核  不能技术审核
								else if((Service.isExit(authIdArray,"9")) && (!Service.isExit(authIdArray,"10")) && (!Service.isExit(authIdArray,"20")))
								{
						%>
							<li><a><span>需求审核管理</span></a>
								<ul>
									<li>
										<a href="<%=request.getContextPath() %>/RequirementServlet?action=showAllRequire&userName=all&name=<%=name.toString() %>" target="frmright"><span>查看所有已提交需求</span></a>
										<a href="<%=request.getContextPath() %>/RequirementServlet?action=showTechnologyCheck&userName=all&name=<%=name.toString() %>" target="frmright"><span>技术审核</span></a>
									</li>
								</ul>
							</li> 	
						<%	
								}
							}//第三功能的if语句结束
							//用户可以看到角色管理这个功能模块
							if(Service.isExit(authIdArray,"11"))
							{
								//用户拥有“查看所有角色”12 “编辑所有角色”13 “添加角色”14 三项功能
								if((Service.isExit(authIdArray,"12"))&&(Service.isExit(authIdArray,"13"))&&(Service.isExit(authIdArray,"14")))
								{
						 %>
						<li><a><span>角色管理</span></a>
							<ul>
								<li><a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&editable=enable&currentPage=1&name=<%=name.toString() %>" target="frmright"><span>查看所有角色</span></a></li>
								<li><a href="<%=request.getContextPath() %>/RoleServlet?action=addRole&name=<%=name.toString() %>" target="frmright"><span>添加角色</span></a></li>
							</ul>
						 </li>
						 <%
						 		}//第四个功能的第一个if语句结束
						 		//用户拥有“查看所有角色”14 “编辑所有角色”16 不能添加角色
						 		else if((Service.isExit(authIdArray,"12"))&&(Service.isExit(authIdArray,"13"))&&(!Service.isExit(authIdArray,"14")))
						 		{
						 %>
						 <li><span class="text_slice">角色管理</span>
							<ul>
								<!-- 传递一个参数表示可以编辑角色 -->
								<li><a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&editable=enable&currentPage=1&name=<%=name.toString() %>" target="frmright"><span>查看所有角色</span></a></li>
							</ul>
						</li>	
						 <%
						 		}//第四个功能的第一个else if语句结束
						 		//用户拥有“查看所有角色”14 “添加角色”13  不能编辑角色
						 		else if((Service.isExit(authIdArray,"12"))&&(Service.isExit(authIdArray,"14"))&&(!Service.isExit(authIdArray,"13")))
						 		{
						 %>
						 <li><a><span>角色管理</span></a>
							<ul>
								<!-- 传递一个参数过去表示不能编辑角色 -->
								<li><a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&editable=disable&currentPage=1&name=<%=name.toString() %>" target="frmright"><span>查看所有角色</span></a></li>
								<li><a href="<%=request.getContextPath() %>/RoleServlet?action=addRole&name=<%=name.toString() %>" target="frmright"><span>添加角色</span></a></li>
							</ul>
						 </li> 
						 <%
						 		}//第四个功能的第二个else if语句结束
						 		//用户拥有“查看所有角色”14   不能“添加角色”13  不能编辑角色16
						 		else if((Service.isExit(authIdArray,"12"))&&(!Service.isExit(authIdArray,"13"))&&(!Service.isExit(authIdArray,"14")))
						 		{
						 %>
						 <li><span class="text_slice">角色管理</span>
							<ul>
								<!-- 传递一个参数表示不可以编辑角色 -->
								<li><a href="<%=request.getContextPath() %>/RoleServlet?action=showRole&editable=disable&currentPage=1&name=<%=name.toString() %>" target="frmright"><span>查看所有角色</span></a></li>
							</ul>
						</li>
						 <%
						 		}//第四个功能的第三个else if语句结束
						 		//用户拥有“添加角色”14   不能“查看角色”13  不能编辑角色16
						 		else if((!Service.isExit(authIdArray,"12"))&&(!Service.isExit(authIdArray,"13"))&&(Service.isExit(authIdArray,"14")))
						 		{
						  %>
						  <li><span class="text_slice">角色管理</span>
							<ul>
								<!-- 传递一个参数表示不可以编辑角色 -->
								<li><a href="<%=request.getContextPath() %>/RoleServlet?action=addRole&name=<%=name.toString() %>" target="frmright"><span>添加角色</span></a></li>
							</ul>
						  </li>
						  <%
						  		}//第四个功能的第四个else if语句结束
						 	}//第四个功能的if语句结束
						 	//用户可以看到“用户管理这个功能模块” 18查看所有用户信息 20添加审核员 21编辑审核员信息
						 	if(Service.isExit(authIdArray,"15"))
						 	{
						 		//用户拥有   16查看所有用户信息      17添加审核员       18编辑审核员信息
						 		if((Service.isExit(authIdArray,"16")) && (Service.isExit(authIdArray,"17")) && (Service.isExit(authIdArray,"18")))
						 		{
						 %>
						  <li><a><span>用户管理</span></a>
							<ul>
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=showUser&editable=enable&name=<%=name.toString() %>" target="frmright"><span>查看所有用户</span></a></li>
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=addUser&name=<%=name.toString() %>" target="frmright"><span>添加用户</span></a></li>
							</ul>
						 </li>
						 <%
						 		}//第五个功能的第一个if语句结束
						 		//用户拥有   16查看所有用户信息      17添加审核员       不可以18编辑审核员信息
						 		else if((Service.isExit(authIdArray,"16")) && (Service.isExit(authIdArray,"17")) && (!Service.isExit(authIdArray,"18")))
						 		{
						  %>
						 	<li><a><span>用户管理</span></a>
							<ul>
								<!-- 传递一个参数过去表示用户不可以编辑其他用户信息 -->
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=showUser&editable=disable&currentPage=1&name=<%=name.toString() %>" target="frmright"><span>查看所有用户</span></a></li>
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=addUser&name=<%=name.toString() %>" target="frmright"><span>添加用户</span></a></li>
							</ul>
						 </li>
						 <%
						 		}//第五个功能的第一个else if语句结束
						 		//用户拥有   16查看所有用户信息     不可以 17添加审核员       18编辑审核员信息
						 		else if((Service.isExit(authIdArray,"16")) && (!Service.isExit(authIdArray,"17")) && (Service.isExit(authIdArray,"18")))
						 		{
						 %>
						 <li><a><span>用户管理</span></a>
							<ul>
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=showUser&editable=enable&currentPage=1&name=<%=name.toString() %>" target="frmright"><span>查看所有用户</span></a></li>
							</ul>
						 </li>
						 <%
						 		}//第五个功能的第二个else if语句结束
						 		//用户拥有   16查看所有用户信息      不可以17添加审核员       不可以18编辑审核员信息
						 		else if((Service.isExit(authIdArray,"16")) && (!Service.isExit(authIdArray,"17")) && (!Service.isExit(authIdArray,"18")))
						 		{
						  %>
						  <li><a><span>用户管理</span></a>
							<ul>
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=showUser&editable=disable&currentPage=1&name=<%=name.toString() %>" target="frmright"><span>查看所有用户</span></a></li>
							</ul>
						 </li>
						 <%
						 		}//第五个功能的第三个else if语句结束
						 		//用户拥有   不可以16查看所有用户信息      17添加审核员       不可以8编辑审核员信息
						 		else if((!Service.isExit(authIdArray,"16")) && (Service.isExit(authIdArray,"17")) && (!Service.isExit(authIdArray,"18")))
						 		{
						  %>
						  <li><a><span>用户管理</span></a>
							<ul>
								<li><a href="<%=request.getContextPath() %>/UserServlet?action=addUser&name=<%=name.toString() %>" target="frmright"><span>添加用户</span></a></li>
							</ul>
						 </li>
						 <%
						 		}//第五个功能的第四个else if语句结束
							}//第五个功能的if语句结束
						}//criteria.size > 0 if 语句结束
					}//roleId不为null if语句结束
						 %>
			</ul>
		</div>
	</div>
</body>
</html>