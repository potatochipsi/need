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
      $(":input").focus(function(){
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
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
</head>
<body>
	
	<center>
	<form name="form1" method="post" action="<%=request.getContextPath() %>/RegisterServlet?action=register">
	<!-- action="<%=request.getContextPath() %>/RegisterServlet?action=registerHandin" -->
	<table border="1" cellSpacing="0" cellPadding="0" width="1050px" height="500px">
		<caption>
			<h2>用户注册</h2>
				带*为必填项，不带*为非必填项
		</caption>
		
	
		<tr>
			<td class="tabLabel" >*机构全称</td>
			<td style="width:500px;">
				<table>
					<tr>
						<td><input name="name" id="name" type="text"/></td>
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
						<td>
							<select name="manageDepart" id="manageDepart">
								<option value="石家庄市科技局">请选择</option>
								<option value="石家庄市科技局">石家庄市科技局</option>
								<option value="唐山市科技局">唐山市科技局</option>
								<option value="秦皇岛市科技局">秦皇岛市科技局</option>
								<option value="邯郸市科技局">邯郸市科技局</option>
								<option value="邢台市科技局">邢台市科技局</option>
								<option value="保定市科技局">保定市科技局</option>
								<option value="张家口市科技局">张家口市科技局</option>
								<option value="承德市科技局">承德市科技局</option>
								<option value="沧州市科技局">沧州市科技局</option>
								<option value="廊坊市科技局">廊坊市科技局</option>
								<option value="衡水市科技局">衡水市科技局</option>
								<option value="定州市科技局">定州市科技局</option>
								<option value="辛集市科技局">辛集市科技局</option>
								<option value="省科技厅">省科技厅</option>
								<option value="省财政厅">省财政厅</option>
								<option value="省工业和信息化厅">省工业和信息化厅</option>
								<option value="省住房和城乡建设厅">省住房和城乡建设厅</option>
								<option value="省水利厅">省水利厅</option>
								<option value="省计生委">省计生委</option>
								<option value="省食品药品监督管理局">省食品药品监督管理局</option>
								<option value="省质量技术监督局">省质量技术监督局</option>
								<option value="省卫生厅">省卫生厅</option>
								<option value="省农业厅">省农业厅</option>
								<option value="省教育厅">省教育厅</option>
								<option value="省林业厅">省林业厅</option>
								
								<option value="省交通厅">省交通厅</option>
								<option value="省国防科技工业局">省国防科技工业局</option>
								<option value="省审计厅">省审计厅</option>
								<option value="省文化厅">省文化厅</option>
								<option value="省统计局">省统计局</option>
								<option value="省公安厅">省公安厅</option>
								<option value="省人力资源和社会保障厅">省人力资源和社会保障厅</option>
								<option value="省体育局">省体育局</option>
								<option value="省国土资源厅">省国土资源厅</option>
								<option value="省科学院">省科学院</option>
								<option value="省农科院">省农科院</option>
								<option value="省社会科学院">省社会科学院</option>
								<option value="省气象局">省气象局</option>
								<option value="省地震局">省地震局</option>
								<option value="省民政厅">省民政厅</option>
								<option value="省委宣传部">省委宣传部</option>
								<option value="省委组织部">省委组织部</option>
								<option value="省供销合作社">省供销合作社 </option>
								<option value="省广播电视局">省广播电视局</option>
								<option value="省委办公厅">省委办公厅</option>
								<option value="省政府研究室">省政府研究室</option>
								<option value="省盐务局">省盐务局</option>
								<option value="省档案局">省档案局</option>
								<option value="省物价局">省物价局</option>
								<option value="省人民政府外事办公室">省人民政府外事办公室</option>
								<option value="省政府办公厅">省政府办公厅</option>
								<option value="省信访局">省信访局</option>
								<option value="省妇联">省妇联</option>
								<option value="省法院">省法院</option>
								<option value="省检察院">省检察院</option>
								<option value="省商务厅">省商务厅</option>
								<option value="省发改委">省发改委</option>
								<option value="省国资委">省国资委</option>
								<option value="辛集市科技局">辛集市科技局</option>
								<option value="定州市科技局">定州市科技局</option>
								<option value="省安全生产监督管理局">省安全生产监督管理局</option>
								<option value="省国家安全厅">省国家安全厅</option>
								<option value="省中医药管理局">省中医药管理局</option>
								<option value="河北出入境检验检疫局">河北出入境检验检疫局</option>
								<option value="省科协">省科协</option>
								<option value="河北钢铁集团有限公司">河北钢铁集团有限公司</option>
								<option value="石家庄国家高新技术产业开发区">石家庄国家高新技术产业开发区</option>
								<option value="保定国家高新技术产业开发区">保定国家高新技术产业开发区</option>
								<option value="省总工会">省总工会</option>
								<option value="省旅游局">省旅游局</option>
								<option value="省新闻出版广电局">省新闻出版广电局</option>
								<option value="省社科联">省社科联</option>
								<option value="团省委">团省委</option>
								<option value="省司法厅">省司法厅</option>
								<option value="唐山国家高新技术产业开发区">唐山国家高新技术产业开发区</option>
								<option value="燕郊国家高新技术产业开发区">燕郊国家高新技术产业开发区</option>
								<option value="河北行政学院">河北行政学院</option>
								<option value="河北省机构编制委员会办公室">河北省机构编制委员会办公室</option>
								<option value="省政府法制办">省政府法制办</option>
								<option value="中共河北省委党校">中共河北省委党校</option>
								<option value="省工商行政管理局">省工商行政管理局</option>
								<option value="承德国家高新技术产业开发区">承德国家高新技术产业开发区</option>
							</select>
						</td>
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
						<td><input id="comAddress" name="comAddress" type="text" ></td>
					</tr>
					<tr>
						<td><label id="comAddressET"></label></td>
					</tr>
				</table>
			</td>
			<td>*所在地域</td>
			<td>
				<table>
					<tr>
						<td>
							<select name="loc" id="loc">
								<option value="请选择">请选择</option>
								<option value="石家庄市">石家庄市</option>
								<option value="唐山市">唐山市</option>
								<option value="秦皇岛市">秦皇岛市</option>
								<option value="邯郸市">邯郸市</option>
								<option value="邢台市">邢台市</option>
								<option value="保定市">保定市</option>
								<option value="张家口市">张家口市</option>
								<option value="承德市">承德市</option>
								<option value="沧州市">沧州市</option>
								<option value="廊坊市">廊坊市</option>
								<option value="衡水市">衡水市</option>
								<option value="定州市">定州市</option>
								<option value="辛集市">辛集市</option>
								<option value="其他">其他</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label id="locET"></label></td>
					</tr>
				</table>
			</td>
		</tr>
		
		
		
		<tr>
			<td>网址</td>
			<td>
				<table>
				<tr>
					<td><input id="netAddress" name="netAddress" type="text"/></td>
				</tr>
				<tr>
					<td><label id="netAddressET"></label></td>
				</tr>
				</table>
			</td>
			<td>*电子邮箱</td>
			<td>
				<table>
					<tr>
						<td><input id="email" name="email" type="text" ></td>
					</tr>
					<tr>
						<td><label id="emailET"></label></td>
					</tr>
				</table>
			</td>
		</tr>
		
		
		<tr>
			<td>*法人代表</td>
			<td>
				<table>
				<tr>
					<td><input id="corporation" name="corporation" type="text" ></td>
				</tr>
				<tr>
					<td><label id="corporationET"></label></td>
				</tr>
				</table>
			</td>
			<td>邮政编码</td>
			<td>
				<table>
				<tr>
					<td><input name="zipCoding" type="text" ></td>
				</tr>
				<tr>
					<td><label id="zipCodingET"></label></td>
				</tr>
				</table>
			</td>
		</tr>
		
		
		<tr>
			<td>*联系人</td>
			<td>
				<table>
				<tr>
					<td><input id="linkMan" name="linkMan" type="text" ></td>
				</tr>
				<tr>
					<td><label id="linkManET"></label></td>
				</tr>
				</table>
			</td>
			<td>传真</td>
			<td>
				<table>
				<tr>
					<td><input name="fax" type="text" ></td>
				</tr>
				<tr>
					<td><label id="faxET"></label></td>
				</tr>
				</table>
			</td>
		</tr>
		
		
		
		<tr>
			<td>固定电话</td>
			<td>
				<table>
				<tr>
					<td><input name="tel" type="text" ></td>
				</tr>
				<tr>
					<td><label id="telET"></label></td>
				</tr>
				</table>
			</td>
			<td>*手机</td>
			<td>
				<table>
				<tr>
					<td><input id="phone" name="phone" type="text" ></td>
				</tr>
				<tr>
					<td><label id="phoneET"></label></td>
				</tr>
				</table>
			</td>
		</tr>
		
		
		
		<tr>
			<td>*机构属性</td>
			<td>
				<table>
				<tr>
					<td>
						<input style="width:10px;" name="attribute" type="radio" value="企业"  checked="checked"/>企业
					    <input style="width:10px;" name="attribute" type="radio" value="高等院校" />高等院校
					    <input style="width:10px;" name="attribute" type="radio" value="研究机构" />研究机构
					    <input style="width:10px;" name="attribute" type="radio" value="其他" />其他
					</td>
				</tr>
				</table>
			</td>
			<td>*组织机构代码</td>
			<td>
				<table>
				<tr>
					<td><input id="InstitutionCoding" name="InstitutionCoding" type="text"></td>
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
					<td><input id="pwd" name="pwd" type="password"></td>
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
					<td colspan="3"><textarea  name="introduction" id="introduction" rows="10" cols="130"></textarea> </td>
				</tr>
				<tr>
					<td><label id="introductionET" style="diplay:block;"><font color="green">您可以输入200个字符</font></label></td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
	<input type="submit" name="submit" value="注册" style="width:50px;" />&nbsp;&nbsp;&nbsp;<input type="reset" value="重置" id="btn_edit" name="reset"  style="width:50px;" >
	</form>
	</center>
</body>
</html>