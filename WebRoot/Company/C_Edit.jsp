<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改企业信息</title>
</head>
<script>
function showError1(){
	var reg = /^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/;
	var a = document.getElementById("Internet").value;

    if(!reg.test(a))
    {
    	document.getElementById("web").innerText="格式错误 ";
    }
    else{
    	document.getElementById("web").innerText="";
    }
} 
function showError2(){
	var reg = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;
	var a = document.getElementById("Email").value;

    if(!reg.test(a))
    {
    	document.getElementById("em").innerText="邮箱格式不正确";
    }
    else{
    	document.getElementById("em").innerText="";
    }
} 
function showError3(){
	var a = document.getElementById("Postalcode").value;
	if(a.length!=6){
	    document.getElementById("pt").innerText="格式错误";
	}
	else{
		document.getElementById("pt").innerText="";
	}
}  
function showError4(){
	var a = document.getElementById("telephone").value;
	if(a.length!=11){
	    document.getElementById("ph").innerText="11位手机号";
	}
	else{
		document.getElementById("ph").innerText="";
	}
} 

function checktext(text) 
{ 
allValid = true; 
for (i = 0; i < text.length; i++) 
{ 
if (text.charAt(i) != " ") 
{ 
allValid = false; 
break; 
} 
} 
return allValid; 
} 

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
function validate(){
	if(form1.username.value==""){
		alert("用户名为空！请重新输入");
		loginform.username.focus();
	}
	else if(form1.postalAdds.value==""){
		alert("通讯地址为必填项！请重新输入");
	}
	else if(form1.lawPeople.value==""){
		alert("法人代表为必填项！请重新输入");
	}
	else if(form1.contacts.value==""){
		alert("联系人为必填项！请重新输入");
	}
	else if(form1.email.value==""){
		alert("电子邮箱为必填项！请重新输入");
	}
	else if(form1.cellphone.value==""){
		alert("手机号为必填项！请重新输入");
	}
	else if(form1.telephone.value==""){
		alert("座机号为必填项！请重新输入");
	}
	else if(form1.faxAds.value==""){
		alert("传真号为必填项！请重新输入");
	}
	else if(form1.InstSx.value==""){
		alert("机构属性为必填项！请重新输入");
	}
	else{
		window.location="index.jsp";
	}
}
function check()
{
	var a = document.getElementById("C_Nature1").value;
	if(a=="企业")
		{
		document.getElementById("C_Nature").checked;
		}
	else if(a=="高等院校")
		{
		document.getElementById("C_Nature").checked;
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
.red{
	color: #ff0000;}
-->
</style>
<body>
	 <form action="action/userEdit.action" method="post" name="form1" > 
	 <input name="param" type="hidden" value="1">
		<table  width="1050" height="539" border="3" align="center" align="center" class="STYLE22">
		<tr>
		  <td height="60" colspan="9"><div align="left"><span class="STYLE2">企业注册信息修改 <a class="STYLE22">(带<i class="red"> * </i>号的为必填项,信息为以后使用,请认真填写.)</a></span> </div>
	      </td>
  </tr>
		<tr>
    <td colspan="3">组织结构编码：<i class="red">*</i></td>
    <td colspan="2"><input type="text" name="user.cid"class="full" id="cid" value="${user.cid }" readonly="readonly"></td>
    <td>企业名称：<i class="red">*</i></td>
    <td><input name="user.cname" type="text" id="C_Name"  value="${user.cname}"></td>
    <input name="user.password" type="hidden" value="${user.password}">
    <input type="hidden" name="user.who" value="1">
    <td>归口单位：<i class="red">*</i></td>
    <td><input name="user.government" type="text" id="City"   value="${user.government}" readonly="readonly"></td>
  </tr>
  <tr>
    <td colspan="3">通讯地址：<i class="red">*</i></td>
    <td colspan="3"><input name="user.address" type="text" id="Address"   value="${user.address}"></td>
  	<td width="165">所在地域：<i class="red">*</i></td>
    <td colspan="2"><input name="user.city" type="text" id="City"   value="${user.city}" readonly="readonly">
    </td>
  </tr>
  <tr>
    <td colspan="3">公司网站：</td>
    <td colspan="2"><input name="user.internet" type="text" id="Internet"    value="${user.internet}"></td>
    <td>电子邮箱：<i class="red">*</i></td>
    <td colspan="3"><input name="user.email" type="text" id="Email"   value="${user.email}"></td>
  </tr>
  <tr>
    <td colspan="3">法人：<i class="red">*</i></td>
    <td colspan="2"><input name="user.people" type="text" id="People"   value="${user.people}"></td>
    <td>邮政编码：</td>
    <td colspan="3"><input name="user.postalcode" type="text" id="Postalcode"   value="${user.postalcode}"></td>
  </tr>
  <tr>
    <td colspan="3" rowspan="2">联系人：<i class="red">*</i></td>
    <td colspan="1" rowspan="2"><input name="user.linkman" type="text" id="Linkman"  value="${user.linkman}"></td>
    <td height="36">电话：</td>
    <td width="89">固定电话：<i class="red">*</i></td>
    <td width="181"><input name="user.phone" type="text" id="Phone"  value="${user.phone}"></td>
    <td width="79">手机：<i class="red">*</i></td>
    <td width="219"><input name="user.telephone" type="text" id="telephone"  value="${user.telephone}"></td>
  </tr>
  <tr>
    <td colspan="2" height="36">传真号码：</td>
    <td colspan="3"><input name="user.fax" type="text" id="Fax"  value="${user.fax}"></td>
  </tr>
  <tr>
    <td colspan="4">企业属性：<i class="red">*</i></td>
    <td colspan="5">
    <input type="text" name="user.cnature"class="full" id="cid" value="${user.cnature }" readonly="readonly">
    </td>
  </tr>
  <tr>
    <td colspan="4">机构简介：<i class="red">*（单位基本情况，研究基础等，限200字）</i></td>
    <td colspan="5"><textarea name="user.synopsis" id="Synopsis"   value="${user.synopsis}" style="height:100px; width:450px">  ${user.synopsis}</textarea></td>
  </tr>
  <tr>
    <td colspan="9"><p align="center">
			<input type="submit" name="submit" value="确定" onclick="validate()" class="STYLE22" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
			<input type="reset" value="重置" class="STYLE22"style="margin-top:20px;margin-right:60px; color:#ff0000">
    		</p>	</td>
  </tr>
		</table>
	</form>
	</body>
	</html>