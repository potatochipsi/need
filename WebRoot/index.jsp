<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>河北省重大技术征集系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(login/loginbg.jpg);
	background-repeat: repeat-x;
}
-->
</style>
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript" src="login/refresh.js"></script>
<!-- 回车换行 -->
<script language="javascript" for="document" event="onkeydown">

if(event.keyCode==13 && event.srcElement.type!='button' && event.srcElement.type!='submit' && event.srcElement.type!='reset' && event.srcElement.type!='textarea' && event.srcElement.type!='')

event.keyCode=9; //Tab的键值为9 Enter的键值为13

</script>

<script type="text/javascript">
function fsubmit(obj)
{
	obj.submit();
}
function test()
{
	alert("如果丢失密码，请与0311-85813216电话联系！");
}
</script>
<script type="text/javascript">
	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}
	function MM_preloadImages() { //v3.0
		
		
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}
	function realodpage(){
		//alert(document.getElementById("shuaxin").src);
		$("#shuaxin").attr("src","login/randCode.jsp?"+Math.random());
	}
	function re(){
		setTimeout("realodpage()",10);
	}
	re();
</script>
</head>
<body bgcolor="#FFFFFF"
	onLoad="MM_preloadImages('login/login000_06.jpg','login/loging000_07.jpg')">
	<!-- Save for Web Slices (待切.psd) -->
	<form action="action/userAction.action" method="post" onSubmit="return IMG1_onclick2()" name="loginform">
	<table width="795" height="475" border="0" align="center"
		cellpadding="0" cellspacing="0" id="__01">
		<tr>
			<td colspan="5"><img src="login/login_01.jpg" width="795"
				height="159" alt=""></td>
		</tr>
		<tr>
			<td rowspan="2"><img src="login/login_02.jpg" width="269"
				height="174" alt=""></td>
			<td bgcolor="#CFE5F2"><img src="login/login_03.jpg" width="66"
				height="115" alt=""></td>
			<td colspan="2" bgcolor="#D0E6F3"><table width="100%"
					height="116" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="2" align="left" valign="bottom"><INPUT
							NAME="user.Cname" TYPE="text" CLASS="STYLE1"
							STYLE="width: 180px; height: 17px; border: #336699 1px solid"
							tabindex="1" MAXLENGTH="26" id="username"></td>
					</tr>
					<tr>
						<td height="32" colspan="2" align="left" valign="bottom"><INPUT
							NAME="user.password" TYPE="password" CLASS="STYLE1"
							STYLE="width: 180px; height: 17px; border: #336699 1px solid"
							tabindex="1" MAXLENGTH="26" id="userpassword"></td>
					</tr>
					<tr>
						<td width="50%" height="29" align="left" valign="bottom"><INPUT
							NAME="randcode" TYPE="text" CLASS="STYLE1" onclick="check()"
							STYLE="width: 100px; height: 17px; border: #336699 1px solid"
							tabindex="1" MAXLENGTH="26" id="randcode"></td>
						<td width="50%" align="left" valign="bottom"><img
							src="login/randCode.jsp" id='shuaxin' width="50" height="25">
					</td>
					</tr>
					<tr>
						<td height="30" colspan="1" align="left" valign="bottom">&nbsp;</td>
					</tr>
				</table></td>
			<td rowspan="2"><img src="login/login_05.jpg" width="262"
				height="174" alt=""></td>
		</tr>
		<tr>
			<td colspan="2"><a href="javascript:fsubmit(document.loginform);" onMouseOut="MM_swapImgRestore()"
				onMouseOver="MM_swapImage('Image12','','login/loging000_06.jpg',1)"><img
					src="login/login_06.jpg" name="Image12" width="135" height="59"
					border="0" onClick="IMG1_onclick2()"></a></td>
			<td><a href="#" onMouseOut="MM_swapImgRestore()"
				onMouseOver="MM_swapImage('Image13','','login/loging000_08.png',1)"><img
					src="login/login_09.png" name="Image13" width="129" height="59"
					border="0" onClick="window.location='register.html'"></a></td>
		</tr>
		<tr>
			<td colspan="5"><img src="login/login_08.jpg" alt="" width="795"
				height="141" border="0" usemap="#Map"></td>
		</tr>
		<tr>
			<td><img src="login/&#x5206;&#x9694;&#x7b26;.gif" width="269"
				height="1" alt=""></td>
			<td><img src="login/&#x5206;&#x9694;&#x7b26;.gif" width="66"
				height="1" alt=""></td>
			<td><img src="login/&#x5206;&#x9694;&#x7b26;.gif" width="69"
				height="1" alt=""></td>
			<td><img src="login/&#x5206;&#x9694;&#x7b26;.gif" width="129"
				height="1" alt=""></td>
			<td><img src="login/&#x5206;&#x9694;&#x7b26;.gif" width="262"
				height="1" alt=""></td>
		</tr>
		<tr>
		   <td colspan="5" align="center">
	          <a href="download/Browser.zip">浏览器兼容问题说明</a>
	       </td>
	    </tr>
	</table>
	<!-- End Save for Web Slices -->
</form>
<map name="Map"><area shape="rect" coords="484,16,558,34" href="#"  onclick="test()" target="_self">
</map></body>
<script type="text/javascript">
	function IMG1_onclick2() {
		var user = document.getElementById("username");
		var pwd = document.getElementById("userpassword");
		var randcode = document.getElementById("randcode");
		var url = "dengluServlet?user=" + escape(user.value) + "&pwd="
				+ escape(pwd.value) + "&randcode=" + escape(randcode.value);
		/*if (user.value == "") {
			alert("用户名不能为空");
			
		} else if (pwd.value == "") {
			alert("密码不能为空");
			
		} else if (randcode.value.length != 4) {
			alert("请正确输入验证码！");
			
		} else if (user.value.length > 20 || user.value.length < 6) {
			alert("用户名小于6位或大于20位");

		} else if (pwd.value.length > 20 || pwd.value.length < 6) {
			alert("密码小于6位或大于20位");

		} else if (!isNum(randcode.value)) {
				alert("验证码只能由数字组成!");
				randcode.value = "";
		} else if (CheckCode(user.value) && CheckCode(pwd.value)
					&& CheckCode(randcode.value)) {
				alert("有特殊字符请重新填写！");
				user.value = "";
				pwd.value = "";
				randcode.value = "";
		}else {
				window.location.href = url;
		}*/	
	}
	function CheckCode(s) //有特殊字符为true  
	{
		var containSpecial = RegExp(/[(\ )(\~)(\!)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/);
		return (containSpecial.test(s));
	}
	function isNum(str){
		for (ilen = 0; ilen < str.length; ilen++) {
                if (str.charAt(ilen) < '0' || str.charAt(ilen) > '9') {
                       return false;
                    }
                }
            return true;
	}
</script>
</html>