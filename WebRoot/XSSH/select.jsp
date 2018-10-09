<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>综合查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/gb.ResultPage.min.js?v=D59787997F3B8FCE" ></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<body onload="pageLoadDisableWordTimes();" onkeydown="if(event.keyCode==13) {SubmitKey();return false;}else{}">
  <!-- 执行查询 -->
  <form id="Form1" name="Form1" action="select.action" method="post">        
 <dl id="searchdiv">  
  <dd class="divsearch" id="ddSubmit" name="ddSubmit" onkeydown="if(event.keyCode==13){SubmitForm();return false;}" >
      <div align="center"><h4> 输入查询条件(最多选择9个)：</h4></div>
        <table id="txt" align="center">
            <tr><td><input id="txt_i" value="1" type="hidden" name="txt_i" /></td>
            <td><input id="txt_c" value="9" type="hidden" name="txt_c" /></td></tr>
            <tr id="hidden_logical_txt" style="display:none">
                <td>
                    <select id="txt_1_logical" name="txt_1_logical">                      
                        <option value="or">或者</option>
                        <option value="and" >并且</option>
                        <option value="not">不含</option>
                    </select>
                </td>
            </tr>
            <tr id="txt_1" class="mainKey">
                <td class="aomBtn">
                    <a href="javascript:AddRowEx('txt','txt_i','txt_c');">
                        <img src='../skins/sky/tab/nolines_plus.gif' border="1"/>
                    </a><a href="javascript:DeleteRowSaveID('txt','txt_i','txt_c');">
                        <img src='../skins/sky/tab/nolines_close.jpg' border="1" alt=""/>
                    </a> 
                </td>
                <td>
                  <select id="txt_1_sel" name="txt_1_sel" onchange="disableWordTimes(this);return false;" class="selectW1">
                        <option value='sh' selected>技术审核状态</option>
                        <option value='government'>机构归口管理单位</option>
                         <option value='bm'>审核部门</option>
                        <option value='tcooperate' >技术合作模式</option>
                        <option value='cnature'>机构属性</option>   
                        <option value='tnature'>科技活动类型</option>
                        <option value='classify' >学科分类</option>
                        <option value='sphere' >需求技术所属领域</option>
                        <option value='industry' >需求技术应用行业</option>
                    </select>
                    <input  id="txt_1_value1" name="txt_1_value1" size="10"  value="${txt_1_value1 }"
                              maxlength="120" type="text" onFocus="if(KeywordVal(this.value)==false) this.value='';document.getElementById('currentid').value=this.id;"
                              onkeypress="SignVal(this,'sign',event)" onpaste="return SignVal(this,'value',event)"  onkeyup="SignVal1(this)"  />
                     <select id="txt_1_special1" name="txt_1_special1" onChange="">
                        <option value='%'>模糊</option>
                        <option value='' selected>精确</option>
                    </select>
                </td>
            </tr>
        </table>
        <!-- 输入的9个输入框的值 -->
      <input type="hidden" id="txt_1_extension" name ="txt_extension" value=""/>
      <input type="hidden" id="txt_2_extension" name ="txt_extension" value=""/>
      <input type="hidden" id="txt_3_extension" name ="txt_extension" value=""/>
      <input type="hidden" id="txt_4_extension" name ="txt_extension" value=""/>
      <input type="hidden" id="txt_5_extension" name ="txt_extension" value=""/>
      <input type="hidden" id="txt_6_extension" name ="txt_extension" value=""/>
      <input type="hidden" id="txt_7_extension" name ="txt_extension" value=""/>
       <input type="hidden" id="txt_8_extension" name ="txt_extension" value=""/>
       <input type="hidden" id="txt_9_extension" name ="txt_extension" value=""/>
  </dd>
</dl>
 <div class="btnPlace2" align="center">        
         <input type="submit"name="submit"   value="查询" style="margin-left:20px; margin-top:20px"  >     
      </div>              
</form>
<table border="1" align="center">
		<tr>
			<th>技术编号</th>
			<th>技术需求名称</th>
			<th>企业编号</th>
			<th>开始年限</th>
			<th>结束年限</th>
			<th>关键字</th>
			<th>研究类型</th>
			<th>拟投入资金总额</th>
			<th>操作</th>
		</tr>
		<c:forEach var="tec" items="${tecs }">
			<tr align="center"  height="24px">
				<td width="100">${tec.tid}</td>
				<td width="160">${tec.tname}</td>
				<td width="160">${tec.cid}</td>
				<td width="70">${tec.tksnear }</td>
				<td width="150">${tec.tjsnear }</td>
				<td width="150">${tec.tkeyword1 }&nbsp;&nbsp;${tec.tkeyword2 }&nbsp;&nbsp;${tec.tkeyword3 }&nbsp;&nbsp;${tec.tkeyword4 }&nbsp;&nbsp;${tec.tkeyword5 }</td>
				<td width="150">${tec.tnature }</td>
				<td width="150">${tec.tcapital }</td>
				<td width="120">
					<a href="XHtecQxx.action?param=0&tname=${tec.tid}">查看</a>&nbsp;&nbsp;
				</td>
			</tr>
		</c:forEach>
</table>
</body>
</html>