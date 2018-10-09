<%@ page language="java" contentType="text/html; charset=utf-8" import="entity.*,org.hibernate.Criteria,org.hibernate.Session,org.hibernate.criterion.Restrictions"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.js">
	
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
	<form name="form1" method="post" action="<%=request.getContextPath() %>/UserServlet?action=edit">
		
	<table border="1" cellSpacing="0" cellPadding="0" width="1050px" height="500px">
		<caption>
			<h2>机构基础信息</h2>
		</caption>
		
		
		<tr>
			<td class="tabLabel" >*机构全称</td>
			<td style="width:500px;">
				<table>
					<tr>
						<td><input name="name" id="name" type="text" value="<%=institution.getName() %>" readonly="readonly"/></td>
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
						<td><input name="manageDepart" type="text" value="<%=institution.getManageDepartment() %>" readonly="readonly"/></td>
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
						<td><input id="comAddress" name="comAddress" type="text" value="<%=institution.getComAddress() %>" readonly="readonly"/></td>
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
							<input type="text" name="loc" id="loc" value="<%=institution.getLoction() %>" readonly="readonly"/>
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
					<td><input id="netAddress" name="netAddress" type="text" value="<%=institution.getComAddress() %>" readonly="readonly"/></td>
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
						<td><input id="email" name="email" type="text" value="<%=institution.getEmail() %>" readonly="readonly"/></td>
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
					<td><input id="corporation" name="corporation" type="text" value="<%=institution.getCorporation() %>" readonly="readonly"/></td>
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
					<td><input name="zipCoding" type="text" value="<%=institution.getZipCoding() %>" readonly="readonly"/></td>
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
					<td><input id="linkMan" name="linkMan" type="text" value="<%=institution.getLinkMan() %>" readonly="readonly"/></td>
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
					<td><input name="fax" type="text" value="<%=institution.getFax() %>" readonly="readonly"/></td>
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
					<td><input name="tel" type="text" value="<%=institution.getTel() %>" readonly="readonly"/></td>
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
					<td><input id="phone" name="phone" type="text" value="<%=institution.getPhone() %>" readonly="readonly"/></td>
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
				<input name="attribute" type="radio" style="width:10px;" value="企业" disabled="disabled" checked="checked"/><b>企业</b>
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
  		 	 	<input name="attribute" type="radio" style="width:10px;" value="高等院校" disabled="disabled" checked="checked"/><b>高等院校</b>
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
  		 	  	<input name="attribute" type="radio" style="width:10px;" value="研究机构" disabled="disabled" checked="checked"/><b>研究机构</b>
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
  		 	  <input name="attribute" type="radio" style="width:10px;" value="其他" disabled="disabled" checked="checked"/><b>其他</b><br><br>
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
					<td><input id="InstitutionCoding" name="institutionCoding" type="text" value="<%=institution.getInstitutionCoding() %>" readonly="readonly"/></td>
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
					<td><input id="pwd" name="pwd" type="text" value="<%=institution.getPwd() %>" readonly="readonly"/></td>
				</tr>
				<tr>
					<td><label id="pwdET"></label></td>
				<tr>
				</table>
			</td>
			<!-- 
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
			 -->
		</tr>
		
		
		<tr>
			<td>*机构简介</td>
			<td colspan="3">
				<table>
				<tr>
					<td colspan="3"><textarea  name="introduction" id="introduction" rows="10" cols="130" readonly="readonly"><%=institution.getIntroduction() %></textarea> </td>
				</tr>
				<tr>
					<td><label id="introductionET" style="diplay:block;"><font color="green">您可以输入200个字符</font></label></td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
	<input type="submit"  name="submit" class="buttonInput" style="width:75px;" value="启用编辑" />
	</form>
	</center>
</body>
</html>