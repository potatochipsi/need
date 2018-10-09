<%@ page language="java" contentType="text/html; charset=utf-8" import="entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.js">
	
</script>

<script type="text/javascript">
	$(function(){
	
		//给当前编辑的文本框动态的添加样式
      		$(":input").focus(
      			function(){
      	 			$(this).addClass("focus");
        			}).keyup(function(){
             		$(this).removeClass("focus");}).blur(function(){
              		$(this).removeClass("focus");
        });
      	
		
      
             
      
      $("#introductionET").show();
       //检测机构名称是否为空
      $("#name").keyup(function(){
      	var name = $("#name").val();
      	if(name.length == 0)
      	{
      		$("#nameET").show();
      		$("#nameET").html("");
      		$("#nameET").html("机构名称为必填项，不能为空");
      	}
      	else
      	{
      		$("#nameET").hide();
      	}
      	
      });
      
       //检测机构名称是否为空
      $("#name").blur(function(){
      	var name = $("#name").val();
      	if(name.length > 0)
      	{
      		$("#nameET").show();
      		$("#nameET").html("");
      		$("#nameET").html("<font color='green'>机构名称格式正确</font>");
      	}
      	else
      	{
      		$("#name").focus();      
      		$("#nameET").show();
      		$("#nameET").html("");
      		$("#nameET").html("机构名称为必填项，不能为空");
      	}
      });
      
      //检测通讯地址是否为空
      $("#comAddress").keyup(function(){
      	var comAddress = $("#comAddress").val();
      	if(comAddress.length == 0)
      	{
      		$("#comAddress").focus();
      		$("#comAddressET").show();
      		$("#comAddressET").html("");
      		$("#comAddressET").html("通讯地址为必填项，不能为空");
      	}
      	else
      	{
      		$("#comAddressET").hide();
      	}
      });
      
      //检测通讯地址是否为空
      $("#comAddress").blur(function(){
      	var comAddress = $("#comAddress").val();
      	if(comAddress.length > 0)
      	{
      		$("#comAddressET").show();
      		$("#comAddressET").html("");
      		$("#comAddressET").html("<font color='green'>通讯地址格式正确</font>");
      	}
      	else
      	{
      		$("#comAddressET").show();
      		$("#comAddressET").html("");
      		$("#comAddressET").html("通讯地址为必填项，不能为空");
      		$("#comAddress").focus();
      	}
      });
      
      //网址框失去焦点的时候验证网址的格式是否正确
      $("#netAddress").keyup(function(){
      	//alert();
      	var comAddress = $("#netAddress").val();
      	var regExp = /^((http|https?|ftp|news):\/\/)?([a-z]([a-z0-9\-]*[\.。])+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)|(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))(\/[a-z0-9_\-\.~]+)*(\/([a-z0-9_\-\.]*)(\?[a-z0-9+_\-\.%=&]*)?)?(#[a-z][a-z0-9_]*)?$/;
      	if(!regExp.test(comAddress))
      	{
      		$("#netAddressET").show();
      		$("#netAddressET").html("");
      		$("#netAddressET").html("网址格式错误");
      	}
      	else
      	{
      		$("#netAddressET").show();
      		$("#netAddressET").html("");
      		$("#netAddressET").html("<font color='green'>网址格式正确</font>");
      	}
      });
      
      //检测所在地域是否为空
      $("#loc").change(function(){
      	var loc =  $("#loc").val();
      	
      	if(loc == "请选择")
      	{
      		$("#locET").show();
      		$("#locET").html("");
      		$("#locET").html("所在地域所在为必填项，不能为空");
      	}
      	else
      	{
      		$("#locET").show();
      		$("#locET").html("");
      		$("#locET").html("<font color='green'>所在地域格式正确</font>");
      	}
      });
      
      
      //检测所在地域是否为空
      $("#loc").blur(function(){
      	var loc =  $("#loc").val();
      	
      	if(loc == "请选择")
      	{
      		$("#loc").focus();
      		$("#locET").show();
      		$("#locET").html("");
      		$("#locET").html("所在地域所在为必填项，不能为空");
      	}
      	else
      	{
      		$("#locET").hide();
       	}
      });
      
      
       //检测电子邮箱是否为空
      $("#email").keyup(function(){
      	var email = $("#email").val();
      	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
      	if(!reg.test(email))
      	{
      		$("#emailET").show();
      		$("#emailET").html("");
      		$("#emailET").html("电子邮箱格式不正确");
      	}
      	else
      	{
      		$("#emailET").show();
      		$("#emailET").html("");
      		$("#emailET").html("<font color='green'>电子邮箱格式正确</font>");
      	}
      });
      
      //检测电子邮箱是否为空
      $("#email").blur(function(){
      	var email = $("#email").val();
      	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
      	if(!reg.test(email))
      	{
      		$("#email").focus();
      		$("#emailET").show();
      		$("#emailET").html("");
      		$("#emailET").html("电子邮箱格式不正确");
      	}
      	else
      	{
      		$("#emailET").show();
      		$("#emailET").html("");
      		$("#emailET").html("<font color='green'>电子邮箱格式正确</font>");
      	}
      });
      
       //检测法人代表是否为空
      $("#corporation").keyup(function(){
      	var corporation = $("#corporation").val();
      	if(corporation.length == 0)
      	{
      		$("#corporationET").show();
      		$("#corporationET").html("");
      		$("#corporationET").html("法人代表为必填项，不能为空");
      	}
      	else
      	{
      		$("#corporationET").hide();
      	}
      });
      
      //检测法人代表是否为空
      $("#corporation").blur(function(){
      	var corporation = $("#corporation").val();
      	if(corporation.length > 0)
      	{
      		$("#corporationET").show();
      		$("#corporationET").html("");
      		$("#corporationET").html("<font color='green'>法人代表格式正确</font>");
      	}
      	else
      	{
      		$("#corporationET").show();
      		$("#corporationET").html("");
      		$("#corporationET").html("法人代表为必填项，不能为空");
      		
      		$("#corporation").focus();
      	}
      });
      
      //检测联系人是否为空
      $("#linkMan").keyup(function(){
      	var linkMan = $("#linkMan").val();
      	if(linkMan.length == 0)
      	{
      		$("#linkManET").show();
      		$("#linkManET").html("");
      		$("#linkManET").html("联系人为必填项，不能为空");
      		
      	}
      	else
      	{
      		$("#linkManET").hide();
      	}
      });
      
      //检测联系人是否为空
      $("#linkMan").blur(function(){
      	var linkMan = $("#linkMan").val();
      	if(linkMan.length > 0)
      	{
      		$("#linkManET").show();
      		$("#linkManET").html("");
      		$("#linkManET").html("<font color='green'>联系人格式正确</font>");
      	}
      	else
      	{
      		$("#linkManET").show();
      		$("#linkManET").html("");
      		$("#linkManET").html("联系人为必填项，不能为空");
      		$("#linkMan").focus();
      	}
      });
      
      //检测组织机构代码是否为空
      $("#InstitutionCoding").blur(function(){
      		var InstitutionCoding = $("#InstitutionCoding").val();
      		if(InstitutionCoding.length == 0)
      		{
      			$("#InstitutionCodingET").show();
      			$("#InstitutionCodingET").html("");
      			$("#InstitutionCodingET").html("<font color='red'>组织机构代码为必填项，不能为空</font>");
      			$("#InstitutionCoding").focus();
      		}	
      });
      
       $("#InstitutionCoding").keyup(function(){
      		var InstitutionCoding = $("#InstitutionCoding").val();
      		if(InstitutionCoding.length == 0)
      		{
      			$("#InstitutionCodingET").show();
      			$("#InstitutionCodingET").html("");
      			$("#InstitutionCodingET").html("<font color='red'>组织机构代码为必填项，不能为空</font>");
      		}
      		else
      		{
      			$("#InstitutionCodingET").hide();
      			$("#InstitutionCodingET").html("");
      		}	
      });
      
      
       //检测手机是否为空
      $("#phone").keyup(function(){
      	var phone = $("#phone").val();
      	if(phone.length == 0)
      	{
      		$("#phoneET").show();
      		$("#phoneET").html("");
      		$("#phoneET").html("手机为必填项，不能为空");
      	}
      	else if(phone.length != 11)
      	{
      		$("#phoneET").show();
      		$("#phoneET").html("");
      		$("#phoneET").html("手机号码的长度是11位");
      	}
      	else
      	{
      		$("#phoneET").hide();
      	}
      });
      
      //检测手机是否为空
      $("#phone").blur(function(){
      	var phone = $("#phone").val();
      	if(phone.length != 11)
      	{
      		$("#phoneET").show();
      		$("#phoneET").html("");
      		$("#phoneET").html("手机号码的长度是11位");
      	}
      	else if(phone.length == 0)
      	{
      		$("#phoneET").show();
      		$("#phoneET").html("");
      		$("#phoneET").html("手机为必填项，不能为空");
      		$("#phone").focus();
      	}
   
      });
      
      
        //检测密码是否为空
      $("#pwd").keyup(function(){
      	var pwd = $("#pwd").val();
      	if(pwd.length == 0)
      	{
      		$("#pwdET").show();
      		$("#pwdET").html("");
      		$("#pwdET").html("密码为必填项，不能为空");
      	}
      	else
      	{
      		$("#pwdET").hide();
      	}
      });
      
      //检测密码是否为空
      $("#pwd").blur(function(){
      	var pwd = $("#pwd").val();
      	if(pwd.length > 0)
      	{
      		$("#pwdET").show();
      		$("#pwdET").html("");
      		$("#pwdET").html("<font color='green'>密码格式正确</font>");
      	}
      	else
      	{
      		$("#pwdET").show();
      		$("#pwdET").html("");
      		$("#pwdET").html("密码不能为空");
      		$("#pwd").focus();
      	}
      });
      
      
      //检测确认密码是否为空
      $("#surePwd").keyup(function(){
      	var pwd = $("#pwd").val();
      	var surePwd = $("#surePwd").val();
      	
      	if(surePwd.length == 0)
      	{
      		$("#surePwdET").show();
      		$("#surePwdET").html("");
      		$("#surePwdET").html("确认密码不能为空");
      		
      	}
      	else if(pwd != surePwd)
      	{
      		$("#surePwdET").show();
      		$("#surePwdET").html("");
      		$("#surePwdET").html("确认密码与确认密码不同");
      		
      	}
      	else
      	{
      		$("#surePwdET").hide();
      		
      	}
      });
      
      
      //检测确认密码是否为空
      $("#surePwd").blur(function(){
      	var pwd = $("#pwd").val();
      	var surePwd = $("#surePwd").val();
      	
      	if(surePwd.length == 0)
      	{
      		$("#surePwdET").show();
      		$("#surePwdET").html("");
      		$("#surePwdET").html("确认密码不能为空");
      		$("#surePwd").focus();
      	}
      	else if(pwd != surePwd)
      	{
      		$("#surePwdET").show();
      		$("#surePwdET").html("");
      		$("#surePwdET").html("确认密码与确认密码不同");
      		$("#surePwd").focus();
      	}
      	else
      	{
      		$("#surePwdET").hide();
      		
      	}
      });
      
      
      //检测机构简介是否为空
      $("#introduction").keyup(function(){
      	var introduction = $("#introduction").val();
      	if(introduction.length <  200)
      	{
      		var l = 200 - introduction.length;
      		$("#introductionET").show();
      		$("#introductionET").html("");
      		$("#introductionET").html("<font color='green'>您还可以输入 </green>"+l+"个字符");
      	}
      	else
      	{
      		var str = introduction.substring(0,200);
      		$("#introduction").val("");
      		$("#introduction").val(str);
      		$("#introductionET").show();
      		$("#introductionET").html("");
      		$("#introductionET").html("您输入的字符已达上限，不能继续输入");
      	}
      });
      
      
      //检测机构简介是否为空
      $("#introduction").blur(function(){
      	var introduction = $("#introduction").val();
      	if(introduction.length == 0)
      	{
      		$("#introduction").focus();
      		$("#introductionET").show();
      		$("#introductionET").html("");
      		$("#introductionET").html("机构简介为必填项不能为 空  ");
      	}
      	else if(introduction.length > 200)
      	{
      		var str = introduction.substring(0,200);
      		$("#introduction").val("");
      		$("#introduction").val(str);
      		$("#introductionET").show();
      		$("#introductionET").html("");
      		$("#introductionET").html("您输入的字符已达上限，不能继续输入");
      	}
      	
      });
	});
	
</script>

<style type="text/css">
	td 
	{  
 		/*white-space: nowrap;*/
 		text-align:center;
	}
	input
	{
		font-size:20px;
		width:390px;
		
	}
	.focus 
	{ 
     background: #caff70;
	} 
	.tabLabel
	{
		width:100px;
	}
	label
	{
		display:none;
		color:red;
	}
	.jianjie
	{
		display:none;
	}
	.buttonInput
	{
		font-size:14px;
	}
</style>
<script type="text/javascript">
	function edit(){
	$("#isEdit").html("");
	$("#isEdit").html("正在编辑");
    var rs = document.querySelectorAll("input[readonly='readonly']");
    for(var i = 0; i < rs.length; i++){
        rs[i].readOnly = false;
    }

    
    var btn_edit = document.getElementById("btn_edit");
    btn_edit.disabled = false;
    
    var tearea = document.getElementById("te");
    tearea.readOnly = false;
    
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的信息</title>
</head>
<body>
	<%
		
		InstitutionInfo institution = (InstitutionInfo)request.getAttribute("institution");
	 %>
	<center>
	<form name="form1" method="post" action="<%=request.getContextPath() %>/UserServlet?action=editHandin">
		
	<table border="1" cellSpacing="0" cellPadding="0" width="1050px" height="500px">
		<caption>
			<br>
			<h2>机构基础信息</h2>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机构名称和组织机构代码是机构标识数据，不允许用户编辑
		</caption>
		
		
		<tr>
			<td class="tabLabel" >*机构全称</td>
			<td style="width:500px;">
				<table>
					<tr>
						<td><input name="name" id="name" type="text" value="<%=institution.getName() %>" readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label id="nameET">错误提示</label></td>
					</tr>
				</table>
			</td>
		
			<td class="tabLabel" >归口管理部门</td>
			<td style="width:500px;">
				<table>
					<tr>
						<td><input name="manageDepart" type="text" value="<%=institution.getManageDepartment() %>" /></td>
					</tr>
					<tr>
						<td><label id="manageDepartET">错误提示</label></td>
					</tr>
				</table>
			</td>
		</tr>
		
		
		
		<tr>
			<td>*通讯地址</td>
			<td>
				<table>
					<tr>
						<td>
							<input type="text" name="loc" id="loc" value="<%=institution.getLoction() %>" />
						</td>
					</tr>
					<tr>
						<td><label id="comAddressET">错误提示</label></td>
					</tr>
				</table>
			</td>
			<td>*所在地域</td>
			<td>
				<table>
					<tr>
						<td>
							<select id="loc" name="loc">
								<%
									String[] areaArray = (String[])request.getAttribute("areaArray");
									for(int i = 0;i < areaArray.length;i++)
									{
								%>
									<option value="<%=areaArray[i] %>"><%=areaArray[i] %></option>
								<% 
									}
								 %>
							</select>
						</td>
					</tr>
					<tr>
						<td><label id="locET">错误提示</label></td>
					</tr>
				</table>
			</td>
		</tr>
		
		
		
		<tr>
			<td>网址</td>
			<td>
				<table>
				<tr>
					<td><input id="netAddress" name="netAddress" type="text" value="<%=institution.getNetAddress() %>" /></td>
				</tr>
				<tr>
					<td><label id="netAddressET">错误提示</label></td>
				</tr>
				</table>
			</td>
			<td>*电子邮箱</td>
			<td>
				<table>
					<tr>
						<td><input id="email" name="email" type="text" value="<%=institution.getEmail() %>" /></td>
					</tr>
					<tr>
						<td><label id="emailET">错误提示</label></td>
					</tr>
				</table>
			</td>
		</tr>
		
		
		<tr>
			<td>*法人代表</td>
			<td>
				<table>
				<tr>
					<td><input id="corporation" name="corporation" type="text" value="<%=institution.getCorporation() %>" /></td>
				</tr>
				<tr>
					<td><label id="corporationET">错误提示</label></td>
				</tr>
				</table>
			</td>
			<td>邮政编码</td>
			<td>
				<table>
				<tr>
					<td><input name="zipCoding" type="text" value="<%=institution.getZipCoding() %>" /></td>
				</tr>
				<tr>
					<td><label id="zipCodingET">错误提示</label></td>
				</tr>
				</table>
			</td>
		</tr>
		
		
		<tr>
			<td>*联系人</td>
			<td>
				<table>
				<tr>
					<td><input id="linkMan" name="linkMan" type="text" value="<%=institution.getLinkMan() %>" /></td>
				</tr>
				<tr>
					<td><label id="linkManET">错误提示</label></td>
				</tr>
				</table>
			</td>
			<td>传真</td>
			<td>
				<table>
				<tr>
					<td><input name="fax" type="text" value="<%=institution.getFax() %>" /></td>
				</tr>
				<tr>
					<td><label id="faxET">错误提示</label></td>
				</tr>
				</table>
			</td>
		</tr>
		
		
		
		<tr>
			<td>固定电话</td>
			<td>
				<table>
				<tr>
					<td><input name="tel" type="text" value="<%=institution.getTel() %>" /></td>
				</tr>
				<tr>
					<td><label id="telET">错误提示</label></td>
				</tr>
				</table>
			</td>
			<td>*手机</td>
			<td>
				<table>
				<tr>
					<td><input id="phone" name="phone" type="text" value="<%=institution.getPhone() %>" /></td>
				</tr>
				<tr>
					<td><label id="phoneET">错误提示</label></td>
				</tr>
				</table>
			</td>
		</tr>
		
		
		
		<tr>
			<td>*机构属性</td>
			<td>
				<table>
				<tr>
					
			<%
				if("企业".equals(institution.getAttribute()))
				{
			%>
			<td>
				<input name="attribute" type="radio" style="width:10px;" value="企业" disabled="disabled" checked="checked"/>企业
  		 		<input name="attribute" type="radio" style="width:10px;" value="高等院校" disabled="disabled"/>高等院校
  		 		<input name="attribute" type="radio" style="width:10px;" value="研究机构" disabled="disabled"/>研究机构
  		 		<input name="attribute" type="radio" style="width:10px;" value="其他" disabled="disabled"/>其他<br><br>
  		 	</td>
  		 	<%
  		 		}
  		 		else if("高等院校".equals(institution.getAttribute()))
  		 		{
  		 	 %>
  		 	 <td>
  		 	 	<input name="attribute" type="radio" style="width:10px;" value="企业" disabled="disabled" />企业
  		 	 	<input name="attribute" type="radio" style="width:10px;" value="高等院校" disabled="disabled" checked="checked"/>高等院校
  		 	 	<input name="attribute" type="radio" style="width:10px;" value="研究机构" disabled="disabled"/>研究机构
  		 	 	<input name="attribute" type="radio" style="width:10px;" value="其他" disabled="disabled"/>其他<br><br>
  		 	 </td>
  		 	 <%
  		 	 	}
  		 	 	else if("研究机构".equals(institution.getAttribute()))
  		 	 	{
  		 	  %>
  		 	  <td>
  		 	  	<input name="attribute" type="radio" style="width:10px;" value="企业" disabled="disabled" />企业
  		 	  	<input name="attribute" type="radio" style="width:10px;" value="高等院校" disabled="disabled" />高等院校
  		 	  	<input name="attribute" type="radio" style="width:10px;" value="研究机构" disabled="disabled" checked="checked"/>研究机构
  		 	 	<input name="attribute" type="radio" style="width:10px;" value="其他" disabled="disabled"/>其他<br><br>
  		 	 </td>
  		 	  <%
  		 	  	}
  		 	  	else if("其他".equals(institution.getAttribute()))
  		 	  	{
  		 	   %>
  		 	   <td>
  		 	  <input name="attribute" type="radio" style="width:10px;" value="企业" disabled="disabled" />企业
  		 	  <input name="attribute" type="radio" style="width:10px;" value="高等院校" disabled="disabled" />高等院校
  		 	  <input name="attribute" type="radio" style="width:10px;" value="研究机构" disabled="disabled" />研究机构
  		 	  <input name="attribute" type="radio" style="width:10px;" value="其他" disabled="disabled" checked="checked"/>其他<br><br>
  		 	  </td>
  		 	  <%
  		 	  }
  		 	  else
  		 	  {
  		 	  }
  		 	  %>
				</tr>
				</table>
			</td>
			<td>*组织机构代码</td>
			<td>
				<table>
				<tr>
					<td><input id="InstitutionCoding" name="institutionCoding" type="text" value="<%=institution.getInstitutionCoding() %>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label id="InstitutionCodingET"></label></td>
				<tr>
				</table>
			</td>
		</tr>
		
		  
		<tr>
			<td>*登录密码</td>
			<td>
				<table>
				<tr>
					<td><input id="pwd" name="pwd" type="password" value="<%=institution.getPwd() %>" /></td>
				</tr>
				<tr>
					<td><label id="pwdET"></label></td>
				<tr>
				</table>
			</td>
			<td>*确认</td>
			<td>
				<table>
				<tr>
					<td><input id="surePwd" name="surePwd" type="password"></td>
				</tr>
				<tr>
					<td><label id="surePwdET"></label></td>
				</tr>
				</table>
			</td>
		</tr>
		
		
		<tr>
			<td>*机构简介</td>
			<td colspan="3">
				<table>
				<tr>
					<td colspan="3"><textarea  name="introduction" id="introduction" rows="10" cols="130" ><%=institution.getIntroduction() %></textarea> </td>
				</tr>
				<tr>
					<td><label id="introductionET" style="diplay:block;"><font color="green">您可以输入200个字符</font></label></td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
	<input type="button" class="buttonInput" style="width:75px;" value="启用编辑" onclick="edit();" />&nbsp;&nbsp;&nbsp;<input type="submit" value="确认编辑" class="buttonInput"  id="btn_edit" style="width:75px;" name="submit">
	</form>
	</center>
</body>
</html>