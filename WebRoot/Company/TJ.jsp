<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>河北省重大技术需求征集系统</title>
<script src="../jquery/jquery2.0.0.min.js"></script>
<script type="text/javascript" src="../js/select.js"></script>
<script>
 
function validate(){
	var a = document.getElementById("T_Keyword1").value;
	var b = document.getElementById("T_Keyword2").value;
	var c = document.getElementById("T_Keyword3").value;
	var d = document.getElementById("T_Keyword4").value;
	var e = document.getElementById("T_Keyword5").value;
	if(a.length>10||b.length>10||c.length>10||d.length>10||e.length>10){
	    document.getElementById("spw").innerText="关键字不得超过10个字符！";
	}
	else{
		document.getElementById("spw").innerText="";
	}
	
}
function show()
{
	var v=document.getElementById("T_Nature").value;
	var t=document.getElementById("area");
	if(v=="基础研究")
	{
		t.style.display="";
	}
	else
	{
		t.style.display="none";
	}
	var t2=document.getElementById("area2");
	if(v=="基础研究")
	{
		t2.style.display="none";
	}
	else
	{
		t2.style.display="";
	}
}
function showValue(evt)
{
	var value=evt.target.value;
	var showBox=document.getElementById("showValue");
	showBox.value=value;
}
</script>
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
  <!-- 技术填报 -->
  <form action="tecEdit.action" method="post" name="form1">
  <s:iterator value="#request.teclist" id="st">
  <input name="param" type="hidden" value="1">
  <input type="hidden" name="tec.cid"class="full" id="cid" value="<s:property value="#st.cid"/>">
  <input type="hidden" name="tec.tid" class="full" id="tid" value="<s:property value="#st.tid"/>">
  <input type="hidden" name="tec.sh" value="等待形式审核通过">
  <input type="hidden" name="tec.bm" value="">
  <input type="hidden" name="tec.csry" value="">
  <input type="hidden" name="tec.zsry" value="">
  <input type="hidden" name="tec.cw" value="">
  <table  width="1050" height="520" border="3" align="center" align="center" class="STYLE2">
  <tr>
    <td colspan="9"><p>河北省重大技术需求修改表</p>
    <p>(带<i class="red"> * </i>号的为必填项,信息为调查使用,请认真填写.)</p>
    </td>
  </tr>
  <tr>
    <td>技术需求名称： <i class="red">*</i></td>
    <td colspan="2"><input name="tec.tname" type="text" id="T_Name"readonly="readonly" value="<s:property value="#st.tname"/>"></td>
  </tr>
  <tr>
    <td>需求时限： <i class="red">*</i></td>
    <td colspan="2">开始年份：<input name="tec.tksnear" type="text" id="T_KSNear" value="<s:property value="#st.tksnear"/>" readonly="readonly" >年
    				结束年份：<input name="tec.tjsnear" type="text" id="T_JSNear" value="<s:property value="#st.tjsnear"/>" readonly="readonly" >年</td>
  </tr>
  <tr>
    <td height="106" rowspan="4">技术需求概述:<i class="red">*</i></td>
    <td width="326" height="52">1、主要问题（需要解决的重大技术问题）<i class="red">*</i></td>
    <td width="486"><textarea name="tec.tsynopsis1" type="text" id="T_Synopsis1" readonly="readonly"
    rows="10" cols="75" >
    <s:property value="#st.tsynopsis1"/>
    </textarea>
</td>
  </tr>
  <tr>
    <td height="52">2、技术关键（所需的关键技术、主要指标）<i class="red">*</i></td>
    <td height="52"><textarea name="tec.tsynopsis2" type="text" id="T_Synopsis2"  readonly="readonly"
    rows="10" cols="75" >
   <s:property value="#st.tsynopsis2"/>
    </textarea>
</td>
  </tr>
  <tr>
    <td height="52">3、预期目标（技术创新性、经济社会效益）</td>
    <td height="52"><textarea name="tec.tsynopsis3" type="text" id="T_Synopsis3" 
    rows="10" cols="75" readonly="readonly">
    <s:property value="#st.tsynopsis3"/>
    </textarea>
    </td>
  </tr>
  <tr>
    <td height="200px">关键字：<i class="red">* （不得少于一个）</i></p><span id="spw" style="display: inline;"></span></td>
    <td colspan="2">
    <p><input name="tec.tkeyword1" type="text" id="T_Keyword1"  value="<s:property value="#st.tkeyword1"/>" readonly="readonly" onkeydown="check(T_Keyword2)" onchange="validate()"></p>
    <p><input name="tec.tkeyword2" type="text" id="T_Keyword2"  value="<s:property value="#st.tkeyword2"/>" readonly="readonly" style="display:none;" onkeydown="check(T_Keyword3)" onchange="validate()"></p>
    <p><input name="tec.tkeyword3" type="text" id="T_Keyword3"  value="<s:property value="#st.tkeyword3"/>" readonly="readonly" style="display:none;" onkeydown="check(T_Keyword4)" onchange="validate()"></p>
    <p><input name="tec.tkeyword4" type="text" id="T_Keyword4"  value="<s:property value="#st.tkeyword4"/>" readonly="readonly" style="display:none;" onkeydown="check(T_Keyword5)" onchange="validate()"></p>
    <p><input name="tec.tkeyword5" type="text" id="T_Keyword5"  value="<s:property value="#st.tkeyword5"/>}" readonly="readonly" style="display:none;"  onchange="validate()"></p>
    </td>
  </tr>
    <tr>
    <td height="50" >拟投入资金总额：<i class="red">*</i></td>
    <td><input name="tec.tcapital" type="text" value="<s:property value="#st.tcapital"/>" id="T_capital" readonly="readonly">万元</td>
  </tr>
  <tr>
    <td>技术需求合作模式：<i class="red">*</i></td>
    <td colspan="2"><input name="tec.tcooperate" type="text" value="<s:property value="#st.tcooperate"/>" readonly="readonly">
    </tr>
  <tr>
    <td height="50" >合作意向单位：</td>
    <td colspan="2"><input name="tec.tcompany" type="text" value="<s:property value="#st.tcompany"/>" id="T_company" readonly="readonly"></td>
  </tr>
  <tr>
    <td>科技活动类型：<i class="red">*</i></td>
    <td colspan="2"><input name="tec.tnature" type="text"  value="<s:property value="#st.tnature"/>" readonly="readonly">
<div style="display:;" id="area">
  <p>学科分类： <i class="red">*</i>
  <input name="tec.classify" type="text"  value="<s:property value="#st.classify"/>" readonly="readonly">
    </div>
<div style="display:none;" id="area2">
  <p>需求技术所属领域： <i class="red">*</i></p>
  <input name="tec.sphere" type="text"  value="<s:property value="#st.sphere"/>" readonly="readonly">
<p>需求技术应用行业：<i class="red">*</i>
<input name="tec.industry" type="text"  value="<s:property value="#st.industry"/>" readonly="readonly">
</div>
  </tr>
  <tr>
    <td height="132" colspan="3"><p align="center">
			<input type="submit" name="submit" value="提交" onclick="star()" class="STYLE2" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
			<input type="reset" value="重置" class="STYLE2"style="margin-top:20px;margin-right:60px; color:#ff0000"></p>
			</td>
  </tr>
  </table>
  </s:iterator>
	</form>
</body>
</html>