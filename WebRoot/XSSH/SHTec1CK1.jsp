<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>形式审核通过</title>
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
  <input type="hidden" name="tec.sh" value="等待技术审核通过">
  
  <input type="text" name="tec.bm"><br/>
  <input type="submit" name="submit" value="确定" onclick="validate()" class="STYLE22" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
  <input type="reset" value="重置" class="STYLE22"style="margin-top:20px;margin-right:60px; color:#ff0000">
			
  <input type="hidden" name="tec.csry" value="${user.cid }">
  <input type="hidden" name="tec.zsry" value="">
  <input type="hidden" name="tec.cw" value="">
 <input name="tec.tname" type="hidden" id="T_Name"readonly="readonly" value="<s:property value="#st.tname"/>">
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