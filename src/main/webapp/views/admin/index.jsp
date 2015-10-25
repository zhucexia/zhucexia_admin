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
<link href="${root }/static/css/tree.css" rel="stylesheet"
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
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
	 function aa(){
			alert("bb");
			$("#centerpanel").attr("src","goodattr/index");	
		}
})	
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:80px;">	
	    <iframe src="${root }/views/admin/top.jsp" width="100%" height="80px" frameborder="no" border="0" scrolling="no"></iframe>
   </div>

	<div data-options="region:'west',split:true,title:'  管 理  中 心',iconCls:'icon-manage'" style="width:15%;">
	<dl class="leftmenu">
		<dd>
		    <div class="title">
		    <span><img src="${root }/static/images/leftico01.png" /></span>系统信息管理
		    </div>
		    <ul class="menuson">
		    	<c:forEach var="tree1" items="${srp1 }" varStatus="status">
			    	<c:if test="${status.index==0 }">
			       		 <li  class="active"><cite></cite><a href="javascript:void(0)" onclick="aa('${tree1.sysPowerPo.href}')">${tree1.sysPowerPo.name }</a><i></i></li>
			       	</c:if>
			       	<c:if test="${status.index !=0 }">
			       		<li><cite></cite><a href="javascript:void(0)" onclick="aa('${tree1.sysPowerPo.href}')">${tree1.sysPowerPo.name }</a><i></i></li>
			       	</c:if>
		        </c:forEach>
		    </ul>     
	    </dd> 
	    
	    
	    <dd>
	    	<div class="title">
	    	<span><img src="${root }/static/images/leftico02.png" /></span>客户及订单信息管理
	    	</div>
	    <ul class="menuson">
	        <c:forEach var="tree2" items="${srp2 }" varStatus="status">
		       <c:if test="${status.index==0 }">
			       		 <li><cite></cite><a href="javascript:void(0)" onclick="aa('${tree2.sysPowerPo.href}')">${tree2.sysPowerPo.name }</a><i></i></li>
			       	</c:if>
			       	<c:if test="${status.index !=0 }">
			       		<li><cite></cite><a href="javascript:void(0)" onclick="aa('${tree2.sysPowerPo.href}')">${tree2.sysPowerPo.name }</a><i></i></li>
			       	</c:if>
		    </c:forEach>
	    </ul>    
	    </dd>  
	    
	    
	    <dd>
	    	<div class="title">
	    	<span><img src="${root }/static/images/leftico03.png" /></span>商品信息管理
	    	</div>
	    <ul class="menuson">
	        <c:forEach var="tree3" items="${srp3 }" varStatus="status">
		       <c:if test="${status.index==0 }">
			       		 <li><cite></cite><a href="javascript:void(0)" onclick="aa('${tree3.sysPowerPo.href}')">${tree3.sysPowerPo.name }</a><i></i></li>
			       	</c:if>
			       	<c:if test="${status.index !=0}">
			       		<li><cite></cite><a href="javascript:void(0)" onclick="aa('${tree3.sysPowerPo.href}')">${tree3.sysPowerPo.name }</a><i></i></li>
			       	</c:if>
		    </c:forEach>
	    </ul>    
	    </dd>  
	    
	     <dd>
	    	<div class="title">
	    	<span><img src="${root }/static/images/leftico04.png" /></span>其他管理
	    	</div>
	    <ul class="menuson">
	     <c:forEach var="tree4" items="${srp4 }" varStatus="status">
		       <c:if test="${status.index==0 }">
			       		 <li><cite></cite><a href="javascript:void(0)" onclick="aa('${tree4.sysPowerPo.href}')">${tree4.sysPowerPo.name }</a><i></i></li>
			       	</c:if>
			       	<c:if test="${status.index !=0 }">
			       		<li><cite></cite><a href="javascript:void(0)" onclick="aa('${tree4.sysPowerPo.href}')">${tree4.sysPowerPo.name }</a><i></i></li>
			       	</c:if>
		    </c:forEach> 
	    </ul>    
	    </dd>  
    </dl> 

	</div>
	
	<!-- <div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">
		east region
	</div> -->
	<!-- <div data-options="region:'south',border:false" style="height:50px;background:#3B95C8;padding:10px;">
		south region
	</div> -->
	<div data-options="region:'center',title:'功能模块',iconCls:'icon-database'" id="center-main" name="center-main">
		 <iframe id="centerpanel" width="100%" height="100%" frameborder="no" border="0" name="centerpanel" scrolling="no"></iframe>
  	</div>
</body>
<script type="text/javascript">
		function aa(dd){
			$("#centerpanel").attr("src",dd);		
		 }
	</script> 

</html>