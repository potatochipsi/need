<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<body>	
  
  <!-- 技术详细信息 -->
  <table  width="1050" height="520" border="3" align="center" align="center" class="STYLE2">
  <s:iterator value="#request.teclist" id="st">
  <tr>
    <td colspan="9"><p>河北省重大技术需求表</p>
    <p>(带<i class="red"> * </i>号的为必填项,信息为调查使用,请认真填写.)</p>
    </td>
  </tr>
  <tr>
    <td>技术需求编号： <i class="red">*</i></td>
    <td colspan="2"><s:property value="#st.tid"/></td>
  </tr>
  <tr>
    <td>技术需求名称： <i class="red">*</i></td>
    <td colspan="2"><s:property value="#st.tname"/></td>
  </tr>
  <tr>
    <td>需求时限： <i class="red">*</i></td>
    <td colspan="2">开始年份：<s:property value="#st.tksnear"/>年<br>
    				结束年份：<s:property value="#st.tjsnear"/>年</td>
  </tr>
  <tr>
    <td height="106" rowspan="4">技术需求概述:<i class="red">*</i></td>
    <td width="326" height="52">1、主要问题（需要解决的重大技术问题）<i class="red">*</i></td>
    <td width="486"><s:property value="#st.tsynopsis1"/></td>
  </tr>
  <tr>
    <td height="52">2、技术关键（所需的关键技术、主要指标）<i class="red">*</i></td>
    <td height="52"><s:property value="#st.tsynopsis2"/></td>
  </tr>
  <tr>
    <td height="52">3、预期目标（技术创新性、经济社会效益）</td>
    <td height="52"><s:property value="#st.tsynopsis3"/></td>
  </tr>
  <tr>
    <td height="200px">关键字：<i class="red">* （不得少于一个）</i><span id="spw" style="display: inline;"></span></td>
    <td colspan="2">
    <p><s:property value="#st.tkeyword1"/></p>
    <p><s:property value="#st.tkeyword2"/></p>
    <p><s:property value="#st.tkeyword3"/></p>
    <p><s:property value="#st.tkeyword4"/></p>
    <p><s:property value="#st.tkeyword5"/></p>
    </td>
  </tr>
    <tr>
    <td height="50" >拟投入资金总额：<i class="red">*</i></td>
    <td><s:property value="#st.tcapital"/>万元
  </tr>
  <tr>
    <td>技术需求合作模式：<i class="red">*</i></td>
    <td colspan="2"><s:property value="#st.tcooperate"/>
    </tr>
  <tr>
    <td height="50" >合作意向单位：</td>
    <td colspan="2"><s:property value="#st.tcompany"/></td>
  </tr>
  <tr>
    <td>科技活动类型：<i class="red">*</i></td>
    <td colspan="2"><s:property value="#st.tnature"/>
<div style="display:;" id="area">
  <p>学科分类： <i class="red">*</i>
  <s:property value="#st.classify"/>
    </div>
<div style="display:none;" id="area2">
  <p>需求技术所属领域： <i class="red">*</i></p>
  <s:property value="#st.sphere"/>
<p>需求技术应用行业：<i class="red">*</i>
<s:property value="#st.industry"/>
</div>
</td>
  </tr>
  <tr>
    <td height="132" colspan="3"><p align="center">
	<a href="XtecQueryTG.action?param=0&tname=${tec.tid}"><button>通过形式审核</button></a>
	<a href="XtecQueryN.action?param=0&tname=${tec.tid}"><button>不通过形式审核</button></a>
	</p>
</td>
  </tr>
  </s:iterator>
  </table>
</body>
</html>