<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求征集清单</title>
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

	
		<%-- <a href="${pageContext.request.contextPath}/Bookservlet?method=selectNeed&id=${UserBean.id}" target="frmright"><button class="btnMy">查找技术需求</button></a> --%>

		<div>
			<table border="1"
				style="border-collapse: collapse; margin: 2px auto 0 auto; font-size: 16px; width: 90%">
				<tr style="background-color: #2993FC; color: #FFFFFF">
					<th>需求编号</th>
					<th>技术需求名称</th>
					<th>填报时间</th>
					<th>需求状态</th>

				</tr>
				<c:forEach items="${needs}" var="item">
					<tr>
						<td>${item.id}</td>
						<td><a
							href="${pageContext.request.contextPath}/Xuqiu/detailNeed.action?id=${item.id}">${item.jishuname}</a></td>

						<td>${item.createdate}</td>
						<td>${item.state}</td>


					</tr>
				</c:forEach>

			</table>
			
				<c:if test="${param.status.equals('1')}">
				<script type="text/javascript">
					alert("删除成功");
					</script>
				</c:if>

			
		</div>
	</div>

</body>
</html>