<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>河北省重大技术需求征集系统</title>
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
<jsp:useBean id="db" class="needs.DBean" scope="page" />
    <%
		request.setCharacterEncoding("UTF-8");
        String sql="";
        String xksq="";
        String T_ID = request.getParameter("T_ID");
		sql="select C.C_ID,C_Name,C_Nature,T_ID,T_Name,T_KSNear,T_JSNear,T_Synopsis1,T_Synopsis2,T_Synopsis3,T_Keyword1,T_Keyword2,T_Keyword3,T_Keyword4,T_Keyword5,T_Nature,Classify,Sphere,Industry,T_Cooperate,T_capital,T_company from technology T join Company C on T.C_ID=C.C_ID where T_ID='"+T_ID+"'";
		ResultSet rs = db.executeQuery(sql);
		rs.next();
	%> 
<body>		
 <table  width="1050" height="100" border="3" align="center" align="center" class="STYLE2">
		<tr>
    <td colspan="9"><p>河北省重大技术需求征集表</p>
    <p>(带<i class="red"> * </i>号的为必填项,信息为调查使用,请认真填写.)</p>
    </td>
  </tr>
		<tr>
    <td colspan="3">组织结构编码：<i class="red">*</i></td>
    <td colspan="2"><%=rs.getString(1)%></td>
    <td>企业名称：<i class="red">*</i></td>
    <td><%=rs.getString(2)%></td>
    <td>企业属性：<i class="red">*</i></td>
    <td><%=rs.getString(3)%></td>
  </tr>
  </table>
		<table  width="1050" height="520" border="3" align="center" align="center" class="STYLE2">
  <tr>
    <td>技术需求编号： <i class="red">*</i></td>
    <td colspan="2"><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td>技术需求名称： <i class="red">*</i></td>
    <td colspan="2"><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td>需求时限： <i class="red">*</i></td>
    <td colspan="2">开始年份：<%=rs.getString(6)%>年
    				结束年份：<%=rs.getString(7)%>年</td>
  </tr>
  <tr>
    <td height="106" rowspan="4">技术需求概述:<i class="red">*</i></td>
    <td width="326" height="52">1、主要问题（需要解决的重大技术问题）<i class="red">*</i></td>
    <td width="486"><%=rs.getString(8)%></td>
  </tr>
  <tr>
    <td height="52">2、技术关键（所需的关键技术、主要指标）<i class="red">*</i></td>
    <td height="52"><%=rs.getString(9)%></td>
  </tr>
  <tr>
    <td height="52">3、预期目标（技术创新性、经济社会效益）</td>
    <td height="52"><%=rs.getString(10)%></td>
  </tr>
  <tr>
    <td height="200px">关键字：<i class="red">* （不得少于一个）</i></td>
    <td colspan="2">
    <p><%=rs.getString(11)%></p>
    <p><%=rs.getString(12)%></p>
    <p><%=rs.getString(13)%></p>
    <p><%=rs.getString(14)%></p>
    <p><%=rs.getString(15)%></p>
    </td>
  </tr>
  <tr>
    <td>研究类型：<i class="red">*</i></td>
    <td colspan="2">
    <%=rs.getString(16)%>
<div style="display:;" id="area">
  <p>学科分类： <i class="red">*</i>
  <%=rs.getString(17)%>
				</p>
				</div>
<div style="display:none;" id="area2">
  <p>需求技术所属领域： <i class="red">*</i></p>
    <p><%=rs.getString(18)%></p>
<p>需求技术应用行业：<i class="red">*</i>
  <%=rs.getString(19)%>
				</p>
				</div>
  </tr>
  <tr>
    <td>技术需求合作模式：<i class="red">*</i></td>
    <td colspan="2"><%=rs.getString(20)%></td>
  </tr>
  <tr>
    <td height="50" >合作意向单位：</td>
    <td colspan="2"><%=rs.getString(22)%></td>
  </tr>
  <tr>
    <td height="50" >拟投入资金总额：<i class="red">*</i></td>
    <td><%=rs.getString(21)%>万元</td>
  </tr>
  </table>
</body>
</html>