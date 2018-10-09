<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/main.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/my.js"></script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="text-align: center;background-color: #DCEEFC;">
		<div
			style="text-align: center; align-content: center; background-color: #DCEEFC;">
			<%-- <a href="${pageContext.request.contextPath}/Bookservlet?method=selectNeed&id=${UserBean.id}" target="frmright"><button class="btnMy">查找技术需求</button></a> --%>
			<form
				action="${pageContext.request.contextPath}/Xuqiu/shenNeed2.action?id=${need.id}"
				name="form1" method="post">
				<strong>不通过理由:</strong> <input type="text" name="name" id="name"
					style="height: 25px; font-size: 16px;" /> <input type="submit"
					name="submit" value="不通过" class="btnMy" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit"
					name="submit" value="通过" class="btnMy" />


			</form>


		</div>
		
		<hr style="border: none; border-top: 1px solid #838B8B;" />
<center>
		<table class="table" border="2" cellpadding="10">

			<tr class="form-group">
				<td>机构全称</td>
				<td>${need.name}</td>
				<td>归口管理部门</td>
				<td colspan="5">${need.guanli}</td>

			</tr>
			<tr class="form-group">
				<td>通讯地址</td>
				<td>${need.address}</td>
				<td>所在地域</td>
				<td colspan="5">${need.diyu}</td>

			</tr>
			<tr class="form-group">
				<td>网址</td>
				<td>${need.web}</td>
				<td>电子邮箱</td>
				<td colspan="5">${need.email}</td>
			</tr>
			<tr class="form-group">
				<td>法人代表</td>
				<td>${need.represent}</td>
				<td>邮政编码</td>
				<td colspan="5">${need.zipcode}</td>
			</tr>
			<tr class="form-group">
				<td rowspan="2">联系人</td>
				<td rowspan="2">${need.lianxiren}</td>
				<td>电话</td>
				<td colspan="5">1、固定 ${need.phone}</br> 2、手机 ${need.telephone}
				</td>
			</tr>
			<tr>

				<td>传真</td>
				<td colspan="5">${need.chuanzhen}</td>
			</tr>
			<tr class="form-group">
				<td>机构属性</td>
				<td colspan="5">${need.shuxing}</td>
			</tr>
			<tr class="form-group">
				<td class="td5" colspan="4">1、机构简介(单位基本情况，研究基础，限200字以内)</td>

			</tr>
			<tr class="form-group">
				<td colspan="5">${need.jigoujianjie}</textarea></td>
			</tr>
			<tr class="tr1">
				<td>技术需求名称</td>
				<td>${need.jishuname}</td>
				<td>需求年限</td>
				<td colspan="5">2018.1.11--2020.1.1</td>
			</tr>
			<tr class="tr2">
				<td class="td5" colspan="4">重大科技需求概述(主要内容，技术指标，预期经济和社会效益等，限500字以内)</td>

			</tr>
			<tr class="form-group">
				<td colspan="5">${need.theme}</td>
			</tr>
			<tr>
				<td>关键字:</td>
				<td colspan="4">${need.key}</td>
			</tr>
			<tr>
				<td class="td1">研究类型</td>
				<td colspan="4">${need.type}</td>
			</tr>

		</table>
			<c:if test="${param.status.equals('1')}">
				<script type="text/javascript">
					alert("不通过理由不能为空");
				</script>
			</c:if>
</body>
</html>