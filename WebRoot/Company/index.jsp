<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>河北省重大技术需求征集系统</title>
<script src="../jquery/jquery2.0.0.min.js"></script>
<script type="text/javascript" src="../js/select.js"></script>

<script>
 
function validate(){
	var a = document.getElementById("T_Keyword1").value;
	var b = document.getElementById("T_Keyword2").value;
	var c = document.getElementById("T_Keyword3").value;
	var d = document.getElementById("T_Keyword4").value;
	var e = document.getElementById("T_Keyword5").value;
	if(a.length>10||b.length>10||c.length>10||d.length>10||e.length>10){
	    document.getElementById("spw").innerText="关键字不得超过10个字符！";
	}
	else{
		document.getElementById("spw").innerText="";
	}
	
}
</script>
<SCRIPT language="javascript">
function star()
{
		if (form1.T_Name.value == "") {
			window.alert("请输入技术需求名称！");
			form1.Tec_Name.focus();
			return false;
		}
		if (form1.T_Synopsis1.value == ""||form1.T_Synopsis2.value == ""||form1.T_Synopsis3.value == "") {
			window.alert("请输入科技需求概述！");
			form1.Tec_Contents.focus();
			return false;
		}
     return true;
}
function star2()
{
		if (form1.T_Name.value == "") {
			window.alert("请输入技术需求名称！");
			form1.Tec_Name.focus();
			return false;
		}
		if (form1.T_Synopsis1.value == ""||form1.T_Synopsis2.value == ""||form1.T_Synopsis3.value == "") {
			window.alert("请输入科技需求概述！");
			form1.Tec_Contents.focus();
			return false;
		}
		alert("需求信息提交后不能修改！ 确定提交吗？");
     return true;
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
function gbcount2(message,total,used,remain) 
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
function check1()
{
	var b=document.getElementById("Sphere10").value;
	var c=document.getElementById("其他").value;
	if(b!="")
	{
		b=c;
	}
}
function check2(a1)
{
	//var a=document.getElementById("a1").value;
	if(a1.value==""){
		alert("开始年份为空！请重新输入");
		loginform.T_KSNear.focus();
	}
}
function check3(a1,d1)
{
	//var d=document.getElementById("d1").value;
	if(d1.value==""){
		alert("结束年份为空！请重新输入");
		loginform.T_JSNear.focus();
	}
	else
	{
		var myDate = new Date();
		myDate.getFullYear(); //获取完整的年份(4位,1970-????)
		if(myDate.getFullYear()>parseFloat(d1.value))
		{
			alert("结束年份小于当前年份！");
			d1.value="";
			loginform.T_JSNear.focus();
		}
		else
		{
			if(parseFloat(a1.value)>parseFloat(d1.value))
			{
				alert("开始年份大于结束年份！");
				loginform.T_JSNear.focus();
			}
		}
	}
}
function check(t)
{
	if(event.keyCode==9)
		{
		t.style.display="";
		}
}
function show()
{
	var v=document.getElementById("T_Nature").value;
	var t=document.getElementById("area");
	if(v=="基础研究")
	{
		t.style.display="";
	}
	else
	{
		t.style.display="none";
	}
	var t2=document.getElementById("area2");
	if(v=="基础研究")
	{
		t2.style.display="none";
	}
	else
	{
		t2.style.display="";
	}
}
function showValue(evt)
{
	var value=evt.target.value;
	var showBox=document.getElementById("showValue");
	showBox.value=value;
}
</script>
<style type="text/css">
<!--
h1,h2,h3,h4,h5,h6 {
	font-family: 楷体, 隶书, 幼圆, 微软雅黑;
	font-weight: bold;
}
.STYLE2 {
	font-family: "幼圆";
	font-size: 18px;
	color: #000000;
	font-weight: bold;
}
.red{
	color: #ff0000;}
-->
</style>
</head>
<body>
<jsp:useBean id="db" class="needs.DBean" scope="page" />
     <!-- 表单号生成 -->
        <% 
	    Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        String s1=sdf.format(date);
        for(int i=0;i<4;i++)
        {
	       int rand=(int)(Math.random()*9);
	       s1+=rand;
        }
       session.setAttribute("num",s1);
       %> 
     <!-- 表单号生成结束 -->	
     <!-- 技术需求编号生成 -->
        <% 
	    Date date1=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMdd");
        String s2=sdf.format(date);
        for(int i=0;i<4;i++)
        {
	       int rand=(int)(Math.random()*9);
	       s2+=rand;
        }
       session.setAttribute("num",s2);
       %> 
     <!-- 技术需求编号生成结束 -->
 <table  width="1050" height="500" border="3" align="center" class="STYLE2">
		<tr>
    <td colspan="9"><p>河北省重大技术需求征集表</p>
    <p>(带<i class="red"> * </i>号的为必填项,信息为调查使用,请认真填写.)</p>
    </td>
  </tr>
  <tr>
	   <td colspan="3">组织结构编码: <i class="red">*</i> </td>
	      <td colspan="2">${user.cid }</td>
    <td>企业名称：<i class="red">*</i></td>
    <td>${user.cname }</td>
    <td>归口单位：<i class="red">*</i></td>
    <td>${user.government}</td>
  </tr>
  <tr>
    <td colspan="3">通讯地址：<i class="red">*</i></td>
    <td colspan="6">${user.address}</td>
  </tr>
  <tr>
    <td colspan="3">公司网站：</td>
    <td colspan="2">${user.internet}</td>
    <td>电子邮箱：<i class="red">*</i></td>
    <td colspan="3">${user.email}</td>
  </tr>
  <tr>
    <td colspan="3">法人：<i class="red">*</i></td>
    <td colspan="2">${user.people}</td>
    <td>邮政编码：</td>
    <td colspan="3">${user.postalcode}</td>
  </tr>
  <tr>
    <td colspan="3" rowspan="2">联系人：<i class="red">*</i></td>
    <td colspan="1" rowspan="2">${user.linkman}</td>
    <td height="36">电话：</td>
    <td width="89">固定电话：<i class="red">*</i></td>
    <td width="181">${user.phone}</td>
    <td width="79">手机：<i class="red">*</i></td>
    <td width="219">${user.telephone}</td>
  </tr>
  <tr>
    <td colspan="2" height="36">传真号码：</td>
    <td colspan="3">${user.fax}</td>
  </tr>
  <tr>
    <td colspan="4">机构属性：<i class="red">*</i></td>
    <td colspan="5">${user.cnature}</td>
  </tr>
  <tr>
    <td colspan="4">机构简介：<i class="red">*（单位基本情况，研究基础等，限200字）</i></td>
    <td colspan="5">${user.synopsis}</td>
  </tr>
  </table>
  
  <!-- 技术填报 -->
  <form action="tecAdd.action" method="post">
  <input name="param" type="hidden" value="1">
  <input type="hidden" name="tec.bm" class="full" id="bm" value="">
  <input type="hidden" name="tec.csry" class="full" id="csry" value="">
  <input type="hidden" name="tec.zsry" class="full" id="zsry" value="">
  <input type="hidden" name="tec.cw" class="full" id="cw" value="">
  <input type="hidden" name="tec.sh" class="full" id="sh" value="保存">
  <input type="hidden" name="tec.cid" class="full" id="cid" value="${user.cid }">
  <input type="hidden" name="tec.tid" class="full" id="tid" value="<% out.print(s2);%>">
  <table  width="1050" height="520" border="3" align="center" align="center" class="STYLE2">
  <tr>
    <td>技术需求名称： <i class="red">*</i></td>
    <td colspan="2"><input name="tec.tname" type="text" id="T_Name" onchange="check2()"></td>
  </tr>
  <tr>
    <td>需求时限： <i class="red">*</i></td>
    <td colspan="2">开始年份：<input name="tec.tksnear" type="text" id="T_KSNear" onchange="check2(T_KSNear)">年
    				结束年份：<input name="tec.tjsnear" type="text" id="T_JSNear" onchange="check3(T_KSNear,T_JSNear)" >年</td>
  </tr>
  <tr>
    <td height="106" rowspan="4">技术需求概述:<i class="red">*</i></td>
    <td width="326" height="52">1、主要问题（需要解决的重大技术问题）<i class="red">*</i></td>
    <td width="486"><textarea name="tec.tsynopsis1" type="text" id="T_Synopsis1" 
    rows="10" cols="75" onKeyDown="gbcount(this.form.T_Synopsis1,this.form.total,this.form.used,this.form.remain);" 
    onKeyUp="gbcount(this.form.T_Synopsis1,this.form.total,this.form.used,this.form.remain);"></textarea>
<p>最多字数： 
<input disabled maxLength="4" name="total" size="3" value="500" class="inputtext"> 
已用字数： 
<input disabled maxLength="4" name="used" size="3" value="0" class="inputtext"> 
剩余字数： 
<input disabled maxLength="4" name="remain" size="3" value="500" class="inputtext"></td>
  </tr>
  <tr>
    <td height="52">2、技术关键（所需的关键技术、主要指标）<i class="red">*</i></td>
    <td height="52"><textarea name="tec.tsynopsis2" type="text" id="T_Synopsis2" 
    rows="10" cols="75" onKeyDown="gbcount2(this.form.T_Synopsis2,this.form.total2,this.form.used2,this.form.remain2);" 
    onKeyUp="gbcount(this.form.T_Synopsis2,this.form.total2,this.form.used2,this.form.remain2);"></textarea>
<p>最多字数： 
<input disabled maxLength="4" name="total2" size="3" value="500" class="inputtext"> 
已用字数： 
<input disabled maxLength="4" name="used2" size="3" value="0" class="inputtext"> 
剩余字数： 
<input disabled maxLength="4" name="remain2" size="3" value="500" class="inputtext"></td>
  </tr>
  <tr>
    <td height="52">3、预期目标（技术创新性、经济社会效益）</td>
    <td height="52"><textarea name="tec.tsynopsis3" type="text" id="T_Synopsis3" 
    rows="10" cols="75" onKeyDown="gbcount(this.form.T_Synopsis3,this.form.total3,this.form.used3,this.form.remain3);" 
    onKeyUp="gbcount(this.form.T_Synopsis3,this.form.total3,this.form.used3,this.form.remain3);"></textarea>
<p>最多字数： 
<input disabled maxLength="4" name="total3" size="3" value="500" class="inputtext"> 
已用字数： 
<input disabled maxLength="4" name="used3" size="3" value="0" class="inputtext"> 
剩余字数： 
<input disabled maxLength="4" name="remain3" size="3" value="500" class="inputtext"></td>
  </tr>
  <tr>
    <td height="200px">关键字：<i class="red">* （不得少于一个）</i></p><span id="spw" style="display: inline;"></span></td>
    <td colspan="2">
    <p><input name="tec.tkeyword1" type="text" id="T_Keyword1"  onkeydown="check(T_Keyword2)" onchange="validate()"></p>
    <p><input name="tec.tkeyword2" type="text" id="T_Keyword2" style="display:none;" onkeydown="check(T_Keyword3)" onchange="validate()"></p>
    <p><input name="tec.tkeyword3" type="text" id="T_Keyword3" style="display:none;" onkeydown="check(T_Keyword4)" onchange="validate()"></p>
    <p><input name="tec.tkeyword4" type="text" id="T_Keyword4" style="display:none;" onkeydown="check(T_Keyword5)" onchange="validate()"></p>
    <p><input name="tec.tkeyword5" type="text" id="T_Keyword5" style="display:none;"  onchange="validate()"></p>
    </td>
  </tr>
    <tr>
    <td height="50" >拟投入资金总额：<i class="red">*</i></td>
    <td><input name="tec.tcapital" type="text" id="T_capital" onchange="check()">万元</td>
  </tr>
  <tr>
    <td>技术需求合作模式：<i class="red">*</i></td>
    <td colspan="2"><input type="radio" name="tec.tcooperate" value="独立开发"/>独立开发&nbsp;
                <input type="radio" name="tec.tcooperate" value="技术转让" />技术转让 &nbsp;
                <input type="radio" name="tec.tcooperate" value="技术入股" />技术入股 &nbsp;
                <input type="radio" name="tec.tcooperate" value="合作开发" />合作开发 &nbsp;
                <input type="radio" name="tec.tcooperate" value="其他" />其他 &nbsp;</td>
  </tr>
  <tr>
    <td height="50" >合作意向单位：</td>
    <td colspan="2"><input name="tec.tcompany" type="text" id="T_company" ></td>
  </tr>
  <tr>
    <td>科技活动类型：<i class="red">*</i></td>
    <td colspan="2">
    <select name="tec.tnature" id="T_Nature" onchange="show()">
				<option value="基础研究">基础研究</option>
				<option value="应用研究">应用研究</option>
				<option value="试验发展">试验发展</option>
				<option value="研究发展与成果应用">研究发展与成果应用</option>
				<option value="技术推广与科技服务">技术推广与科技服务</option>
				<option value="生产性活动">生产性活动</option>
				</select>
<div style="display:;" id="area">
  <p>学科分类： <i class="red">*</i>
  <select name="fir" id="fir" onchange="getSecondXkfls()">
			<option>-----请选择-----</option>
		</select>
	  <select name="sec" id="sec" onchange="getThirdXkfls()">
      		<option>-----请选择-----</option>
      </select>
	  <select name="thi" id="thi" onchange="inputXkfl()">
       		<option>-----请选择-----</option>
      </select>
      	<input name="tec.classify" type="hidden" id="XKFL" value="1100000"/>
    </div>
<div style="display:none;" id="area2">
  <p>需求技术所属领域： <i class="red">*</i></p>
    <p><input type="checkbox" name="tec.sphere" />电子信息;&nbsp;
                <input type="checkbox" name="tec.sphere" />光机电一体化; &nbsp;
                <input type="checkbox" name="tec.sphere" />软件; &nbsp;
                <input type="checkbox" name="tec.sphere" />生物技术与制药; &nbsp;
                <input type="checkbox" name="tec.sphere" />新材料及应用; &nbsp;</p>
                <p> 
                <input type="checkbox" name="tec.sphere" />现代农业;&nbsp;
                <input type="checkbox" name="tec.sphere" />新能源与高效节能; &nbsp;
                <input type="checkbox" name="tec.sphere" />资源与环境; &nbsp;
                <input type="checkbox" name="tec.sphere" />高技术服务业; &nbsp;
                <input type="checkbox" name="tec.sphere" />海洋; &nbsp;
                </p>
                <p>
                <input type="checkbox" name="tec.sphere" />社会公共事业; &nbsp;
                <input type="checkbox" name="tec.sphere" />医疗卫生; &nbsp;
                <input type="checkbox" name="tec.sphere" />其他;&nbsp;</p>
<p>需求技术应用行业：<i class="red">*</i>
<select name="fir_h" id="fir_h" onchange="getSecondGmjjhys()">
		<option>-----请选择-----</option>
		</select>
	  <select name="sec_h" id="sec_h" onchange="getThirdGmjjhys()">
        <option>-----请选择-----</option>
      </select>
	  <select name="thi_h" id="thi_h" onchange="inputGmjjhy()">
        <option>-----请选择-----</option>
      </select>
      	<input name="tec.industry" type="hidden" id="GMJJHY" />
</div>
  </tr>
  <tr>
    <td height="132" colspan="3"><p align="center">
			<input type="submit" name="submit" value="保存" onclick="star()" class="STYLE2" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
			<input type="reset" value="重置" class="STYLE2"style="margin-top:20px;margin-right:60px; color:#ff0000"></p>
			</td>
  </tr>
  </table>
	</form>
</body>
</html>