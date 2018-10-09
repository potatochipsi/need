<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
</head>
<script>

function validate(){
	var a = document.getElementById("Password").value;
	var b = document.getElementById("surepsw").value;
	if(a!=b){
	    document.getElementById("spw").innerText="请确保密码与确认密码相同！";
	}
	else{
		document.getElementById("spw").innerText="";
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
<form action="action/userEditM.action" method="post" name="form1" >
<table  width="1050" height="150" border="3" align="center" align="center" class="STYLE22">
		<tr>
		  <td height="60" colspan="9"><div align="left"><span class="STYLE2">修改企业登录密码<a class="STYLE22">(带<i class="red"> * </i>号的为必填项,信息为以后使用,请认真填写.)</a></span> </div>
	      </td>
  </tr>
 <tr>
 <input name="param" type="hidden" value="1">
 <input name="user.cid" type="hidden" id="C_ID" value="${user.cid}"/>
 <input name="user.cname" type="hidden" id="cname" value="${user.cname}">
 <input name="user.government" type="hidden" id="government" value="${user.government}">
 <input name="user.address" type="hidden" id="Address" size=40 value="${user.address}">
 <input name="user.internet" type="hidden" id="Internet"  value="${user.internet}">
 <input name="user.email" type="hidden" id="Email"  value="${user.email}">
 <input name="user.people" type="hidden" id="People" value="${user.people}">
 <input name="user.postalcode" type="hidden" id="Postalcode" value="${user.postalcode}">
 <input name="user.linkman" type="hidden" id="Linkman" value="${user.linkman}">
 <input name="user.phone" type="hidden" id="Phone" value="${user.phone}">
 <input name="user.telephone" type="hidden" id="telephone" value="${user.telephone}">
 <input name="user.fax" type="hidden" id="Fax" value="${user.fax}">
 <input type="hidden" name="user.cnature"  value="${user.cnature}"/>
 <input name="user.synopsis" type="hidden" value="${user.synopsis}">
 <input name="user.city" type="hidden" value="${user.city}">
 <input type="hidden" name="user.who" value="1">
 </tr>
 <tr>
    <td colspan="3">登录密码：<i class="red">*</i></td>
    <td colspan="6"><input name="user.password" type="password" id="Password" value="${user.password}">
    </td>
    </tr>
    <tr>
    <td colspan="3">确认密码：<i class="red">*</i></td>
    <td colspan="6"><input name="surepw" type="password" id="surepsw" value="" onchange="validate()">
    <span id="spw" style="display: inline;"></span></td>
  </tr>
  <tr>
    <td colspan="9"><p align="center">
			<input type="submit" name="submit" value="确定" class="STYLE22" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
			<input type="reset" value="重置" class="STYLE22"style="margin-top:20px;margin-right:60px; color:#ff0000">
    		</p>	</td>
  </tr>
  </table>
  </form>
</body>
</html>