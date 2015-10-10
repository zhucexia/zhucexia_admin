<%@ page language="java" import="java.util.*,com.keji50.zhucexiaadmin.dao.po.SysUserPo" pageEncoding="UTF-8"%>
<%@ include file="/views/include/base.jsp"%>
<%@ include file="/views/include/meta.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/tld/JSTLFunction.tld" prefix="dic"%>
<%@ include file="/views/include/dataDic.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册侠后台管理</title>
<link href="${root }/static/css/css.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/bigpage.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/easyui.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="${root }/static/js/common.js"></script>
<script type="text/javascript"
	src="${root }/static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${root }/static/js/jquery-ui.js"></script>

<script type="text/javascript"
	src="${root }/static/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${root }/static/js/jquery-openwindow.js"></script>
<script type="text/javascript" src="${root }/static/js/dataDic.js"></script>
<link href="${root }/static/css/main_css.css" rel="stylesheet"
	type="text/css" />
</head>
<% SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo"); %>
<script type="text/javascript">
		/**退出系统**/
		function logout(){
			
			   
			if(confirm("您确定要退出本系统吗？")){

				top.location.href="${root}/sysUser/toLogin";
			} 
		}
		
		/**获得当前日期**/
		function  getDate01(){
			var time = new Date();
			var myYear = time.getFullYear();
			var myMonth = time.getMonth()+1;
			var myDay = time.getDate();
			var myhour =time.getHours();
			var mymin=time.getMinutes();
			var mys=time.getSeconds();
			if(myMonth < 10){
				myMonth = "0" + myMonth;
			}
			document.getElementById("yue_fen").innerHTML =  myYear + "." + myMonth;
			document.getElementById("day_day").innerHTML =  myYear + "." + myMonth + "." + myDay;
		}
		
	</script>
<body onLoad="getDate01()" id="bos">
    <div id="top">
		<div id="top_logo">
			<img alt="logo" src="${root }/static/images/logo.jpg" width="274" height="49" style="vertical-align:middle;">
		</div>
		<div id="top_links">
			<div id="top_op">
				<ul>
					<li>
						<img alt="当前用户" src="${root }/static/images/user.jpg">：
						
						<span ><%=sysUser.getUsername() %></span>
					</li>
					<li>
						<img alt="事务月份" src="${root }/static/images/month.jpg">：
						<span id="yue_fen"></span>
					</li>
					<li>
						<img alt="今天是" src="${root }/static/images/date.jpg">：
						<span id="day_day"></span>
					</li>
				</ul> 
			</div>
			<div id="top_close">
				<%-- <form action="${root }/sysUser/toLogin"> --%>
					 <a href="javascript:void(0);" onClick="logout();" target="_parent">
						<img alt="退出系统" title="退出系统" src="${root }/static/images/close.jpg" style="position: relative; top: 20px; left: 25px;">
					</a> 
					<%-- <input type="image" src="${root }/static/images/close.jpg" id="esc" style="position: relative; top: 20px; left: 25px;"/> --%>
				<!-- </form> -->
			</div>
		</div>
	</div>
</body>
</html>