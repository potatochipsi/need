<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高级检索</title>
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css" />
</head>

<body style="background-color: #E0F0F8;">
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
							<th>填报日期</th>
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
									<td></td>
								
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