<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/views/include/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<script type="text/javascript" src="${root }/static/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${root }/static/js/jquery-ui.js"></script>
		<link href="${root }/static/css/bigpage.css" rel="stylesheet"
			type="text/css" />
		<link href="${root }/static/css/jquery-ui.css" rel="stylesheet"
			type="text/css" />
		<link href="${root }/static/css/easyui.css" rel="stylesheet"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
		@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],
		.ng-cloak,
		.x-ng-cloak,
		.ng-hide{display:none !important;}ng\:form{display:block;}
		.ng-animate-block-transitions{
		transition:0s all!important;
		-webkit-transition:0s all!important;
		}
		</style>
		<title>商家中心</title>
		<!-- <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="renderer" content="webkit"> -->
		<!-- / bootstrap [required] -->
		<link href="${root}/static/css/bs3admin.20151119-1.css" rel="stylesheet" type="text/css" media="screen,projection">
		<style>
			  body {
				  background-color: #FFF;
			  }
			  #content {
				  background-color: #FFF;
			  }
			  #top-nav {
				  margin-bottom: 0px;
			  }
			  .page-header {
				  margin-bottom: 10px;
				  padding-bottom: 10px;
			  }
			  header .navbar > .nav > li > a {
				  border-radius: 0;
			  }
		</style>
		<!--<script type="text/javascript" async="" src="./商家中心_files/ga.js"></script>-->
		<script type="text/javascript">
		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-7572959-9']);
		  _gaq.push(['_trackPageview']);

		  (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script>
	</head>
	<body  style="">
		<div class="hbody">
			<header>	
				<div class="progress progress-striped active app-loading-container ready" data-ng-class="status">
					<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
						<span>努力加载中......</span>
					</div>
				</div>
			</header>
			<div id="wrapper">
				<!--<section id="content">-->
					<div class="container">
						<div class="row" id="content-wrapper">
							<!-- <div class="crumbs"> --><!-- <\!-- <div class="shortcut cu-span"><a target="right" href="/lingtouyang"><span>网站首页</span></a><\\!--<a target="right" href="#"><span>更新缓存</span></a><a href="#"><span>后台地图</span></a>-\\-></div> -\-> --><!-- <\!--    <span class="icon-home"></span>当前位置： -\-> --><!-- <\!--    <span id="current_pos">内容 &gt; 内容发布管理 &gt; 管理内容 &gt; <span id="current_pos_attr"></span></span> -\-> --><!--  </div> -->
							<div class="col-xs-12">
								<div class="app row border_gray clearfix">
									<div growl="" class="ng-scope">
										<div class="growl"></div>
									</div>
									<div ng-view="" id="ng-view" class="autoscroll:true; ng-scope">
										<style class="ng-scope">
										  table td b {float:right;}
										</style>
										<div class="page-header ng-scope">
											<h1 class="pull-left"><i class="icon-th"></i>订单详情</h1>
											<div class="pull-right">
											<a href="${root}/salaorder/index" style="font-size:16px;"><i class="icon-circle-arrow-left"></i> 返回</a>
											</div>
										</div>
										<c:if test="${! empty saleOrderPo}">
										<div class="box ng-scope">
											<div class="box-header blue-background">
											  <div class="title">订单状态</div>
											</div>
											<div class="box-content">
												<div class="fuelux" ng-show="order.state&lt;6">
													<div class="wizard clearfix">
														<ul class="steps">
														  <!-- ngRepeat: state in ONLINE_STATES --><!-- ngIf: order.paycode!='CODPAY' && state!='' --><!-- end ngRepeat: state in ONLINE_STATES --><!-- ngIf: order.paycode!='CODPAY' && state!='' -->
														  <li style="width:120px;"  
														  <c:if test="${saleOrderPo.orderstate==1&&saleOrderPo.paymentstate==0&&saleOrderPo.paymentcode!='cash_on_delivery'}">
														  class="ng-scope complete active1"
														  </c:if>
														  <c:if test="${!(saleOrderPo.orderstate==1&&saleOrderPo.paymentstate==0&&saleOrderPo.paymentcode!='cash_on_delivery')}">
														  class="ng-scope"
														  </c:if>
														  >
														  	<span class="step ng-binding">1.待付款</span>
														  </li>
														  <li style="width:160px;" 
														  	<c:if test="${(saleOrderPo.orderstate==1 and saleOrderPo.paymentstate==1 and paymentcode!='cash_on_delivery')
																or (saleOrderPo.paymentstate==0 and saleOrderPo.paymentcode=='cash_on_delivery') }">
																class="ng-scope complete active1"
															</c:if>
														  	<c:if test="${!((saleOrderPo.orderstate==1 and saleOrderPo.paymentstate==1 and paymentcode!='cash_on_delivery')
																or (saleOrderPo.paymentstate==0 and saleOrderPo.paymentcode=='cash_on_delivery')) }">
																 class="ng-scope"
															</c:if>															
														  	>
														  	<span class="step ng-binding">2.平台待处理</span>
														  </li>
														  <li style="width:160px;" 
														  <c:if test="${saleOrderPo.orderstate==7}">
														  	 class="ng-scope complete active1"
														  </c:if> 
														  <c:if test="${saleOrderPo.orderstate!=7}">
														  	 class="ng-scope"
														  </c:if>														  
														  	 >
														  	<span class="step ng-binding">3.平台处理中</span>
														  </li>
														  <li style="width:120px;"  
														  	<c:if test="${saleOrderPo.orderstate==2&&saleOrderPo.paymentstate==1}">
														  		 class="ng-scope complete active1"
														  	</c:if>
														  	<c:if test="${!(saleOrderPo.orderstate==2&&saleOrderPo.paymentstate==1)}">
														  		 class="ng-scope"
														  	</c:if>														  
														  class="ng-scope">
														  	<span class="step ng-binding">4.已完成</span>
														  </li>
														</ul>
													</div>
												</div>

											</div>
										</div>
										<div class="box ng-scope">
											<div class="box-header blue-background">
												<div class="title">基本信息</div>
											</div>
										</div>
										<div class="box ng-scope">
											<div class="box-content">
												<table class="table table-bordered">
													<tbody>
														<tr>
															<td class="col-md-2"><b>订单号</b></td><td class="col-md-4 ng-binding">${saleOrderPo.order_no}</td>
															<td class="col-md-2"><b>订单状态</b></td>
															<td class="col-md-4 ng-binding">
																<c:if test="${saleOrderPo.orderstate==1&&saleOrderPo.paymentstate==0&&saleOrderPo.paymentcode!='cash_on_delivery'}">
																待付款
																</c:if>
																<c:if test="${saleOrderPo.orderstate==2&&saleOrderPo.paymentstate==1}">
																已完成
																</c:if>
																<c:if test="${saleOrderPo.orderstate==8}">
																已删除
																</c:if>
																<c:if test="${saleOrderPo.orderstate==9}">
																已取消
																</c:if>	
																<c:if test="${saleOrderPo.orderstate==7}">
																平台处理中
																</c:if>	
																<c:if test="${(saleOrderPo.orderstate==1 and saleOrderPo.paymentstate==1 and paymentcode!='cash_on_delivery')
																or (saleOrderPo.paymentstate==0 and saleOrderPo.paymentcode=='cash_on_delivery') }">
																平台待处理
																</c:if>																																														
															</td>
														</tr>
														<tr>
															<td><b>购货人</b></td>
															<c:if test="${! empty addrPo}">
															<td class="ng-binding">${addrPo.name}</td>
															</c:if>
															<c:if test="${ empty addrPo}">
															<td class="ng-binding"></td>
															</c:if>															
															<td><b>下单时间</b></td>
															<td class="ng-binding">
																<%-- ${saleOrderPo.orderstatetime } --%>
																<fmt:formatDate value="${saleOrderPo.orderstatetime }" pattern="yyyy-MM-dd HH:mm:ss"/> 
															</td>
														</tr>
														<tr>
															<td><b>支付方式</b></td>
															<td class="ng-binding">${saleOrderPo.paymentname}</td>
															<td><b>付款时间</b></td>
															<td class="ng-binding">
																<c:if test="saleOrderPo.paymentcode!='cash_on_delivery'">
																	<fmt:formatDate value="${saleOrderPo.paymenttime }" pattern="yyyy-MM-dd HH:mm:ss"/>
																</c:if>
															</td>
														</tr>
														<tr>
															<td><b>用户名</b></td>
															<td>${saleOrderPo.customername}</td>
															<td><b>订单金额</b>
															</td>
															<td class="ng-binding">${saleOrderPo.ordermoney}元</td>
														</tr>
														
														<!-- <tr>
															<td><b>买家要求送货时间</b></td><td class="ng-binding"></td><td><b>卖家发货时间</b></td><td class="ng-binding"></td>
														</tr> -->
														<tr></tr>
														<!-- end ngRepeat: (k,v) in order.extra2 -->
														<tr></tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="box ng-scope">
											<div class="box-header blue-background">
												<div class="title">收货人信息</div>
											</div>
											<div class="box-content">
													<table class="table table-bordered">
														<tbody>
														  	<c:if test="${! empty addrPo}">
															<tr>
																<td class="col-md-2"><b>收货人</b></td>
																<td class="col-md-4 ng-binding">${addrPo.name}</td>
																<td class="col-md-2"><b>电子邮件</b></td>
																<td class="col-md-4 ng-binding"></td>
															</tr>
															<tr>
																<td><b>地址</b></td>
																<td class="ng-binding"><!-- ngIf: order.province -->${addrPo.address}&nbsp;&nbsp;${addrPo.areaRegion}
																&nbsp;&nbsp;${addrPo.street}</td>
																<td><b>邮编</b></td>
																<td class="ng-binding">
																	${addrPo.zip_code }
																	
																</td>
															</tr>
															<tr>
																<td><b>电话</b></td>
																<td class="ng-binding">${addrPo.telephone}</td>		
															</tr>
															</c:if>
														  	<c:if test="${ empty addrPo}">
															<tr>
																<td class="col-md-2"><b>收货人</b></td>
																<td class="col-md-4 ng-binding"></td>
																<td class="col-md-2"><b>电子邮件</b></td>
																<td class="col-md-4 ng-binding"></td>
															</tr>
															<tr>
																<td><b>地址</b></td>
																<td class="ng-binding"><!-- ngIf: order.province --></td>
																<td><b>邮编</b></td>
																<td class="ng-binding">											
																</td>
															</tr>
															<tr>
																<td><b>电话</b></td>
																<td class="ng-binding"></td>
																<td><b>手机</b></td><td class="ng-binding"></td>
															</tr>
															</c:if>															
														</tbody>
													</table>		
											</div>
										</div>
										<div class="box ng-scope">
											<div class="box-header blue-background">
												<div class="title">商品信息</div>
											</div>
											<div class="box-content">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>图片</th><th>名称</th><th>商品编号</th><th>价格</th><th>数量</th><th>小计</th>
														</tr>
													</thead>
													<c:if test="${ ! empty list}">
														<tbody>
															<c:forEach var="its" items="${list }" >
																<tr ng-repeat="item in order.items" ng-class="{success: item.parent==null}" class="ng-scope success">
																  <td>
																  		<a href="http://www.demlution.com/product/357210/" target="_blank">
																  		<img ng-if="item.parent==null" width="70" height="52" ng-src="http://${its.pic }"><!-- end ngIf: item.parent==null --> </a>
																  	</td>
																  	<td>
																  		<a href="" target="_blank" class="ng-binding">${its.name}</a>
																  	</td>
																  	<td class="ng-binding">${its.code }</td>
																  	<td class="ng-binding">${its.good_price }</td>
																  	<td class="ng-binding">${its.good_num}</td>
																  	<td> 
																  		<span  class="ng-binding text-success">${its.total_price}元</span>
																  	</td>
																</tr>
															</c:forEach>
														</tbody>
													</c:if>
													<tbody>
														<!-- ngRepeat: item in order.items -->
														<tr><td colspan="5"></td></tr>
														<tr><td rowspan="1"><b>产品金额:</b></td>
														<td colspan="4"> <b class="ng-binding">${saleOrderPo.ordermoney}元</b></td></tr>
														<tr><td rowspan="1"><b>运费:</b></td><td colspan="4"><b class="ng-binding"> 0元</b></td></tr>
														<tr><td rowspan="1"><b>代金劵抵消金额:</b></td><td colspan="4"><b class="ng-binding"> -0元</b></td></tr>
														<tr>
															<td rowspan="1"><b>优惠券抵消金额:</b></td>
															<td colspan="4">
															<!-- ngIf: order.voucher -->
															<!-- ngIf: !order.voucher -->
																<b ng-if="!order.voucher" class="ng-scope">0元</b>
																<!-- end ngIf: !order.voucher -->
															</td>
														</tr>
														<tr>
															<td rowspan="1"><b>积分:</b></td>
															<td colspan="4">
																<!-- ngIf: order.credit_fee -->
																<!-- ngIf: !order.credit_fee -->
																<b ng-if="!order.credit_fee" class="ng-scope">0元</b>
																	<!-- end ngIf: !order.credit_fee -->
															</td>
														</tr>
														<tr>
															<td><b>返现：</b></td>
															<td colspan="4"><b class="ng-binding">-0元</b></td>
														</tr>
														<tr>
															<td rowspan="1"><b>总金额:</b></td>
															<td colspan="4"><b class="ng-binding"> ${saleOrderPo.ordermoney}元</b></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="box ng-scope">
											<div class="box-header blue-background">
											  <div class="title">操作信息</div>
											</div>
											<div class="box-content">
												<table class="table table-bordered">
													<thead>
													  <tr><th>时间</th><th>订单状态</th><th>备注</th>
													</tr></thead>
													<tbody>
													<!-- ngRepeat: action in orderactions -->
													</tbody>
												</table>
											</div>
										</div>
							</c:if>
									</div>
								</div>
							</div>
							
							<input type="hidden" name="csrfmiddlewaretoken" value="dGQO03g9aPF5xgVkNlGu08YqjVZOhHrL">
						</div>
					</div>
				<!--</section>-->
			</div>
		</div>
		<div style="display:none">
			<script type="text/javascript">
			    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
			    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F75fb47e8b856d549e2e9b28533498cdb' type='text/javascript'%3E%3C/script%3E"));
			</script>
			<!-- <script src="./商家中心_files/h.js" type="text/javascript"></script> -->
			<a href="http://tongji.baidu.com/hm-web/welcome/ico?s=75fb47e8b856d549e2e9b28533498cdb" target="_blank">
				<img border="0" src="./商家中心_files/21.gif" width="20" height="20">
			</a>
		</div>
		<!-- <script src="./商家中心_files/da.js"></script> -->
	</body>