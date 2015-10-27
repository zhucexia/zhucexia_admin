<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/views/include/base.jsp"%>
<%@ include file="/views/include/meta.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/tld/JSTLFunction.tld" prefix="dic"%>
<%@ include file="/views/include/dataDic.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="htmlOverFlowHidden" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>客户查询</title>
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
<body id="depositBody" class="ContentBody">
	<div class="CContent">
		<div id="title" class="tablestyle_title">
			<label>订单查询</label>
		</div>
		<div class="CPanel">
			<fieldset>
				<legend>查询条件</legend>
				<table style="width: 100%;" class="CContent">
					<tbody>
						<tr>
							<td><label>订单状态:</label></td>
							<td>
								<select id="orderstate"  name="orderstate" class="text" style="width:150px">
										<option value="0" selected="selected">未确认</option>
										<option value="1">已确认</option>
										<option value="2">交易成功</option>
										<option value="9">交易取消</option>
								</select>
							</td>
							<td><label>订单号:</label></td>
							<td><input id="id" type="text" name="id"/></td>
						</tr>
						<tr>
							<td><label>手机号:</label></td>
							<td><input id="mobile" type="text" name="mobile"/></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" align="center"><input id="queryBtn"
								type="button" class="right-button08" style="margin-left: 20px"
								value="查询"></input> <input id="clearBtn" type="button"
								class="right-button08" style="margin-left: 20px" value="清除"></input>
							</td>
						</tr>
					</tfoot>
				</table>
			</fieldset>
			<div class="queryDataGrid">
				<div style="width: 1300px;" id="dg"></div>
			</div>
			<input id="changeSuccess" value="false" type="hidden" />
			<input id="selectSuccess" value="false" type="hidden" />
		</div>
		<!-- <div id="addWin"></div> -->
		<div id="editWin"></div>
	</div>
	<div id="detailWin">
	<div style="width:998px;" id="detail" ></div>
	</div>
	<script language="javascript">
		$(function() {
			$("#queryBtn").click(function() {
				pageObj.varPageNum = 1;
				queryDg();
			});
			
			$("#clearBtn").click(function() {
				$("input[type!=button]").val("");
			});
			var pageObj = new Object();
			pageObj.varPageNum = 1;
			pageObj.varPageSize = 50;

			//查询执行
			queryDg = function() {
				var params = {
					orderstate : $("#orderstate").val(),
					id : $("#id").val(),
					mobile : $("#mobile").val(),
					pageNum : pageObj.varPageNum,
					pageSize : pageObj.varPageSize
				};
				loadDg('${root}/salaorder/getorderList', params);
			};

			editWhite = function() {
				var checkedItems = $('#dg').datagrid('getChecked');
				var id = '';
				if (!checkedItems || checkedItems.length == 0) {
					$.messager.alert("温馨提示", "未选中,请选择需要修改的白名单客户", "info");
					return;
				} else {
					$.each(checkedItems, function(index, item) {
						id = item.id;
					});
				}
				$("#changeSuccess").val("false");
				$("#editWin").window({
					title:'编  辑',
					width : 800,
					height : 200,
					method : 'post',
					//closeAnimation : 'fade',
					cache : false,
					//closable : false,
					maximizable : false,
					minimizable : false,
					href : "${root}/salaorder/getorder?id="+id,
					/* onClose : function() {
						//if ($("#changeSuccess").val() == "success") {
							queryDg();
						//}
					} */
				});

			};
			deleteWhite = function() {
				var id = '';
				var checkedItems = $('#dg').datagrid('getChecked');
				if (!checkedItems || checkedItems.length == 0) {
					$.messager.alert("温馨提示", "未选中,请选择需要删除的白名单客户", "info");
					return;
				} else {
					// $.messager.defaults = { ok: "是", cancel: "否" };  
					   
				        $.messager.confirm("操作提示", "您确定要执行删除吗？", function (data) {  
				            if (data) {  
				            	$.each(checkedItems, function(index, item) {
									id = item.id;
									
								});
								$.ajax({
									url : "${root}/salaorder/deletesalaorder",
									type : 'POST',
									data : {
										"sno" : id
									},
									success : function(data) {
										$.messager.alert("温馨提示",data.message , "info");
										queryDg();
									}
								});
				            }  
				           
				        });  
					
				}
				

			};
			
			detailWhite = function(){
				var checkedItems = $('#dg').datagrid('getChecked');
				var id = '';
				if (!checkedItems || checkedItems.length == 0) {
					$.messager.alert("温馨提示", "未选中,请选择需要修改的白名单客户", "info");
					return;
				} else {
					$.each(checkedItems, function(index, item) {
						id = item.id;
					});
					if(('#detailWin').panel==null){
						
					$('#detailWin').panel({
						title:'订单详情',
						width : 1000,
						height : 180,
						closable : true,
						cache : false
						/* tools : [{
							text : '关闭',
							iconCls : 'icon-close',
							handler : function(){
								$('#detailWin').panel('close');
							}
						}] */
					}); 
					}
				}
				$.ajax({
					url:"${root}/saleorderdetail/getorderdetail",
					type:'POST',
					data:{"id":id},
					dataType:"json",
					success:function(map){
						$('#detail').datagrid({
							data:[{
								order_id : map.order_id,
								good_id : map.good_id,
								good_name : map.good_name,
								good_price_id : map.good_price_id,
								good_price : map.good_price,
								good_num : map.good_num,
								total_price : map.total_price
							}]
						});
					}
				});
				var middleWidth = "180px";
				var min2MidWith = "120px";
				var minWidth = "100px";
				$("#detail").datagrid({
 						/* data : loadData, */	
						rownumbers : true,
						fit : true,
						pagination : true,
						singleSelect : true,
						pageList : [ 50, 20 ],
						pageNumber : pageObj.varPageNum,
						pageSize : pageObj.varPageSize,
						onLoadSuccess : function(data) {
							if (data.total > 0) {
								return;
							}
								$('#detail').datagrid('insertRow', {
									row : {
										id : '没有查到数据',
									}
								});
						},
						autoRowHeight : false,//取消自动行高
						remoteSort : false,
						multiSort : true,
						cache : false,
						columns : [ [ 
						{
							field : 'sno',
							title : '编号',
							hidden : true
						},
						{
							//sortable : true,
							field : 'order_id',
							title : '订单编号',
							width : min2MidWith,
							align : 'center'
						},{
							
							field : 'good_id',
							title : '商品编号',
							width : min2MidWith,
							align : 'center'
						}, {
							field : 'good_name',
							title : '商品名称',
							width : min2MidWith
						}, {
							field : 'good_price_id',
							title : '商品价格编号',
							width : min2MidWith
						}, {
							field : 'good_price',
							title : '商品价格',
							width : min2MidWith
						}, {
							/* sortable : true, */
							field : 'good_num',
							title : '商品数量',
							width : min2MidWith
						}, {
							field : 'total_price',
							title : '订单总价',
							width : min2MidWith
						} ] ]
					});
				/* $('#detail').datagrid('load',{'order_id':'id','address':'${root}/saleorderdetail/getorderdetail'});
				$('#detail').datagrid('reload'); */
			};
			//销毁订单详情面板
			/* $('#detailWin').panel({
				onClose : function(){
					$('#detailWin').panel('destroy',true);
					alert("面板关闭");
				}
			}); */

			var toolbar = [ {
				text : '修改',
				iconCls : 'icon-edit',
				handler : editWhite
			}, '-', {
				text : '删除',
				iconCls : 'icon-delete',
				handler : deleteWhite
			}  ,'-',{
				text : '查看详情',
				iconCls : 'icon-detail',
				handler : detailWhite
			} ];

			//刷新datafrid
			function refreshDg(loadData) {
				var cols = 10;
				var middleWidth = "180px";
				var min2MidWith = "120px";
				var minWidth = "100px";
				$("#dg").datagrid({
					data : loadData,
					rownumbers : 'true',
					pagination : true,
					singleSelect : true,
					pageList : [ 50, 20 ],
					pageNumber : pageObj.varPageNum,
					pageSize : pageObj.varPageSize,
					toolbar : toolbar,
					onLoadSuccess : function(data) {
						if (data.total > 0) {
							return;
						}
							$('#dg').datagrid('insertRow', {
								row : {
									id : '没有查到数据',
								}
							});
						
						/* $('#dg').datagrid('mergeCells', {
							index : 0,
							field : 'username',
							colspan : cols,
							type : 'body'
						}); */
					},
					autoRowHeight : false,//取消自动行高
					remoteSort : false,
					multiSort : true,
					columns : [ [ 
					   {
						field : 'ck',
						checkbox : 'true'
					},
					{
						field : 'sno',
						title : '编号',
						hidden : true
					},
					{
						//sortable : true,
						field : 'id',
						title : '订单编号',
						width : min2MidWith,
						align : 'center'
					},{
						
						field : 'customername',
						title : '客户名称',
						width : min2MidWith,
						align : 'center'
					}, {
						field : 'mobile',
						title : '手机号',
						width : min2MidWith
					}, {
						field : 'email',
						title : '邮箱',
						width : middleWidth
					}, {
						field : 'orderstate',
						title : '订单状态',
						width : min2MidWith
					}, {
						sortable : true,
						field : 'ordermoney',
						title : '金额',
						width : min2MidWith
					}, {
						field : 'updateBy',
						title : '更新人',
						width : min2MidWith
					}, {
						field : 'updateTime',
						title : '更新日期',
						width : min2MidWith,
						formatter: function (value, row, index) {
							var date = new Date(value);
							var year = date.getFullYear().toString();
							var month = (date.getMonth() + 1);
							var day = date.getDate().toString();
							var hour = date.getHours().toString();
							var minutes = date.getMinutes().toString();
							var seconds = date.getSeconds().toString();
							if (month < 10) {
								month = "0" + month;
							}
							if (day < 10) {
								day = "0" + day;
							}
							if (hour < 10) {
								 hour = "0" + hour;
							}
							if (minutes < 10) {
								minutes = "0" + minutes;
							}
							if (seconds < 10) {
								seconds = "0" + seconds;
							 }
							return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
							}
					} ] ]
				});

				//设置分页控件
				setDgPagination();
			}

			//设置分页控件
			function setDgPagination() {
				var p = $('#dg').datagrid('getPager');
				dgPagination(p, pageObj, queryDg);
			}

			//加载查询结果
			function loadDg(postUrl, params) {
				ajaxLoadDg(postUrl, params, refreshDg, $("#dg"));
			}
			/* function loadDetail(postUrl,params) */
			//加载空查询结果数据
			refreshDg();
			
		});
	</script>
</body>
</html>
