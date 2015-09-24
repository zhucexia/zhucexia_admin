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
			<label>客户查询</label>
		</div>
		<div class="CPanel">
			<fieldset>
				<legend>查询条件</legend>
				<table style="width: 100%;" class="CContent">
					<tbody>
						<tr>
							<td><label>绑定手机号:</label></td>
							<td>
								<select id="isPinlessMobile"  name="isPinlessMobile" class="text" class="text" style="width:150px">
										<option value="0" selected="selected">已绑定</option>
										<option value="1">未绑定</option>
								</select>
							</td>
							<td><label>用户名:</label></td>
							<td><input id="username" type="text" /></td>
						</tr>
						<tr>
							<td><label>手机号:</label></td>
							<td><input id="phoneNumber" type="text" /></td>
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
			<input id="changeSuccess" value="false" type="hidden" />
		</div>
		<div id="addWin"></div>
		<div id="editWin"></div>
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
					isPinlessMobile : $("#isPinlessMobile").val(),
					username : $("#username").val(),
					phoneNumber : $("#phoneNumber").val(),
					pageNum : pageObj.varPageNum,
					pageSize : pageObj.varPageSize
				};
				loadDg('${root}/customer/getCustomerList', params);
			};

			addWhite = function() {
				$("#changeSuccess").val("false");
				$("#addWin").window({
					width : 800,
					height : 300,
					method : 'post',
					cache : false,
					modal : false,
					closeAnimation : 'fade',
					//closable : false,
					maximizable : false,
					minimizable : false,
					href : "${root}/whiteList/addAcWhitleList",
					onClose : function() {
						if ($("#changeSuccess").val() == "success") {
							queryDg();
						}
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
						id = item.sno;
					});
				}
				$("#changeSuccess").val("false");
				$("#editWin").window({
					width : 800,
					height : 300,
					method : 'post',
					closeAnimation : 'fade',
					cache : false,
					//closable : false,
					maximizable : false,
					minimizable : false,
					href : "${root}/whiteList/updateAcWhitleList?sno=" + id,
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
						id = item.sno;
					});
				}
				$.ajax({
					url : "${root}/whiteList/deleteWhitle",
					type : 'POST',
					data : {
						"sno" : id
					},
					success : queryDg
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
						field : 'sno',
						title : '编号',
						hidden : true
					},{
						sortable : true,
						field : 'username',
						title : '用户名',
						width : min2MidWith,
						align : 'center'
					}, {
						field : 'phoneNumber',
						title : '手机号',
						width : min2MidWith
					}, {
						field : 'email',
						title : '邮箱',
						width : middleWidth
					}, {
						field : 'createBy',
						title : '创建人',
						width : min2MidWith
					}, {
						sortable : true,
						field : 'createTime',
						title : '创建日期',
						width : min2MidWith
					}, {
						field : 'updateBy',
						title : '更新人',
						width : min2MidWith
					}, {
						field : 'updateTime',
						title : '更新日期',
						width : min2MidWith
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

			//加载空查询结果数据
			refreshDg();
		});
	</script>
</body>
</html>
