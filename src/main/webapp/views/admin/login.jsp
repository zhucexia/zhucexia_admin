<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form id="loginForm" method="post" action="${root}/sysUser/login">
			用户名:<input type="text" name="username"  align="middle"/><br/>
			密&nbsp;码:<input type="password" name="password" align="middle"><br/>
			<input type="submit" value="登录"  align="middle">
			<input type="button" value="注册" align="middle"><br/>
			<a href="javascript:void(0)" >忘记密码?</a><br/>
			
		</form>
	</center>
</body>
</html>