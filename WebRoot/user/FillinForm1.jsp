<%@page import="whw.Service,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>填写技术需求</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.js">
	
</script>
<script type="text/javascript">
	
	//一直在执行的函数 
	$(function(){
	
	//给当前编辑的文本框动态的添加样式
      $(":input").focus(function(){
              $(this).addClass("focus");
        }).keyup(function(){
              $(this).removeClass("focus");}).blur(function(){
              $(this).removeClass("focus");
        });
	
	//检查需求名称是否为空
	$("#name").blur(function (){
		if($("#name").val().length == 0)
		{
			
			$("#nameET").show();
			$("#nameET").html("");
			$("#nameET").html("技术需求名称为必填项，不能为空");
			$("#name").focus();
		}
		else
		{
			$("#nameET").html("");
		}
	});
	
	$("#name").keyup(function (){
		if($("#name").val().length == 0)
		{
			$("#nameET").html("");
			$("#nameET").html("技术需求名称为必填项，不能为空");
			$("#name").focus();
		}
		else
		{
			$("#nameET").html("");
		}
	});
	
	//alert("h");
	//检查需求的起始年限和终止年限
	$("#StartYear").blur(function (){
            var startYear = $("#StartYear").val();
            if(isNaN(startYear) || (!isNaN(startYear) && startYear < 2016))
            {
            //alert($("#StartYear").val());
            	//提示错误信息
            	$("#StartYearError").show();
            	//获取焦点
            	$("#StartYear").focus();
            }
            else
            {
            	$("#StartYearError").hide();
            }
        });
        
      //需求起始年份发生改变
      $("#StartYear").keyup(function (){
      //alert("1");
      	var startYear = $("#StartYear").val();
            if(isNaN(startYear) || (!isNaN(startYear) && startYear < 2016))
            {
            //alert($("#StartYear").val());
            	//提示错误信息
            	$("#StartYearError").show();
            	//获取焦点
            	$("#StartYear").focus();
            }
            else
            {
            	$("#StartYearError").hide();
            }
      });
      
      //检查需求的结束年份
      $("#EndYear").blur(function (){
            var EndYear = $("#EndYear").val();
            if(isNaN(EndYear) || (!isNaN(EndYear) && EndYear < 2016))
            {
            //alert($("#StartYear").val());
            	//提示错误信息
            	$("#EndYearError").show();
            	//获取焦点
            	$("#EndYear").focus();
            }
            else
            {
            	$("#EndYearError").hide();
            }
        });
        
      //需求结束年份发生改变
      $("#EndYear").keyup(function (){
      //alert("1");
      	var startYear = $("#EndYear").val();
            if(isNaN(startYear) || (!isNaN(startYear) && startYear < 2016))
            {
            //alert($("#StartYear").val());
            	//提示错误信息
            	$("#EndYearError").show();
            	//获取焦点
            	$("#EndYear").focus();
            }
            else
            {
            	$("#EndYearError").hide();
            }
      });
      
      
      //检测技术需求主要问题的变化
      $("#Intro_MainProblem").keyup(function() {
      		var Intro_MainProblem = $("#Intro_MainProblem").val();
      		if(Intro_MainProblem.length <= 500)
      		{
      			$("#MainProblem_Tip").html(500-Intro_MainProblem.length);
      		}
      		else
      		{
      		$("#MainProblem_Tip").html("");
      			$("#MainProblem_Tip").html("<font color='red'>您输入的字数已经超过500)</font>");
      			$("#Intro_MainProblem").val(Intro_MainProblem.substring(0,500));
      		}
      });
      //技术需求主要问题失去焦点的时候检测字数
      $("#Intro_MainProblem").blur(function (){
      		var Intro_MainProblem = $("#Intro_MainProblem").val();
      		if(Intro_MainProblem.length <= 500)
      		{
      			$("#MainProblem_Tip").html(500-Intro_MainProblem.length);
      			
      		}
      		else
      		{
      			$("#MainProblem_Tip").html("");
      			$("#MainProblem_Tip").html("<font color='red'>您输入的字数已经超过500)</font>");
      			$("#Intro_MainProblem").val(Intro_MainProblem.substring(0,500));
      			$("#Intro_MainProblem").focus();
      		}
      });
      
      //检测技术需求  的变化
      $("#Intro_TechnologyKey").keyup(function() {
      		var Intro_MainProblem = $("#Intro_TechnologyKey").val();
      		if(Intro_MainProblem.length <= 500)
      		{
      			$("#TechnologyKey_Tip").html(500-Intro_MainProblem.length);
      		}
      		else
      		{
      		$("#TechnologyKey_Tip").html("");
      			$("#TechnologyKey_Tip").html("<font color='red'>您输入的字数已经超过500)</font>");
      			$("#Intro_TechnologyKey").val(Intro_MainProblem.substring(0,500));
      		}
      });
      //技术需求 技术关键失去焦点的时候检测字数
      $("#Intro_TechnologyKey").blur(function (){
      		var Intro_MainProblem = $("#Intro_TechnologyKey").val();
      		if(Intro_MainProblem.length <= 500)
      		{
      			$("#TechnologyKey_Tip").html(500-Intro_MainProblem.length);
      			
      		}
      		else
      		{
      			$("#TechnologyKey_Tip").html("");
      			$("#TechnologyKey_Tip").html("<font color='red'>您输入的字数已经超过500)</font>");
      			$("#Intro_TechnologyKey").val(Intro_MainProblem.substring(0,500));
      			$("#Intro_TechnologyKey").focus();
      		}
      });
      
      
      //检测技术需求 预期目标的变化
      $("#Intro_ExceptGoal").keyup(function() {
      		var Intro_MainProblem = $("#Intro_ExceptGoal").val();
      		if(Intro_MainProblem.length <= 500)
      		{
      			$("#ExceptGoal_Tip").html(500-Intro_MainProblem.length);
      		}
      		else
      		{
      		$("#MainProblem_Tip").html("");
      			$("#ExceptGoal_Tip").html("<font color='red'>您输入的字数已经超过500)</font>");
      			$("#Intro_ExceptGoal").val(Intro_MainProblem.substring(0,500));
      		}
      });
      //技术需求预期目标失去焦点的时候检测字数
      $("#Intro_ExceptGoal").blur(function (){
      		var Intro_MainProblem = $("#Intro_ExceptGoal").val();
      		if(Intro_MainProblem.length <= 500)
      		{
      			$("#ExceptGoal_Tip").html(500-Intro_MainProblem.length);
      			
      		}
      		else
      		{
      			$("#ExceptGoal_Tip").html("");
      			$("#ExceptGoal_Tip").html("<font color='red'>您输入的字数已经超过500)</font>");
      			$("#Intro_ExceptGoal").val(Intro_MainProblem.substring(0,500));
      			$("#Intro_ExceptGoal").focus();
      		}
      });
      
     
      
      //第二个关键字获取焦点的时候检测第一个关键字是否有内容
      $("#key2").focus(function(){
      		
      		var key1 = $("#key1").val().trim();
      		//alert(key1.length);
      		if(key1.length > 0)
      		{
      			$("#key2").attr("readonly","");
      			 //$("#key2").focus();
      			  $("#key_Tip").html("(提示:五个关键字只能依次录入)");
      		}
      		else
      		{
      			$("#key1").focus();
      			$("#key2").attr("readonly","readonly");
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入，请先填写第一个关键字</font>");
      		}
      });
      
      
      
      
       //第三个关键字获取焦点的时候检测第一个关键字 和 第二个关键字是否有内容
      $("#key3").focus(function(){
      		
      		var key1 = $("#key1").val().trim();
      		var key2 = $("#key2").val().trim();
      		//alert(key1.length);
      		
      		if(key1.length == 0)
      		{
      			$("#key1").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第一个关键字</font>");
      		}
      		else if(key2.length == 0)
      		{
      			$("#key2").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第二个关键字</font>");
      		}
      		else
      		{
      			$("#key3").attr("readonly","");
      			 //$("#key2").focus();
      			  $("#key_Tip").html("(提示:五个关键字只能依次录入)");
      		}
      });
      
     
      
       //第四个关键字获取焦点的时候检测第一个关键字 和 第二个关键字  第三个关键字是否有内容
      $("#key4").focus(function(){
      		
      		var key1 = $("#key1").val().trim();
      		var key2 = $("#key2").val().trim();
      		var key3 = $("#key3").val().trim();
      		//alert(key1.length);
      		
      		if(key1.length == 0)
      		{
      			$("#key1").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第一个关键字</font>");
      		}
      		else if(key2.length == 0)
      		{
      			$("#key2").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第二个关键字</font>");
      		}
      		else if(key3.length == 0)
      		{
      			$("#key3").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第三个关键字</font>");
      		}
      		else
      		{
      			$("#key4").attr("readonly","");
      			 //$("#key2").focus();
      			  $("#key_Tip").html("(提示:五个关键字只能依次录入)");
      		}
      });
      
          
      
       //第五个关键字获取焦点的时候检测第一个关键字 和 第二个关键字  第三个关键字  第四个关键字是否有内容
      $("#key5").focus(function(){
      		
      		var key1 = $("#key1").val().trim();
      		var key2 = $("#key2").val().trim();
      		var key3 = $("#key3").val().trim();
      		var key4 = $("#key4").val().trim();
      		//alert(key1.length);
      		
      		if(key1.length == 0)
      		{
      			$("#key1").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第一个关键字</font>");
      		}
      		else if(key2.length == 0)
      		{
      			$("#key2").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第二个关键字</font>");
      		}
      		else if(key3.length == 0)
      		{
      			$("#key3").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第三个关键字</font>");
      		}
      		else if(key4.length == 0)
      		{
      			$("#key4").focus();
      			
      		    $("#key_Tip").html("<font color='red'>关键字必须依次输入,请先填写第四个关键字</font>");
      		}
      		else
      		{
      			$("#key5").attr("readonly","");
      			 //$("#key2").focus();
      			  $("#key_Tip").html("(提示:五个关键字只能依次录入)");
      		}
      });
      
      
	//alert("h");
	var firSubName = $("#firSubName").find("option:selected").text();
		if("请选择" != firSubName)
		{
		$("#firSubName").append("<option value='请选择'>请选择</option>");
			$.ajax({
				url:"SubjectServlet?action=firLevSubject",
			type:"post",
			dataType:"text",
			success:function(returnData)
			{
				//alert("数据返回l;a");
				//异步提交请求时该属性失效
				
				var firLevSubject = returnData.split(",");
				for(var i = 0;i < firLevSubject.length;i++)
				{
					$("#firSubName").append("<option value='firLevSubject[i]'>"+firLevSubject[i]+"</option>");
				}
				
			}
			
		});
	}//if
	else
	{
		$("#secSubName").empty();
		$("#secSubName").append("<option value='请选择'>请选择</option>");
		$("#tirSubName").empty();
		$("#tirSubName").append("<option value='请选择'>请选择</option>");
	}
	
	//选择的是基础研究，则可以选择“学科分类”    acacac
	//选择的是非基础研究  技术需求所属领域和应用行业才能选择
	$("input:radio[name=TechnologyType]").change(function (){
	
		var type = $("#input:radio[name=TechnologyType]:checked").next().text();
		alert(type);
		alert("事件触发");
		//三级学科可见
		$("#firSubName").show();
		$("#secSubName").show();
		$("#tirSubName").show();
		//需求技术所属领域和技术需求应用行业不可见
		$("#ApplyIndustry").hide();
		$("TechnologyArea").hide();
		$("ApplyIndustry").hide();
	});
	});
	
	//一级学科选项发生变化   获取对应的二级学科
	
	//$("#firSubName").change();
	
	function getSecLevel(){
	//alert("l");
	
	 var firSubName = $("#firSubName").find("option:selected").text();
		//alert(firSubName); 
	 if("请选择" != firSubName)
	 {
	 	$("#secSubName").empty();
		$("#secSubName").append("<option value='请选择'>请选择</option>");
			$.ajax({
				url:"SubjectServlet?action=secLevSubject&firSubName="+firSubName,
			type:"post",
			dataType:"text",
			success:function(returnData)
			{
				//alert("数据返回l;a");
				//异步提交请求时该属性失效
				
				var secLevSubject = returnData.split(",");
				for(var i = 0;i < secLevSubject.length;i++)
				{
					$("#secSubName").append("<option value='secLevSubject[i]'>"+secLevSubject[i]+"</option>");
				}
				
			}
			
		});
		}
		else
		{	
			$("#secSubName").empty();
			$("#secSubName").append("<option value='请选择'>请选择</option>");
			$("#tirSubName").empty();
			$("#tirSubName").append("<option value='请选择'>请选择</option>");
		}
	}
	
	//二级菜单发生变化时找到对应的三级菜单
	function getThiredLevel(){
	//alert("l");
	 var secSubName = $("#secSubName").find("option:selected").text();
		//alert(firSubName); 
	 
	 if("请选择" != secSubName)
	 {	
	 	$("#tirSubName").empty();	
		$("#tirSubName").append("<option value='请选择'>请选择</option>");
			$.ajax({
				url:"SubjectServlet?action=tirLevSubject&secSubName="+secSubName,
			type:"post",
			dataType:"text",
			success:function(returnData)
			{
				//alert("数据返回l;a");
				//异步提交请求时该属性失效
				
				var tirLevSubject = returnData.split(",");
				for(var i = 0;i < tirLevSubject.length;i++)
				{
					$("#tirSubName").append("<option value='tirLevSubject[i]'>"+tirLevSubject[i]+"</option>");
				}
				
			}
			
		});
	}
	else
	{
		$("#tirSubName").empty();
			$("#tirSubName").append("<option value='请选择'>请选择</option>");
	}
	
	
	}
	
</script>
<style type="text/css">
	.style1
	{
		width:200px; 
	}
	body
	{
		font-size:16px; 
	}
	.errorTip
	{
		color:red;  
	}
	.focus 
	{ 
    	background: #caff70;
	}
	label
	{
		color:red;
	}
</style>
</head>
<body>
	<%
		String userName = request.getParameter("userName").toString();
		String name = request.getParameter("name").toString();
		String institutionCoding = request.getAttribute("institutionCoding").toString();
		System.out.println("提交界面获取的组织机构代码为"+institutionCoding); 
	 %>
	 <center>
	 	 <h3>河北省重大技术需求征集填写</h3>
	 </center>
	
	<fieldset>
		<legend>机构基础信息</legend>
		<br><br>
		<form name="IndustryInfo">
			机构全称<input type="text" readonly="true" value=<%=new String(name.toString().getBytes("iso8859-1"),"utf-8")  %>><br><br>
			用  户  名<input type="text" readonly="true" value=<%=new String(userName.toString().getBytes("iso8859-1"),"utf-8") %>><br><br>
		</form>
	</fieldset>
	 <br>
	<fieldset>
		<legend>技术需求基础信息</legend>
		<br><br>
		<form name="TechnologyNeed" method="post" action="<%=request.getContextPath() %>/RequirementServlet?action=addRequireHandin">
			
			<input type="hidden" value="<%=institutionCoding %>" name="institutionCoding">
			
			技术需求编号:<input type="text" class="style1" name="Num" readonly="readonly" value="<%=Service.getRequirementNum()%>"><br><br>
			技术需求名称:<input type="text" class="style1" id="name"  name="Name" style="width:200px;"><label id="nameET"></label><br><br>
			需    求    时   限  :<input id="StartYear" type="text" class="style1" name="StartYear" onblur="a()" width="105px"><label id="StartYearError" class="errorTip" style="display:none;">起始年限只能包含数字而且必须大于2016</label>  年至  <input id="EndYear" type="text" class="style1" name="EndYear" width="105px">  年 <label id="EndYearError"class="errorTip" style="display:none;">终止年限只能包含数字而且必须大于2016</label><br><br>
			技术需求概述<br><br>
			主要问题(限制字数在500以内)<br><textarea cols="140" rows="20" id="Intro_MainProblem" name="Intro_MainProblem"></textarea><br>
			(友情提示:您还可以输入<label id="MainProblem_Tip">500</label>个字符)<br><br>
			技术关键(限制字数在500以内)<br><textarea cols="140" rows="20" id="Intro_TechnologyKey" name="Intro_TechnologyKey"></textarea><br>
			(友情提示:您还可以输入<label id="TechnologyKey_Tip">500</label>个字符)<br><br>
			预期目标(限制字数在500以内)<br><textarea cols="140" rows="20" id="Intro_ExceptGoal" name="Intro_ExceptGoal"></textarea><br>
			(友情提示:您还可以输入<label id="ExceptGoal_Tip">500</label>个字符)<br><br>
			关键字:
			<input type="text" id="key1" name="key1" width="90px">&nbsp;
			<input type="text" id="key2" name=key2 width="90px" readonly="readonly">&nbsp;
			<input type="text" id="key3" name="key3" width="90px" readonly="readonly">&nbsp;
			<input type="text" id="key4" name="key4" width="90px" readonly="readonly">&nbsp;
			<input type="text" id="key5" name="key5" width="90px" readonly="readonly"><br><label id="key_Tip">(提示:五个关键字只能依次录入)</label><br><br>
			科技活动类型<br><br>
			<input type="radio" id="type0" name="TechnologyType" value="基础研究" checked="checked"/><span>基础研究</span>
			<input type="radio" id="type1" name="TechnologyType" value="应用研究"/><span>应用研究</span>
			<input type="radio" id="type2" name="TechnologyType" value="试验发展"/><span>试验发展</span>
			<input type="radio" id="type3" name="TechnologyType" value="研究与试验发展成果应用"/><span>研究与试验发展成果应用</span>
			<input type="radio" id="type4" name="TechnologyType" value="技术推广与科技服务"/><span>技术推广与科技服务</span>
			<input type="radio" id="type5" name="TechnologyType" value="生产性活动"/><span>生产性活动</span><br><br>
			
			学科分类 
			<select name="SubjectType1" id="firSubName" onchange="getSecLevel()">
			</select>
			<select name="SubjectType0" id="secSubName" onchange="getThiredLevel()">
			</select>
			<select name="SubjectType2" id="tirSubName">

			</select>
			<br><br>
			<label id="technologyArea"><font color="black">技术需求所属领域</font></label><br><br>
			<input type="checkbox" name="TechnologyArea" value="电子信息">电子信息
			<input type="checkbox" name="TechnologyArea" value="光机电一体化  ">光机电一体化  
			<input type="checkbox" name="TechnologyArea" value="生物制药与技术  ">生物制药与技术<br><br>
			<input type="checkbox" name="TechnologyArea" value="新材料及应用 ">新材料及应用
			<input type="checkbox" name="TechnologyArea" value="新能源与高效节能 ">新能源与高效节能 
			<input type="checkbox" name="TechnologyArea" value="现代农业 ">现代农业 <br><br>
			<input type="checkbox" name="TechnologyArea" value="资源与环境  ">资源与环境 
			<input type="checkbox" name="TechnologyArea" value="高技术服务业  ">高技术服务业
			<input type="checkbox" name="TechnologyArea" value="海洋  ">海洋 <br><br>
			<input type="checkbox" name="TechnologyArea" value="社会公共事业  ">社会公共事业
			<input type="checkbox" name="TechnologyArea" value="医疗卫生  ">医疗卫生
			<input type="checkbox" name="TechnologyArea" value="其它">其他<br><br>
			技术需求应用行业:<input type="text" name="ApplyIndustry" width="240px">&nbsp;&nbsp;&nbsp;
			技术需求解决方式:
			<input type="radio" name="DealWay" value="独立研发">独立研发
			<input type="radio" name="DealWay" value="委托研发">委托研发
			<input type="radio" name="DealWay" value="合作研发">合作研发
			<input type="radio" name="DealWay" value="其他">其他<br><br>
			合作 意 向 单 位:<input type="text" name="CooperationIndustry" width="240px">&nbsp;&nbsp;&nbsp;
			拟投入自有资金总额:<input type="text" name="SelfInvestment"><br><br>
			<input type="submit" value="保存" name="save" onclick="return checkFillin" />&nbsp;&nbsp;<input type="submit" value="提交" name="submit" onclick="return checkFillin()">&nbsp;&nbsp;<input type="reset" value="重置" name="reset">
		</form>
	</fieldset>
</body>
</html>