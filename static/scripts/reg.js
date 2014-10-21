function pushregiste(){
	var fullname_val = $("#fullname").val();
	var qualifications_val = $("#qualifications option:selected").val();
	var province_val = $("#province option:selected").val();
	var city_val = $("#city option:selected").val();
	var address1_val = $("#address1").val();
	var mobile_val = $("#mobile").val();
	var qqnumber_val = $("#qqnumber").val();
	var extended_val = $("#extended").val();
	var currentstate_val = $("#currentstate option:selected").val();
	var validatecode_val = $("#validatecode").val();
	
	var jsondata = {
		  "fullname":fullname_val.trim(),
		  "qualifications":qualifications_val,
		  "city":province_val+(typeof city_val == 'undefined'?"":city_val),
		  "address1":address1_val.trim(),
		  "mobile":mobile_val.trim(),
		  "qqnumber":qqnumber_val.trim(),
		  "currentstate":currentstate_val,
		  "extended":extended_val.trim(),
		  "validatecode":validatecode_val.trim()
		};
		
	if(checkregiste(jsondata))
		$.post("/registerpost/", jsondata,	registe_recall);
}

function checkregiste(jsondata){
	if(jsondata.fullname == ""){
		showerror("请输入您的姓名。","fullname");
		return false;
	}
	if(jsondata.mobile == ""){
		showerror("请输入您的手机号码。","mobile");
		return false;
	}
	if(!jsondata.mobile.match(/^1[0-9]{2}\d{8}$/)){
		showerror("请输入正确的手机号码。","mobile");
		return false;
	}
	if(jsondata.qqnumber == ""){
		showerror("请输入您的 QQ 号码。","qqnumber");
		return false;
	}
	if(!jsondata.qqnumber.match(/^\d{4,}$/)){
		showerror("请输入正确的 QQ 号码。","qqnumber");
		return false;
	}
	if(jsondata.validatecode == ""){
		showerror("请输入验证码。","validatecode");
		return false;
	}
	if(!jsondata.validatecode.match(/^[a-zA-Z]{4}$/)){
		showerror("验证码错误，请重新输入。","validatecode");
		return false;
	}
	return true;
}

function registe_recall(data){
	switch(data){
		case "successful":{
			alert("您提交的报名信息我们已收到，请耐心等候，谢谢！");
			window.parent.$("#un_mc").fadeOut("slow");
			window.parent.$("#un_mcCon").fadeOut("slow");
			break;
		}
		case "fullnameerror":{
			showerror("请输入您的姓名。","fullname");
			break;
		}
		case "mobileerror":{
			showerror("请输入您的手机号码。","mobile");
			break;
		}
		case "mobileformaterror":{
			showerror("请输入正确的手机号码。","mobile");
			break;
		}
		case "qqerror":{
			showerror("请输入您的 QQ 号码。","qqnumber");
			break;
		}
		case "qqformaterror":{
			showerror("请输入正确的 QQ 号码。","qqnumber");
			break;
		}
		case "codeerror":{
			showerror("验证码错误，请重新输入。","validatecode");
			break;
		}
	}
	
	refresh_code();
}

function showerror(errmsg,controlname){
	alert(errmsg);
	$("#"+controlname).focus();
	$("#"+controlname).select();
}

function refresh_code(){
	var ran = Math.random()*100000;
	document.getElementById('img_code').src='/code?ran='+Math.random()*100000;
}

String.prototype.trim=function()
{
     return this.replace(/(^\s*)|(\s*$)/g,"")
}