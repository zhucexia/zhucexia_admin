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
<%-- <script type="text/javascript"
	src="${root }/static/tinymce/tinymce.min.js"></script>  --%> 
 <script type="text/javascript"
	src="${root }/static/ckeditor/ckeditor.js"></script>
</head>
<body id="depositBody" class="ContentBody">
	<div class="CContent">
		<div id="title" class="tablestyle_title">
			<label>商品价格查询</label>
		</div>
		<div class="CPanel">
			<fieldset>
				<legend>查询条件</legend>
				<table style="width: 100%;" class="CContent">
					<tbody>
						<tr>
							<td><label>商品名称:</label></td>
							<td><input id="good_name" type="test "/></td>
						</tr>
						<tr>
							<td><label>商品属性:</label></td>
							<td><input id="good_attr" type="text" /></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" align="center"><input id="queryBtn"
								type="button" class="right-button08" style="margin-left: 20px"
								value="查询"></input> <input id="clearBtn" type="button"
								class="right-button08" style="margin-left: 20px" value="清除"></input></td>
						</tr>
					</tfoot>
				</table>
			</fieldset>
			<div class="queryDataGrid">
				<div style="width: 1300px;" id="dg"></div>
			</div>
			<input id="changeSuccess" value="false" type="hidden" name="flags"/>
		</div>
		<div id="addWin"></div>
		<div id="editWin"></div>
		<div id="manageWin"></div>		
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
					goodName : $("#good_name").val(),
					goodAttr : $("#good_attr").val(),
					
					pageNum : pageObj.varPageNum,
					pageSize : pageObj.varPageSize
				};
				loadDg('${root}/goodprice/getGoodPriceList', params);
			};

			addWhite = function() {
				$("#changeSuccess").val("false");
				$("#addWin").window({
					title : '添加价格',
					width : 800,
					height : 600,
					method : 'post',
					cache : false,
					modal : true,
					//closeAnimation : 'fade',
					closable : true,
					maximizable : false,
					minimizable : false,
					href : "${root}/goodprice/toAddGoodPrice",
					onClose: function() {	
								queryDg();
					
					}
				});
			};

			editWhite = function() {
				var checkedItems = $('#dg').datagrid('getChecked');
				var id = '';
				if (!checkedItems || checkedItems.length == 0) {
					alert("未选中任何值,请选择需要修改的白名单客户");
					return;
				} else {
					$.each(checkedItems, function(index, item) {
						id = item.id;
					});
				}
				$("#changeSuccess").val("false");
				$("#editWin").window({
					title : '修改价格',
					width : 820,
					height : 300,
					method : 'post',
					closeAnimation : 'fade',
					cache : false,
					//closable : false,
					maximizable : false,
					minimizable : false,
					href : "${root}/goodprice/toUpdatePrice?id=" + id,
					onClose : function() {
						if ($("#changeSuccess").val() == "success") {
							queryDg();
						}
					}
				});

			};
			deleteWhite = function() {
				var id = '';
				var checkedItems = $('#dg').datagrid('getChecked');
				if (!checkedItems || checkedItems.length == 0) {
					alert("未选中任何值,请选择需要删除的白名单客户");
					return;
				} else {
					$.each(checkedItems, function(index, item) {
						id = item.id;
					});
				}
				$.ajax({
					url : "${root}/goodprice/delete",
					type : 'POST',
					data : {
						"id" : id
					},
					success : function(msg){
						if(msg){
							queryDg()
						}else{
							alert("删除失败！");
						}
					}
				});

			};
			

			var toolbar = [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : addWhite
			}, {
				text : '修改',
				iconCls : 'icon-edit',
				handler : editWhite
			}, '-', {
				text : '删除',
				iconCls : 'icon-delete',
				handler : deleteWhite
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
								username : '没有查到数据',
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
					}, {
						field : 'id',
						title : '编号',
						hidden : true
					},{
						field : 'good_id',
						title : '商品编号',
						hidden : true
					},{
						sortable : true,
						field : 'name',
						title : '商品 名称',
						width : min2MidWith,
						align : 'center'
					},{
						sortable : true,
						field : 'good_attr',
						title : '商品属性',
						width : min2MidWith,
						align : 'center'
					},{
						field : 'price',
						title : '商品价格',
						width : min2MidWith
					},{
						field : 'create_by',
						title : '创建人',
						width : min2MidWith,
						align : 'center'
					},{
						field : 'create_time',
						title : '创建时间',
						width : min2MidWith,
						align : 'center',
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
							return year + "/" + month + "/" + day + " " + hour + ":" + minutes + ":" + seconds;
							}
						
					},{
						field : 'update_by',
						title : '修改人',
						width : min2MidWith,
						align : 'center'
					},{
						field : 'update_time',
						title : '修改时间',
						width : min2MidWith,
						align : 'center',
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
							return year + "/" + month + "/" + day + " " + hour + ":" + minutes + ":" + seconds;
							}
						
						
					}]]
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

			//加载空查询结果数据
			refreshDg();
		});
	</script>
	 
	
</body>
</html>
