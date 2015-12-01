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
											<a href="http://www.demlution.com/store/admin/shop.html#/shop/orders" style="font-size:16px;"><i class="icon-circle-arrow-left"></i> 返回</a>
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
														  <!-- ngRepeat: state in ONLINE_STATES --><!-- ngIf: order.paycode!='CODPAY' && state!='' --><!-- end ngRepeat: state in ONLINE_STATES --><!-- ngIf: order.paycode!='CODPAY' && state!='' --><li style="width:120px;" ng-class="{complete: $index&lt;=order.state, active1: $index==order.state}" ng-if="order.paycode!=&#39;CODPAY&#39; &amp;&amp; state!=&#39;&#39;" ng-repeat="state in ONLINE_STATES" class="ng-scope complete active1"><span class="step ng-binding">1.待付款</span></li><!-- end ngIf: order.paycode!='CODPAY' && state!='' --><!-- end ngRepeat: state in ONLINE_STATES --><!-- ngIf: order.paycode!='CODPAY' && state!='' --><li style="width:120px;" ng-class="{complete: $index&lt;=order.state, active1: $index==order.state}" ng-if="order.paycode!=&#39;CODPAY&#39; &amp;&amp; state!=&#39;&#39;" ng-repeat="state in ONLINE_STATES" class="ng-scope"><span class="step ng-binding">2.已付款</span></li><!-- end ngIf: order.paycode!='CODPAY' && state!='' --><!-- end ngRepeat: state in ONLINE_STATES --><!-- ngIf: order.paycode!='CODPAY' && state!='' --><li style="width:120px;" ng-class="{complete: $index&lt;=order.state, active1: $index==order.state}" ng-if="order.paycode!=&#39;CODPAY&#39; &amp;&amp; state!=&#39;&#39;" ng-repeat="state in ONLINE_STATES" class="ng-scope"><span class="step ng-binding">3.已发货</span></li><!-- end ngIf: order.paycode!='CODPAY' && state!='' --><!-- end ngRepeat: state in ONLINE_STATES --><!-- ngIf: order.paycode!='CODPAY' && state!='' --><li style="width:120px;" ng-class="{complete: $index&lt;=order.state, active1: $index==order.state}" ng-if="order.paycode!=&#39;CODPAY&#39; &amp;&amp; state!=&#39;&#39;" ng-repeat="state in ONLINE_STATES" class="ng-scope"><span class="step ng-binding">4.已完成</span></li><!-- end ngIf: order.paycode!='CODPAY' && state!='' --><!-- end ngRepeat: state in ONLINE_STATES -->
														  <!-- ngRepeat: state in OFFLINE_STATES --><!-- ngIf: order.paycode=='CODPAY' && state!='' --><!-- end ngRepeat: state in OFFLINE_STATES --><!-- ngIf: order.paycode=='CODPAY' && state!='' --><!-- end ngRepeat: state in OFFLINE_STATES --><!-- ngIf: order.paycode=='CODPAY' && state!='' --><!-- end ngRepeat: state in OFFLINE_STATES --><!-- ngIf: order.paycode=='CODPAY' && state!='' --><!-- end ngRepeat: state in OFFLINE_STATES --><!-- ngIf: order.paycode=='CODPAY' && state!='' --><!-- end ngRepeat: state in OFFLINE_STATES -->
														</ul>
														<div class="pull-right">
															<div class="btn-group">
																<a class="btn btn-lg btn-info ng-hide" ng-hide="order.state!=0" ng-click="update(1, &#39;订单确认&#39;)">确认</a>
																<a class="btn btn-lg btn-primary ng-scope ng-hide" ng-hide="!((order.state==2 &amp;&amp; order.paycode!=&#39;CODPAY&#39;) || (order.state==1 &amp;&amp; order.paycode==&#39;CODPAY&#39;))" data-template="shop/order/order_delivery.html" bs-modal="">发货</a>
																<a class="btn btn-lg btn-success ng-hide" ng-hide="order.state!=3" ng-click="update(4, &#39;完成&#39;)"><i class="icon icon-save"></i>完成</a>
																<a class="btn btn-lg btn-danger" ng-hide="order.state==6 || order.state==4" ng-click="update(6, &#39;无效&#39;)"><i class="icon icon-remove"></i>无效</a>
																<a class="btn btn-lg btn-success" target="_blank" href="http://www.demlution.com/store/order/print/6757/"><i class="icon icon-print"></i>打印</a>
															</div>
														 </div>
													</div>
												</div>
												<div ng-show="order.state==6" class="ng-hide">
												  <div class="alert alert-warning">无效</div>
												  <div class="alert alert-danger ng-binding"></div>
												</div>
												<div style="margin-top:30px;display:none;">
													<div class="btn-toolbar">
														<div class="btn-group">
														  <a class="btn btn-primary ng-scope" bs-modal="" data-template="order_detail.html"><i class="icon icon-edit"></i>编辑</a>
														  <a class="btn btn-success" target="_blank" href="http://www.demlution.com/store/order/print/6757/"><i class="icon icon-print"></i>打印</a>
														</div>
														<div class="btn-group">
														  <a class="btn btn-info" ng-disabled="order.state!=0" ng-click="update(1, &#39;订单确认&#39;)" disabled="disabled">确认</a>
														  <a class="btn btn-primary ng-scope disabled" ng-class="{disabled: !((order.state==2 &amp;&amp; order.paycode!=&#39;CODPAY&#39;) || (order.state==1 &amp;&amp; order.paycode==&#39;CODPAY&#39;))}" data-template="shop/order/order_delivery.html" bs-modal="">发货</a>
														  <a class="btn btn-success disabled" ng-class="{disabled: order.state!=3}" ng-click="update(4, &#39;完成&#39;)">完成</a>
														  <a class="btn btn-danger" ng-class="{disabled: order.state==6 || order.state==4}" ng-click="update(6, &#39;无效&#39;)">无效</a>
														</div>
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
														
														<tr ng-show="order.credit_cost" class="ng-hide">
															<td><b>抵扣积分数量</b></td><td class="ng-binding"></td><td><b>抵扣积分费用</b></td><td class="ng-binding"></td>
														</tr>
														<tr ng-show="order.voucher" class="ng-hide">
															<td><b>优惠券</b></td><td class="ng-binding">0</td><td><b>优惠名称</b></td><td class="ng-binding"></td>
														</tr>
														<tr ng-show="order.province" class="ng-hide">
															<td><b>区域</b></td><td class="ng-binding"> |  |  | </td>
														</tr>
														<tr ng-show="order.extra_value" class="ng-hide">
															<td><b>附加选项</b></td><td class="ng-binding"></td>
														</tr>
														<!-- <tr>
															<td><b>买家要求送货时间</b></td><td class="ng-binding"></td><td><b>卖家发货时间</b></td><td class="ng-binding"></td>
														</tr> -->
														<tr></tr>
														<tr>
															<td><b>唯一码<b></b></b></td><td class="ng-binding">C5070408</td><td><b>来源</b></td><td class="ng-binding">PC</td>
														</tr>
														<tr>
															<td><b>用户留言</b></td><td colspan="3" class="ng-binding"></td>
														</tr>
														<!-- ngRepeat: (k,v) in order.extra2 -->
														<tr ng-repeat="(k,v) in order.extra2" class="ng-scope">
															<td><b class="ng-binding">可选区域</b></td><td class="ng-binding">杨浦区</td><td></td><td></td>
														</tr>
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
																<td><b>手机</b></td><td class="ng-binding"></td>
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
												<div class="title">物流信息</div>
											</div>
											<div class="box-content">
												<table class="table table-bordered">
													<thead>
													  <tr><th>物流公司</th><th>物流编号</th><th>发货时间</th>
													</tr></thead>
													<tbody>
													<!-- ngRepeat: delivery in order.deliveries -->
													</tbody>
												</table>
											</div>
										</div>
										<div class="box ng-scope" ng-show="order.paycode!=&#39;CODPAY&#39; &amp;&amp; order.state&gt;0">
											<div class="box-header blue-background">
												<div class="title">支付信息</div>
											</div>
											<div class="box-content">
												<table class="table table-bordered">
													<tbody>
														<tr>
															<td class="col-md-2"><b>支付宝交易号</b></td>
															<td class="col-md-4 ng-binding"></td>
															<td class="col-md-2"><b>买家支付宝帐号</b></td>
															<td class="col-md-4 ng-binding"></td>
														</tr>
														<tr>
															<td><b>买家支付宝ID</b></td>
															<td class="ng-binding"></td>
															<td><b>卖家支付宝ID</b></td>
															<td class="ng-binding"></td>
														</tr>
														<tr>
															<td><b>交易创建时间</b></td>
															<td class="ng-binding"></td>
															<td><b>交易付款时间</b></td>
															<td class="ng-binding"></td>
														</tr>
														<tr ng-show="order.bank_seq_no" class="ng-hide">
															<td><b>网银流水号</b></td>
															<td class="ng-binding"></td>
															<td><b>支付渠道组合信息</b></td>
															<td class="ng-binding"></td>
														</tr>
														<tr ng-show="order.out_channel_amount" class="ng-hide">
															<td><b>支付金额组合信息</b></td>
															<td class="ng-binding"></td><td><b>实际支付渠道</b></td>
															<td class="ng-binding"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="box ng-scope" ng-show="order.company.use_receipt">
											<div class="box-header blue-background">
												<div class="title">发票信息</div>
											</div>
											<div class="box-content">
												<table class="table table-bordered">
													<thead>
														<tr>
															<td class="col-md-2">发票抬头</td>
															<td class="ng-binding"></td>
															<td></td>
															<td></td>
														</tr>
													</thead>
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