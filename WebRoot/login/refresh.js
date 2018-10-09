//这个函数是用来生成验证码的
$(document).ready(function(){
	$("#shuaxin").click(function (){
		$("#shuaxin").attr("src","login/randCode.jsp?"+Math.random());
	});
});