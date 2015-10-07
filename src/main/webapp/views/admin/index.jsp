<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
		north region
	</div>
	<div data-options="region:'west',split:true,title:'管理模块'" style="width:150px;padding:10px;">
		<ul id="tt" class="easyui-tree" data-options="url:'${root }/sysRolePower/getRolePower',method:'post',animate:true"></ul>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#tt").tree({
						onClick:function(node){
							/*获取节点路径*/
							var paths=node.attributes.url;
						
							/*方法一使用iframe
							$("#centerpanel").attr("src",paths);
							还需要在下面添加一个iframe
							<iframe id="centerpanel"
							width="100%" height="100%" scrolling="no"></iframe>
							*/
							/*方法二：直接给layout中间的分隔区一个id，然后使用load方法加载页面*/
							$("#center-main").load(paths);
						}	
			})
				
			}
			
		)
	</script>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">
		east region
	</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">
		south region
	</div>
	<div data-options="region:'center',title:'功能模块'" id="center-main">
		<!--  <iframe id="centerpanel" width="100%" height="100%" scrolling="no"></iframe>
  -->	</div>
</body>


</html>