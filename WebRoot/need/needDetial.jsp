<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/css/main.css">
</head>

<script type="text/javascript">
	function del() {
		if (confirm("是否删除该条需求填报？")) {
			location.href = "${pageContext.request.contextPath}/Xuqiu/deleteneed.action?id=${need.id }";
		} else {
			
		}
	}
</script>

<body>
	<center>
		<table class="table" border="2" cellpadding="10">
			<caption>
				<h2>技术需求申请表</h2>
				<c:if test="${need.state == '提交'}">

					<a type="">已提交，无法更改</a>
				</c:if>

				<c:if test="${need.state == '未提交'}">

					<a type=""
						href="${pageContext.request.contextPath}/Xuqiu/updateNeed.action?id=${need.id}"><button
							class="btnMy">未提交可更改</button></a>
					<button
							class="btnMy" onclick="del()">未提交可删除</button></a>
				</c:if>
			</caption>
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
				<td class="td1">研究类型</td>
				<td colspan="4">${need.type}</td>
			</tr>
		

		</table>
		
</body>
</html>