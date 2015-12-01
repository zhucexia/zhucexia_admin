<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include/base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${root }/static/css/login.css" rel="stylesheet"
	type="text/css" />
</head>
<script type="text/javascript"
	src="${root }/static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${root }/static/js/cloud.js"></script>
<!-- 
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script> -->
<script language="javascript">
	$(function(){
    	$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){  
    	$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 
<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  

<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
   <!--  <li><a href="#">回首页</a></li> -->
    <!-- <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li> -->
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    <form id="loginForm" method="post" action="${root}/sysUser/login">
    <ul>
    <li><input name="username" type="text" class="loginuser" value="用户名" onclick="JavaScript:this.value=''"/></li>
    <li><input name="password" type="password" class="loginpwd" value="密码" onclick="JavaScript:this.value=''"/></li>
    <li><input name="" type="submit" class="loginbtn" value="登录" /><label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label style="color:red;font-size:16px;font-weight:bold;"><span id="ts">${ts}</span></label></li>
    </ul>
    </form>
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm">注册侠后台  <a href="http://www.zhucexia.com">www.zhucexia.com</a>  非管理员禁止入内</div>
	
    
</body>

</html>