<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/css/main.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/my.js"></script>
<script type="text/javascript">
	function func() {
		var name = $("#name").val();
		window.location.href = "${pageContext.request.contextPath}/requirementServlet?method=list&status2=1&to=index_list1Requirement&name="
				+ name;
	}
</script>

</head>
<body>
	<div class="mainAction"
		style="text-align: center; align-content: center; background-color: #DCEEFC;">

		<div
			style="text-align: center; align-content: center; background-color: #DCEEFC;">
			<%-- <a href="${pageContext.request.contextPath}/Bookservlet?method=selectNeed&id=${UserBean.id}" target="frmright"><button class="btnMy">查找技术需求</button></a> --%>
			<form
				action="${pageContext.request.contextPath}/Xuqiu/selectNeed.action"
				name="form1" method="post">
				<strong>技术需求名称:</strong> <input type="text" name="name" id="name"
					style="height: 25px; font-size: 16px;" /> <input type="submit"
					name="submit" value="查询" class="btnMy" />&nbsp;&nbsp;&nbsp;&nbsp;

				<input type="submit" name="submit" value="待审核" style="width: 80px;"
					class="btnMy" />&nbsp; <input type="submit" name="submit"
					value="通过审核" style="width: 80px;" class="btnMy" /> <input
					type="submit" name="submit" value="未通过审核" style="width: 80px;"
					class="btnMy" />
			</form>


		</div>
		<hr style="border: none; border-top: 1px solid #838B8B;" />
		<div>

			<c:if test="${param.state == 2}">
				<p style="font-weight: bold; color: #969696;">--------------待审核--------------</p>
				<table border="1"
					style="border-collapse: collapse; margin: 2px auto 0 auto; font-size: 16px; width: 90%">
					<tr style="background-color: #2993FC; color: #FFFFFF">
						<th>需求编号</th>
						<th>技术需求名称</th>
						<th>填报时间</th>
						<th>需求状态</th>
						<th>操作</th>

					</tr>

					<c:forEach items="${needs}" var="item">
						<tr>
							<td>${item.id}</td>
							<td><a
								href="${pageContext.request.contextPath}/Xuqiu/detailNeed.action?id=${item.id}">${item.jishuname}</a></td>

							<td>${item.createdate}</td>
							<td>${item.state}</td>
							<td><a type=""
						href="${pageContext.request.contextPath}/Xuqiu/shenNeed1.action?id=${item.id}"><button
							class="btnMy">审核</button></a></td>
						</tr>
					</c:forEach>

				</table>
			</c:if>
			
			<c:if test="${param.state == 3}">
				<p style="font-weight: bold; color: #969696;">--------------通过审核--------------</p>
				<table border="1"
					style="border-collapse: collapse; margin: 2px auto 0 auto; font-size: 16px; width: 90%">
					<tr style="background-color: #2993FC; color: #FFFFFF">
						<th>需求编号</th>
						<th>技术需求名称</th>
						<th>填报时间</th>
						<th>需求状态</th>
						<th>操作</th>

					</tr>

					<c:forEach items="${needs}" var="item">
						<tr>
							<td>${item.id}</td>
							<td><a
								href="${pageContext.request.contextPath}/Xuqiu/detailNeed.action?id=${item.id}">${item.jishuname}</a></td>

							<td>${item.createdate}</td>
							<td>${item.state}</td>
							<td>无</td>
						</tr>
					</c:forEach>

				</table>
			</c:if>

		<c:if test="${param.state == 4}">
				<p style="font-weight: bold; color: #969696;">--------------未通过审核--------------</p>
				<table border="1"
					style="border-collapse: collapse; margin: 2px auto 0 auto; font-size: 16px; width: 90%">
					<tr style="background-color: #2993FC; color: #FFFFFF">
						<th>需求编号</th>
						<th>技术需求名称</th>
						<th>填报时间</th>
						<th>需求状态</th>
						<th>操作</th>

					</tr>

					<c:forEach items="${needs}" var="item">
						<tr>
							<td>${item.id}</td>
							<td><a
								href="${pageContext.request.contextPath}/Xuqiu/detailNeed.action?id=${item.id}">${item.jishuname}</a></td>

							<td>${item.createdate}</td>
							<td>${item.state}</td>
							<td>无</td>
						</tr>
					</c:forEach>

				</table>
			</c:if>

			<c:if test="${param.state == 5}">
				<p style="font-weight: bold; color: #969696;">--------------查询结果--------------</p>
				<table border="1"
					style="border-collapse: collapse; margin: 2px auto 0 auto; font-size: 16px; width: 90%">
					<tr style="background-color: #2993FC; color: #FFFFFF">
						<th>需求编号</th>
						<th>技术需求名称</th>
						<th>填报时间</th>
						<th>需求状态</th>
						<th>操作</th>

					</tr>

					<tr>
						<td>${need.id}</td>
						<td><a
							href="${pageContext.request.contextPath}/Xuqiu/detailNeed.action?id=${need.id}">${need.jishuname}</a></td>

						<td>${need.createdate}</td>
						<td>${need.state}</td>
						<td>审核</td>

					</tr>

				</table>
			</c:if>
			<c:if test="${param.state.equals('1')}">
				<script type="text/javascript">
					alert("搜索技术名称不能为空");
				</script>
			</c:if>
			<c:if test="${param.status.equals('1')}">
				<script type="text/javascript">
					alert("审核成功");
				</script>
			</c:if>

		</div>
	</div>

</body>
</html>