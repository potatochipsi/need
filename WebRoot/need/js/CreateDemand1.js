/**
 * 
 */
$().ready(function(){
	//自定义规则验证
	$.validator.addMethod("em", function(value, element) {
		var emailReg =/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		return this.optional(element) || (emailReg.test(value));
	}, "请正确填写您的邮箱");
	$.validator.addMethod("number", function(value, element) {
		var numberReg = /^[1][3458][0-9]{9}$/;
		return this.optional(element) || (numberReg.test(value));
	}, "请正确填写您的手机号码");
	//规则（把xxx改为相应表单的id）
	$("#form1").validate({
		errorElement:'span',
		errorClass:'help-block',
		focusInvalid:false,
		rules:{
			name:{
				required:true
			},
			shuxing:{
				required:true
			},
			represent:{
				required:true
			},

			lianxiren:{
				required:true
			},
			email:{
				required:true,
				email:true
			},
			telephone:{
				required:true,
				number:true
			},
			jigoujianjie:{
				required : true,
				rangelength : [ 0, 200]
			},
			main:{
				required : true,
				rangelength : [ 0, 500]
			},
			address:{
				required:true,
			},
			telephone : {
				required: true,
				number : true
			}
			
		},
		messages:{
			email:{
				required:"电子邮箱不能为空",
				em:"请输入正确的邮箱"
			},
			name:{
				required:"机构全称不能为空"
			},
			shuxing:{
				required:"机构属性不能为空"
			},
			represent:{
				required:"法人代表不能为空"
			},
			lianxiren:{
				required:"联系人不能为空"
			},
			jigoujianjie:{
				required : "机构简介不能为空",
				rangelength : "填报超过200字"
			},
			address:{
				required:"通讯地址不能为空"
			},
			main:{
				required : "需求概述不能为空",
				rangelength : "填报超过500字"
			},

			telephone : {
				
				required: "手机号为空",
				number : "请输入正确手机号"
			}
		},
		highlight : function(element) {
			$(element).closest('.form-group').addClass('has-error');
		},
		success : function(label) {
			label.closest('.form-group').removeClass('has-error');
			label.remove();
		},
		errorPlacement : function(error, element) {
			element.parent('td').append(error);
		}
	})
})
