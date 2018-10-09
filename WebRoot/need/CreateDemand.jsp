<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.*,com.dbEntity.Subjects,com.dbEntity.NationalEconomy"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>新建需求征集表</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"></script>

<script
	src="${pageContext.request.contextPath}/static/js/jquery.validate.js"
	type="text/javascript"></script>
<script type="text/javascript" src="js/CreateDemand.js"></script>
<script type="text/javascript" src="js/Subjects.js"></script>
<script type="text/javascript" src="js/CreateDemand1.js"></script>




<style type="text/css">
html, body, div, li, form, input, th, td {
	margin: 0;
	padding: 0;
	font-family: 楷体;
	font-size: 100%;
}

ul, ol, li {
	list-style: none;
}

a:link, a:visited {
	color: #FF00FF;
	text-decoration: none;
}

a:hover {
	color: #12b7f5;
}

table {
	border-collapse: collapse;
	border: none;
	margin: 60px auto;
	width: 800px;
}

th, td {
	border: Groove #000000 2px;
	height: 20px;
	margin-bottom: 12px;
	line-height: 25px;
	opacity: 1.0;
}

div, td {
	text-align: left;
}

.form-group {
	margin-bottom: 15px;
}

.has-error .help-block, .has-error .control-label, .has-error .radio,
	.has-error .checkbox, .has-error .radio-inline, .has-error .checkbox-inline,
	.has-error.radio label, .has-error.checkbox label, .has-error.radio-inline label,
	.has-error.checkbox-inline label {
	color: #ff0000;
}

.has-error .form-control {
	border-color: #ff0000;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
}

.has-error .form-control:focus {
	border-color: #ff0000;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483;
}

.has-error .input-group-addon {
	color: #ff0000;
	background-color: #ff0000;
	border-color: #ff0000;
}

.has-error .form-control-feedback {
	color: #ff0000;
}
</style>

<script type="text/javascript">
var state ;
function updateMsg1() {
	state = "保存";
}
function updateMsg2() {
	state = "提交";
}
</script>
<script type="text/javascript">
	function getMsg() {
		
		var name = $("#name").val();
		var address = $("#address").val();
		var guanli = $("#guanli").val();
		var diyu = $("#diyu").val();
		var web = $("#web").val();
		var email = $("#email").val();
		var represent = $("#represent").val();
		var zipcode = $("#zipcode").val();
		var lianxiren = $("#lianxiren").val();
		var phone = $("#phone").val();
		var telephone = $("#telephone").val();
		var chuanzhen = $("#chuanzhen").val();
		var shuxing = $("#shuxing").val();
		var jigoujianjie = $("#theme2").val();
		var jishuname = $("#jishuname").val();
		var main = $("#theme").val();
		var key1 = $("#key1").val();
		var key2 = $("#key2").val();
		var key3 = $("#key3").val();
		var key4 = $("#key4").val();
		var key5 = $("#key5").val();
		var key = key1 + key2 + key3 + key4 + key5;
		var type = $("#form1").val();
		var model = $("#model").val();
		var servics = $("#servics").val();

		if (name.length == 0 || jigoujianjie.length == 0 || main.length == 0) {

		} else {
			$("#namem").html(name);
			$("#addressm").html(address);
			$("#guanlim").html(guanli);
			$("#diyum").html(diyu);
			$("#webm").html(web);
			$("#emailm").html(email);
			$("#representm").html(represent);
			$("#zipcodem").html(zipcode);
			$("#lianxirenm").html(lianxiren);
			$("#phonem").html(phone);
			$("#telephonem").html(telephone);
			$("#chuanzhenm").html(chuanzhen);
			$("#shuxingm").html(shuxing);
			$("#jigoujianjiem").html(jigoujianjie);
			$("#jishunamem").html(jishuname);
			$("#mainm").html(main);
			$("#keym").html(key);
			$("#typem").html(type);
			$("#modelm").html(model);
			
			$("#namem1").html(name);
			$("#addressm1").html(address);
			$("#guanlim1").html(guanli);
			$("#diyum1").html(diyu);
			$("#webm1").html(web);
			$("#emailm1").html(email);
			$("#representm1").html(represent);
			$("#zipcodem1").html(zipcode);
			$("#lianxirenm1").html(lianxiren);
			$("#phonem1").html(phone);
			$("#telephonem1").html(telephone);
			$("#chuanzhenm1").html(chuanzhen);
			$("#shuxingm1").html(shuxing);
			$("#jigoujianjiem1").html(jigoujianjie);
			$("#jishunamem1").html(jishuname);
			$("#mainm1").html(main);
			$("#keym1").html(key);
			$("#typem1").html(type);
			$("#modelm1").html(model);
			
			 if(state == "提交")
				$("#myModal2").modal("show");
			 else if(state == "保存")
				$("#myModal1").modal("show");
		}

		return false;
	}
	
	function toTJ(){
		
		$("#msg").val("确认提交");
		document.getElementById('form1').submit();
	}
	function toBC(){
		
		$("#msg").val("确认保存");
		document.getElementById('form1').submit();
	}
</script>
</head>
<body style="background-color: #E0F0F8;">
	<div class="mainAction"
		style="text-align: center; align-content: center;">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="col-md-12">
				<form
					action="${pageContext.request.contextPath }/Xuqiu/add.action?id=${UserBean.id }"
					id="form1" method="post" onsubmit="return getMsg()">
					<center>
						<input type="hidden" value=""  id="msg" name="msg"/>
						<table class="table" border="2" cellpadding="10">
							<caption>
								<h2 align="center">技术需求申请表</h2>
							</caption>
							<tr class="form-group">
								<td><strong style="color: red;">*</strong>机构全称</td>
								<td><input type="text" id="name" name="name"
									value="${UserBean.work}"></td>
								<td>归口管理部门</td>
								<td colspan="5"><input type="text" id="guanli"
									name="guanli" ></td>

							</tr>
							<tr class="form-group">
								<td><strong style="color: red;">*</strong>通讯地址</td>
								<td><input type="text" id="address" name="address"
									value="${UserBean.tongxun}"></td>
								<td>所在地域</td>
								<td colspan="5"><input type="text" id="diyu" name="diyu"
									value="${UserBean.work}"></td>

							</tr>
							<tr class="form-group">
								<td>网址</td>
								<td><input type="text" id="web" name="web" autofocus /></td>
								<td><strong style="color: red;">*</strong>电子邮箱</td>
								<td colspan="5"><input type="text" id="email" name="email"
									value="${UserBean.youxiang}"></td>
							</tr>
							<tr class="form-group">
								<td><strong style="color: red;">*</strong>法人代表</td>
								<td><input type="text" id="represent" name="represent"></td>
								<td>邮政编码</td>
								<td colspan="5"><input type="text" id="zipcode"
									name="zipcode" value="${UserBean.youbian}"></td>
							</tr>
							<tr class="form-group">
								<td rowspan="2"><strong style="color: red;">*</strong>联系人</td>
								<td rowspan="2"><input type="text" id="lianxiren"
									name="lianxiren" value="${UserBean.name}"></td>
								<td>电话</td>
								<td colspan="5">1、固定 <input type='text' id="phone"
									name="phone" value="${UserBean.phone}"></br> 2、手机 <input
									type='text' id="telephone" name="telephone"
									value="${UserBean.telephone}"></td>
							</tr>
							<tr>

								<td>传真</td>
								<td colspan="5"><input type='text' id="chuanzhen"
									name="chuanzhen"></td>
							</tr>
							<tr class="form-group">
								<td><strong style="color: red;">*</strong>机构属性</td>
								<td colspan="5"><label><input type="checkbox"
										id="shuxing" name="shuxing" value="企业"
										onClick="Close('otherServics')">企业</label> <label><input
										type="checkbox" id="shuxing" name="shuxing" value="高等院校"
										onClick="Close('otherServics')">高等院校</label> <label><input
										type="checkbox" id="shuxing" name="shuxing" value="研究机构"
										onClick="Close('otherServics')">研究机构</label> <label><input
										type="checkbox" id="shuxing" name="shuxing" value="其他"
										onClick="Close('otherServics')">其他</label></td>
							</tr>
							<tr class="form-group">
								<td class="td5" colspan="4"><strong style="color: red;">*</strong>1、机构简介(单位基本情况，研究基础，限200字以内)</td>
								<td class="td6" id="text2">0/200</td>
							</tr>
							<tr class="form-group">
								<td colspan="5"><textarea class="textarea"
										onkeyup="showTextLength1('text2','theme2')" id="theme2"
										name="jigoujianjie" cols=100 rows=6></textarea></td>
							</tr>
							<tr class="tr1">
								<td><strong style="color: red;">*</strong>技术需求名称</td>
								<td><input type="text" id="jishuname" name="jishuname"></td>
								<td>需求年限</td>
								<td colspan="5"><input type="text" name="time"></td>
							</tr>
							<tr class="tr2">
								<td class="td5" colspan="4"><strong style="color: red;">*</strong>重大科技需求概述(主要内容，技术指标，预期经济和社会效益等，限500字以内)</td>
								<td class="td6" id="text1">0/500</td>
							</tr>
							<tr class="form-group">
								<td colspan="5"><textarea class="textarea"
										onkeyup="showTextLength('text1','theme')" id="theme"
										name="main" cols=100 rows=6></textarea></td>
							</tr>
							<tr>
								<td>*关键字:</td>
								<td colspan="4"><input class="input3" type="text" id="key1"
									name="key1"> <input class="input3" readonly="readonly"
									type="text" id="key2" name="key2" onkeyup="ChangeState()">
									<input class="input3" readonly="readonly" type="text" id="key3"
									name="key3" onkeyup="ChangeState()"> <input
									class="input3" readonly="readonly" type="text" id="key4"
									name="key4" onkeyup="ChangeState()"> <input
									class="input3" readonly="readonly" type="text" id="key5"
									name="key5" onkeyup="ChangeState()"></td>
							</tr>
							<tr>
								<td class="td1">研究类型</td>
								<td colspan="4"><label><input type="radio"
										name="type" value="基础研究" id="form1" onclick="getUI()">基础研究</label>
									<label><input type="radio" name="type" id="form1"
										value="应用研究" onclick="getUI()">应用研究</label> <label><input
										type="radio" name="type" value="试验发展" onclick="getUI()">试验发展</label>
									<br> <label><input type="radio" name="type"
										value="研究发展与应用成果" id="form1" onclick="getUI()">研究发展与应用成果</label>
									<label><input type="radio" name="type"
										value="技术推广与科技服务" onclick="getUI()">技术推广与科技服务</label> <label><input
										type="radio" name="type" id="form1" value="生产性活动"
										onclick="getUI()">生产性活动</label></td>
							</tr>
							<tr id="sub" style="display: none;">
								<td class="td1">学科分类</td>
<!-- 								<td colspan="4"><select name="firstSubjects"
									id="firstSubjects"
									onchange="refreshList('firstSubjects','secondSubjects','1','subject');">
										<option value="default">请选择</option>

								</select> <select name="secondSubjects" id="secondSubjects"
									onchange="refreshList('secondSubjects','thirdSubjects','2','subject');">
										<option value="default">请选择</option>
								</select> <select name="thirdSubjects" id="thirdSubjects">
										<option value="default">请选择</option>
								</select></td> -->
												<td colspan="4"><select id="subjects1"
					name="subjects1" onchange="changeSelect(this);">
						<option value="000000" style="color: #999;" width="50px"
							disabled="disabled">-请选择-</option>
				</select> <select id="subjects2" name="subjects2" onchange="changeSelect(this);">
						<option value="000000" style="color: #999;" disabled="disabled">-请选择-</option>
				</select> <select id="subjects3" name="subjects3">
						<option value="000000" style="color: #999;" disabled="disabled">-请选择-</option>
				</select></td>
							</tr>
							<tr>
								<td class="td1">*技术需求合作模式</td>
								<td colspan="4"><label><input type="radio"
										id="model" name="model" value="基础研究"
										onClick="Close('otherModel')">独立开发</label> <label><input
										type="radio" id="model" name="model" value="应用研究"
										onClick="Close('otherModel')">技术转让</label> <label><input
										type="radio" id="model" name="model" value="试验发展"
										onClick="Close('otherModel')">技术入股</label> <label><input
										type="radio" id="model" name="model" value="研究发展与应用成果"
										onClick="Close('otherModel')">合作开发</label> <label><input
										type="radio" id="model" name="model" value="技术推广与科技服务"
										onClick="Show('otherModel')">其他<input class="input5"
										type="text" id="otherModel" name="model"
										style="display: none;"></label></td>
							</tr>
							<tr>
							<tr id="servics" style="display: none;">
								<td class="td1">需求技术所属领域</td>
								<td colspan="4"><label><input type="checkbox"
										id="servics" name="servics" value="电子信息技术"
										onClick="Close('otherServics')">电子信息技术</label> <label><input
										type="checkbox" id="servics" name="servics" value="光机电一体化"
										onClick="Close('otherServics')">光机电一体化 </label> <label><input
										type="checkbox" id="servics" name="servics" value="软件"
										onClick="Close('otherServics')">软件</label> <label><input
										type="checkbox" id="servics" name="servics" value="生物制药技术"
										onClick="Close('otherServics')">生物制药技术</label> <label><input
										type="checkbox" id="servics" name="servics" value="新材料及应用技术"
										onClick="Close('otherServics')">新材料及应用技术</label> <br> <label><input
										type="checkbox" id="servics" name="servics" value="先进制造技术"
										onClick="Close('otherServics')">先进制造技术</label> <label><input
										type="checkbox" id="servics" name="servics" value="现代农业技术"
										onClick="Close('otherServics')">现代农业技术</label> <label><input
										type="checkbox" id="servics" name="servics" value="新能源与高效节能技术"
										onClick="Close('otherServics')">新能源与高效节能技术</label> <br> <label><input
										type="checkbox" id="servics" name="servics" value="资源与环境保护新技术"
										onClick="Close('otherServics')">资源与环境保护新技术</label> <label><input
										type="checkbox" id="servics" name="servics" value="其他技术"
										onClick="Show('otherServics')">其他技术</label> <label><input
										class="input5" type="text" id="otherServics"
										name="otherServics" style="display: none;"></label></td>
							</tr>
							<tr id="industry" style="display: none;">
								<td id="td1">需求技术应用行业</td>
								<td colspan="4"><select name="firstIndustry"
									id="firstIndustry"
									onchange="refreshList('firstIndustry','secondIndustry','1','industry');">
										<option value="default">请选择</option>

								</select> <select name="secondIndustry" id="secondIndustry"
									onchange="refreshList('secondIndustry','thirdIndustry','2','industry');">
										<option value="default">请选择</option>
								</select> <select name="thirdIndustry" id="thirdIndustry">
										<option value="default">请选择</option>
								</select></td>
							</tr>

							<tr>

								<!-- 						<td colspan="5" align="center">
								<input type="submit"
								value="保存" name="msg"> <input
								type="submit" value="提交" name="msg" onclick="add()">
	
	
	
	
							</td> -->
							</tr>
						</table>
						<!-- 			<button type="button" class="btn btn-primary btn-sm" 
				data-toggle="modal" data-target="#myModal">保存</button>
				<button type="button" class="btn btn-primary btn-sm" 
				data-toggle="modal" data-target="#myModal">提交</button> -->
					</center>
					<div class="col-md-12" align="center">
						<div class="col-md-offset-6">
						<input type="submit" class="btn btn-primary btn-lg" value="保存" id="msg" onclick="updateMsg1()">
						 <input type="submit" class="btn btn-primary btn-lg" value="提交" id="msg" onclick="updateMsg2()" >
							<!-- <button type="submit" class="btn btn-primary btn-lg" id="bt" value="bt" >保存</button>
							<button type="submit" class="btn btn-primary btn-lg" id="tj" value="tj" >提交</button> -->
						</div>
					</div>

				</form>
			</div>



			<div>
				<c:if test="${param.status == 1}">
					<script type="text/javascript">
					if(confirm("提交成功！是否继续填报"))
				    {
				      location.href="${pageContext.request.contextPath}/need/CreateDemand.jsp";
				    }
				    else
				   {
				    	location.href="${pageContext.request.contextPath}/Xuqiu/listNeed.cation?id=${UserBean.id}";
				    }
					</script>
				</c:if>

				<c:if test="${param.status == 2}">
					<script type="text/javascript">
					if(confirm("保存成功！是否继续填报"))
				    {
				      location.href="${pageContext.request.contextPath}/need/CreateDemand.jsp";
				    }
				    else
				   {
				    	location.href="${pageContext.request.contextPath}/Xuqiu/listNeed.action?id=${UserBean.id}";
				    }
					</script>
				</c:if>
			</div>

		</div>


	</div>
	<div class="col-md-2"></div>
	<!-- Modal1 保存 -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">要保存的需求报表</h4>
				</div>
				<form 
					action="${pageContext.request.contextPath }/Xuqiu/add?id=${UserBean.id }"
					method="post" id="checkForm">
					<div class="modal-body">

						<table class="table" border="2" cellpadding="10">
							<tr class="form-group">
								<td>机构全称</td>
								<td id="namem1"></td>
								<td>归口管理部门</td>
								<td colspan="5" id="guanlim1"></td>

							</tr>
							<tr class="form-group">
								<td>通讯地址</td>
								<td id="addressm1"></td>
								<td>所在地域</td>
								<td colspan="5" id="diyum1"></td>

							</tr>
							<tr class="form-group">
								<td>网址</td>
								<td id="webm1"></td>
								<td>电子邮箱</td>
								<td colspan="5" id="emailm1"></td>
							</tr>
							<tr class="form-group">
								<td>法人代表</td>
								<td id="representm1"></td>
								<td>邮政编码</td>
								<td colspan="5" id="zipcodem1"></td>
							</tr>
							<tr class="form-group">
								<td rowspan="2">联系人</td>
								<td rowspan="2" id="lianxirenm1"></td>
								<td>电话</td>
								<td colspan="5" id="telephonem1"></td>
							</tr>
							<tr>

								<td>传真</td>
								<td colspan="5" id="chuanzhenm1"></td>
							</tr>
							<tr class="form-group">
								<td>机构属性</td>
								<td colspan="5" id="shuxingm1"></td>
							</tr>
							<tr class="form-group">
								<td class="td5" colspan="4">1、机构简介(单位基本情况，研究基础，限200字以内)</td>

							</tr>
							<tr class="form-group">
								<td colspan="5" id="jigoujianjiem1">${need.jigoujianjie}</td>
							</tr>
							<tr class="tr1">
								<td>技术需求名称</td>
								<td id="jishunamem1">${need.jishuname}</td>
								<td>需求年限</td>
								<td colspan="5"><input type="text" name="time"></td>
							</tr>
							<tr class="tr2">
								<td class="td5" colspan="4">重大科技需求概述(主要内容，技术指标，预期经济和社会效益等，限500字以内)</td>

							</tr>
							<tr class="form-group">
								<td colspan="5" id=mainm1>${need.theme}</td>
							</tr>
							<tr>
								<td>关键字:</td>
								<td colspan="4" id="keym1">${need.key}</td>
							</tr>
							<tr>
								<td class="td1">研究类型</td>
								<td colspan="4" id="typem1">${need.type}</td>
							</tr>
							<tr id="sub" style="display: none;">
								<td class="td1">学科分类</td>
								<td colspan="4"><select name="firstSubjects"
									id="firstSubjects"
									onchange="refreshList('firstSubjects','secondSubjects','1','subject');">
										<option value="default">请选择</option>

								</select> <select name="secondSubjects" id="secondSubjects"
									onchange="refreshList('secondSubjects','thirdSubjects','2','subject');">
										<option value="default">请选择</option>
								</select> <select name="thirdSubjects" id="thirdSubjects">
										<option value="default">请选择</option>
								</select></td>
							</tr>
							<tr>
								<td class="td1">*技术需求合作模式</td>
								<td colspan="4" id="modelm1">${need.model}</td>
							</tr>
							<tr>
							<tr id="servics" style="display: none;">
								<td class="td1">需求技术所属领域</td>
								<td colspan="4" id="servicsm1">${need.servics}</td>
							</tr>
							<tr id="industry" style="display: none;">
								<td id="td1">需求技术应用行业</td>
								<td colspan="4"><select name="firstIndustry"
									id="firstIndustry"
									onchange="refreshList('firstIndustry','secondIndustry','1','industry');">
										<option value="default">请选择</option>

								</select> <select name="secondIndustry" id="secondIndustry"
									onchange="refreshList('secondIndustry','thirdIndustry','2','industry');">
										<option value="default">请选择</option>
								</select> <select name="thirdIndustry" id="thirdIndustry">
										<option value="default">请选择</option>
								</select></td>
							</tr>

						</table>
					</div>
					<div class="modal-footer">
						<div class="row-fluid">
							<div class="col-md-3"></div>
							<div class="col-md-offset-4">
								
							
								<input type="button" class="btn btn-primary btn-lg" onclick="toBC()" value="确认保存" >
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<!-- Modal2 提交 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">要提交的需求报表</h4>
				</div>
				<form 
					action="${pageContext.request.contextPath }/Xuqiu/add.action?id=${UserBean.id }"
					method="post" id="checkForm">
					<div class="modal-body">

						<table class="table" border="2" cellpadding="10">
							<tr class="form-group">
								<td>机构全称</td>
								<td id="namem"></td>
								<td>归口管理部门</td>
								<td colspan="5" id="guanlim"></td>

							</tr>
							<tr class="form-group">
								<td>通讯地址</td>
								<td id="addressm"></td>
								<td>所在地域</td>
								<td colspan="5" id="diyum"></td>

							</tr>
							<tr class="form-group">
								<td>网址</td>
								<td id="webm"></td>
								<td>电子邮箱</td>
								<td colspan="5" id="emailm"></td>
							</tr>
							<tr class="form-group">
								<td>法人代表</td>
								<td id="representm"></td>
								<td>邮政编码</td>
								<td colspan="5" id="zipcodem"></td>
							</tr>
							<tr class="form-group">
								<td rowspan="2">联系人</td>
								<td rowspan="2" id="lianxirenm"></td>
								<td>电话</td>
								<td colspan="5" id="telephonem"></td>
							</tr>
							<tr>

								<td>传真</td>
								<td colspan="5" id="chuanzhenm"></td>
							</tr>
							<tr class="form-group">
								<td>机构属性</td>
								<td colspan="5" id="shuxingm"></td>
							</tr>
							<tr class="form-group">
								<td class="td5" colspan="4">1、机构简介(单位基本情况，研究基础，限200字以内)</td>

							</tr>
							<tr class="form-group">
								<td colspan="5" id="jigoujianjiem">${need.jigoujianjie}</td>
							</tr>
							<tr class="tr1">
								<td>技术需求名称</td>
								<td id="jishunamem">${need.jishuname}</td>
								<td>需求年限</td>
								<td colspan="5"><input type="text" name="time"></td>
							</tr>
							<tr class="tr2">
								<td class="td5" colspan="4">重大科技需求概述(主要内容，技术指标，预期经济和社会效益等，限500字以内)</td>

							</tr>
							<tr class="form-group">
								<td colspan="5" id=mainm>${need.theme}</td>
							</tr>
							<tr>
								<td>关键字:</td>
								<td colspan="4" id="keym">${need.key}</td>
							</tr>
							<tr>
								<td class="td1">研究类型</td>
								<td colspan="4" id="typem">${need.type}</td>
							</tr>
							<tr id="sub" style="display: none;">
								<td class="td1">学科分类</td>
								<td colspan="4"><select name="firstSubjects"
									id="firstSubjects"
									onchange="refreshList('firstSubjects','secondSubjects','1','subject');">
										<option value="default">请选择</option>

								</select> <select name="secondSubjects" id="secondSubjects"
									onchange="refreshList('secondSubjects','thirdSubjects','2','subject');">
										<option value="default">请选择</option>
								</select> <select name="thirdSubjects" id="thirdSubjects">
										<option value="default">请选择</option>
								</select></td>
							</tr>
							<tr>
								<td class="td1">*技术需求合作模式</td>
								<td colspan="4" id="modelm">${need.model}</td>
							</tr>
							<tr>
							<tr id="servics" style="display: none;">
								<td class="td1">需求技术所属领域</td>
								<td colspan="4" id="servicsm">${need.servics}</td>
							</tr>
							<tr id="industry" style="display: none;">
								<td id="td1">需求技术应用行业</td>
								<td colspan="4"><select name="firstIndustry"
									id="firstIndustry"
									onchange="refreshList('firstIndustry','secondIndustry','1','industry');">
										<option value="default">请选择</option>

								</select> <select name="secondIndustry" id="secondIndustry"
									onchange="refreshList('secondIndustry','thirdIndustry','2','industry');">
										<option value="default">请选择</option>
								</select> <select name="thirdIndustry" id="thirdIndustry">
										<option value="default">请选择</option>
								</select></td>
							</tr>

						</table>
					</div>
					<div class="modal-footer">
						<div class="row-fluid">
							<div class="col-md-3"></div>
							<div class="col-md-offset-4">
								<input type="button" class="btn btn-primary btn-lg" onclick="toTJ()" value="确认提交" >

							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>

</html>