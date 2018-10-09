<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改审核人员信息</title>
</head>
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
.STYLE3{
	font-family: "宋体";
	font-size: 14px;
	color: #000000;
}
-->
</style>
<script>
function validate(){
	if(form1.U_Name.value==""){
		alert("用户名为空！请重新输入");
		loginform.username.focus();
	}
	else if(form1.U_PW.value==""){
		alert("密码为空！请重新输入");
		loginform.password.focus();
	}
	else if(form1.surPW.value==""){
		alert("请确认密码！确保密码不丢失");
		loginform.surepsw.focus();
	}
	else if(form1.U_PW.value!=form1.surPW.value){
		alert("两次密码输入相异！请重新输入");
	}
	else{
		window.location="U_Edit.jsp";
	}
}
</script>
<form action="action/userEditM.action" method="post" name="form1" >
		<table  width="1050" height="539" border="3" align="center" align="center" class="STYLE3">
		<tr>
		  <td height="60" colspan="9"><div align="left"><span class="STYLE2">审核人员信息修改 <a class="STYLE22">(带<i class="red"> * </i>号的为必填项,信息为以后使用,请认真填写.)</a></span> </div>
	      </td>
  </tr>
  <input name="param" type="hidden" value="1">
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
 <input type="hidden" name="user.who" value="${user.who}">
  <tr>
  <td colspan="4">
  审核人员编号：
  </td>
  <td colspan="5">
  ${user.cid}
  </td>
  </tr>
  <tr>
  <td colspan="4">
  审核人员姓名：
  </td>
  <td colspan="5">
  <input name="user.cname" type="text" id="U_Name" value="${user.cname}">
  </td>
  </tr>
  <tr>
  <td colspan="4">
  审核人员密码：
  </td>
  <td colspan="5">
  <input name="user.password" type="password" id="Password" value="${user.password}">
  </td>
  </tr>
  <tr>
 <td colspan="4">
  确认密码：
  </td>
  <td colspan="5">
  <input name="surepw" type="password" id="surepsw" value="" onchange="validate()">
  </td>
  </tr>
  <tr>
 <td colspan="4">
  审核人员所属部门：
  </td>
  <td colspan="5">
  <input name="user.government" type="text" id="government" value="${user.government}">
  </td>
  </tr>
  <tr>
  <td height="30" colspan="9">
  <p align="center">
			<input type="submit" name="submit" value="确定" onclick="validate()" class="STYLE22" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
			<input type="reset" value="重置" class="STYLE22"style="margin-top:20px;margin-right:60px; color:#ff0000">
    		</p>
  </td>
  </tr>
  </table>
  </form>
</body>
</html>