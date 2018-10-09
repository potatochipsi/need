<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>河北省重大技术需求征集系统——技术审核</title>
<style type="text/css">
<!--
h1,h2,h3,h4,h5,h6 {
	font-family: 楷体, 隶书, 幼圆, 微软雅黑;
	font-weight: bold;
}
.STYLE2 {
	font-family: "幼圆";
	font-size: 18px;
	color: #000000;
	font-weight: bold;
}
.red{
	color: #ff0000;}
-->
</style>
</head>
<body>
	<div class="STYLE2" align="center">
		<caption>企业重大技术</caption>
	</div>
	<p />
	<table border="1" align="center">
		<tr>
			<th>技术编号</th>
			<th>技术需求名称</th>
			<th>企业编号</th>
			<th>开始年限</th>
			<th>结束年限</th>
			<th>关键字</th>
			<th>研究类型</th>
			<th>拟投入资金总额</th>
			<th>操作</th>
		</tr>
		<c:forEach var="tec" items="${tecs }">
			<tr align="center"  height="24px">
				<td width="100">${tec.tid}</td>
				<td width="160">${tec.tname}</td>
				<td width="160">${tec.cid}</td>
				<td width="70">${tec.tksnear }</td>
				<td width="150">${tec.tjsnear }</td>
				<td width="150">${tec.tkeyword1 }&nbsp;&nbsp;${tec.tkeyword2 }&nbsp;&nbsp;${tec.tkeyword3 }&nbsp;&nbsp;${tec.tkeyword4 }&nbsp;&nbsp;${tec.tkeyword5 }</td>
				<td width="150">${tec.tnature }</td>
				<td width="150">${tec.tcapital }</td>
				<td width="120">
					<a href="JtecQuery.action?param=0&tname=${tec.tid}">查看</a>&nbsp;&nbsp;
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>