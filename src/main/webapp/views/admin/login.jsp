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
<body id="userlogin_body" style="background:url(${root }/static/css/images/user_all_bg.gif) #226cc5 repeat-x 50% top;">
	<%-- <center>
		<form id="loginForm" method="post" action="${root}/sysUser/login">
			用户名:<input type="text" name="username"  align="middle"/><br/>
			密&nbsp;码:<input type="password" name="password" align="middle"><br/>
			<input type="submit" value="登录"  align="middle">
			<input type="button" value="注册" align="middle"><br/>
			<a href="javascript:void(0)" >忘记密码?</a><br/>
			
		</form>
	</center>
	 --%>

<form id="loginForm" method="post" action="${root}/sysUser/login">
<div id="user_login">
	<dl>
		<dd id="user_top">
			<ul>
				<li class="user_top_l" style="background:url(${root }/static/css/images/user_top_l.gif) no-repeat 50% top"></li>
				<li class="user_top_c" style="background:url(${root }/static/css/images/user_top_c.gif) no-repeat 50% top"></li>
				<li class="user_top_r" style="background:url(${root }/static/css/images/user_top_r.gif) no-repeat 50% top"></li>
			</ul>
		</dd>
		<dd id="user_main">
			<ul>
				<li class="user_main_l" style="background:url(${root }/static/css/images/user_main_l.gif) #bec5cc no-repeat 50% top"></li>
				<li class="user_main_c" style="background:url(${root }/static/css/images/user_main_c.gif) #bec5cc no-repeat 50% top;width:280px">
					<div class="user_main_box">
						<ul>
							<li class="user_main_text">用户名： </li>
							<li class="user_main_input"><input name="username" maxlength="15" id="TxtUserName" class="txtusernamecssclass" style="background:url(${root }/static/css/images/user_login_name.gif) no-repeat;"> </li>
						</ul>
						<ul>
							<li class="user_main_text">密 码： </li>
							<li class="user_main_input"><input type="password" name="password" id="TxtPassword" class="txtpasswordcssclass" style="background:url(${root }/static/css/images/user_login_password.gif) no-repeat;"> </li>
						</ul>
						
						<!-- <ul>
							<li class="user_main_text" style="color:yellow;font-size:14px;font-weight:bold;">警告: </li>
							<li class="user_main_input" style="color:yellow;font-size:14px;font-weight:bold;">非管理员禁止登陆 </li>
						</ul> -->
						<ul>
							<li class="user_main_input" style="color:red;font-size:14px;font-weight:bold;"><span id="ts">${ts}</span> </li>
						</ul>
					</div>
				</li>
				<li class="user_main_r" style="background:url(${root }/static/css/images/user_main_r.gif) #bec5cc no-repeat 50% top"><input type="image" name="IbtnEnter"  src="${root }/static/css/images/user_botton.gif" class="ibtnentercssclass"></li>
			</ul>
		</dd>
		<dd id="user_bottom">
			<ul>
				<li class="user_bottom_l" style="background:url(${root }/static/css/images/user_bottom_l.gif) no-repeat 50% top"></li>
				<li class="user_bottom_c" style="background:url(${root }/static/css/images/user_bottom_c.gif) no-repeat 50% top;"></li>
				<li class="user_bottom_r" style="background:url(${root }/static/css/images/user_bottom_r.gif) no-repeat 50% top"></li>
			</ul>
		</dd>
	</dl>
</div>
</form>

</body>

</html>