<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>形式审核不通过的原因</title>
<script language="javascript">
function gbcount(message,total,used,remain) 
{ 
	var max; 
	max = total.value; 
	if (message.value.length > max) { 
	message.value = message.value.substring(0,max); 
	used.value = max; 
	remain.value = 0; 
	alert("字数不能超过 500 个字!"); 
	} 
	else { 
	used.value = message.value.length; 
	remain.value = max - used.value; 
	} 
}
</script>
<style type="text/css">
<!--
.STYLE2{
	font-family: "幼圆";
	font-size: 18px;
	color: #000000;
	font-weight: bold;
}
.STYLE22{
	font-family: "幼圆";
	font-size: 18px;
	color: #000000;
}
-->
</style>
</head>
<body>
<form action="tecEdit.action" method="post" name="form1">
<s:iterator value="#request.teclist" id="st">
<input name="param" type="hidden" value="1">
  <input type="hidden" name="tec.cid"class="full" id="cid" value="<s:property value="#st.cid"/>">
  <input type="hidden" name="tec.tid" class="full" id="tid" value="<s:property value="#st.tid"/>">
  <input type="hidden" name="tec.sh" value="形式审核不通过">
  <input type="hidden" name="tec.bm" value="<s:property value="#st.bm"/>">
  <input type="hidden" name="tec.csry" value="${user.cid }">
  <input type="hidden" name="tec.zsry" value="">
		<table  width="1050" height="539" border="3" align="center" align="center" class="STYLE3">
		<tr>
		  <td height="60" colspan="9"><div align="left"><span class="STYLE2">形式审核不通过 <a class="STYLE22">(带<i class="red"> * </i>号的为必填项,信息为以后使用,请认真填写.)</a></span> </div>
	      </td>
  </tr>
  <tr>
  <td colspan="4">
  形式审核不通过的原因：
  </td>
  <td colspan="5">
  <textarea name="tec.cw" type="text" id="cw" 
    rows="10" cols="75" onKeyDown="gbcount(this.form.cw,this.form.total2,this.form.used2,this.form.remain2);" 
    onKeyUp="gbcount(this.form.cw,this.form.total2,this.form.used2,this.form.remain2);" value="${tec.cw }"></textarea>
<p>最多字数： 
<input disabled maxLength="4" name="total2" size="3" value="1000" class="inputtext"> 
已用字数： 
<input disabled maxLength="4" name="used2" size="3" value="0" class="inputtext"> 
剩余字数： 
<input disabled maxLength="4" name="remain2" size="3" value="1000" class="inputtext"></td>
  </tr>
  <tr>
    <td colspan="9">
    <p align="center">
			<input type="submit" name="submit" value="确定" onclick="validate()" class="STYLE22" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
			<input type="reset" value="重置" class="STYLE22"style="margin-top:20px;margin-right:60px; color:#ff0000">
    </p>	
    </td>
  </tr>
  </table>
  <input name="tec.tname" type="text" id="T_Name"readonly="readonly" value="<s:property value="#st.tname"/>">
  <input name="tec.tksnear" type="hidden" id="T_KSNear" value="<s:property value="#st.tksnear"/>" readonly="readonly" >
  <input name="tec.tjsnear" type="hidden" id="T_JSNear" value="<s:property value="#st.tjsnear"/>" readonly="readonly" >
   <input name="tec.tsynopsis1" type="hidden" value="<s:property value="#st.tsynopsis1"/>">
    <input name="tec.tsynopsis2" type="hidden" value="<s:property value="#st.tsynopsis2"/>">
    <input name="tec.tsynopsis3" type="hidden" value="<s:property value="#st.tsynopsis3"/>">
    <p><input name="tec.tkeyword1" type="hidden" id="T_Keyword1"  value="<s:property value="#st.tkeyword1"/>" readonly="readonly" onkeydown="check(T_Keyword2)" onchange="validate()"></p>
    <p><input name="tec.tkeyword2" type="hidden" id="T_Keyword2"  value="<s:property value="#st.tkeyword2"/>" readonly="readonly" style="display:none;" onkeydown="check(T_Keyword3)" onchange="validate()"></p>
    <p><input name="tec.tkeyword3" type="hidden" id="T_Keyword3"  value="<s:property value="#st.tkeyword3"/>" readonly="readonly" style="display:none;" onkeydown="check(T_Keyword4)" onchange="validate()"></p>
    <p><input name="tec.tkeyword4" type="hidden" id="T_Keyword4"  value="<s:property value="#st.tkeyword4"/>" readonly="readonly" style="display:none;" onkeydown="check(T_Keyword5)" onchange="validate()"></p>
    <p><input name="tec.tkeyword5" type="hidden" id="T_Keyword5"  value="<s:property value="#st.tkeyword5"/>}" readonly="readonly" style="display:none;"  onchange="validate()"></p>
    <td><input name="tec.tcapital" type="hidden" value="<s:property value="#st.tcapital"/>" id="T_capital" readonly="readonly">
  <input name="tec.tcooperate" type="hidden" value="<s:property value="#st.tcooperate"/>" readonly="readonly">
   <input name="tec.tcompany" type="hidden" value="<s:property value="#st.tcompany"/>" id="T_company" readonly="readonly">
  <input name="tec.tnature" type="hidden"  value="<s:property value="#st.tnature"/>" readonly="readonly">
  
  <input name="tec.classify" type="hidden"  value="<s:property value="#st.classify"/>" readonly="readonly">
  <input name="tec.sphere" type="hidden"  value="<s:property value="#st.sphere"/>" readonly="readonly">
<input name="tec.industry" type="hidden"  value="<s:property value="#st.industry"/>" readonly="readonly">
  </s:iterator>
  </form>
</body>
</html>