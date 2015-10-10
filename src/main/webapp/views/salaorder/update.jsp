<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/views/include/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${root }/static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${root }/static/js/jquery-ui.js"></script>
<link href="${root }/static/css/bigpage.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/easyui.css" rel="stylesheet"/>
<title>update title here</title>
</head>
<body>
<div class="CContent">
		<div id="title" class="tablestyle_title">
			<label>订单状态修改</label>
		</div>
		<form method="post" id="updateform">
			<table style="width: 100%;height:auto" class="CContent">
					<tbody>
						<%-- <tr>
							<td><label>用户名:</label></td>
							<td><input  type="text" name="username" value="${customer.username }"/></td>
							<td><label>绑定手机号:</label></td>
							<td>
								<input type="text" name="phoneNumber" value="${customer.phoneNumber }"/>
							</td>
							
						</tr>
						<tr>
							<td><label>绑定邮箱号:</label></td>
							<td><input type="text" name="email" value="${customer.email}"/></td>
							<td><label>密码:</label></td>
							<td><input  type="text" name="password" value="${customer.password }"/></td>
						</tr> --%>
						<tr>
							<!-- <td><label>创建时间:</label></td>
							<td><input id="createTime" type="text" name="createTime"/></td> -->
						 <td style="display:none;"><input type="hidden" name="id" value="${order.id }"/></td>
							<td><label>订单当前状态:</label></td>
							<td><input type="text" class="easyui-textbox" readonly="readonly" value="${order.orderstate }"/>
							
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label>订单修改状态:</label></td>
							<td>
							<select id="orderstate"  name="orderstate" class="easyui-combobox"  style="width:140px">
										<option value="0" selected="selected">未确认</option>
										<option value="1">已确认</option>
										<option value="2">交易成功</option>
										<option value="9">交易取消</option>
								</select>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" align="center"><input 
								type="button" class="right-button08" onclick="updateone()"  style="margin-left: 20px"
								value="修 改"></input></td>
						</tr>
					</tfoot>
				</table>
		</form>
		<script type="text/javascript">
			function updateone(){
				 $.messager.confirm("操作提示", "您确定要执行修改吗？", function (data) {  
			            if (data) {  
			            	$("#updateform").form("submit", {    
			    			    url:"${root }/salaorder/updateorder",  
			    			    onSubmit: function(){    
			    			        // do some check    
			    			        // return false to prevent submit;    
			    			    },    
			    			    success:function(data){    
			    			    	var obj = jQuery.parseJSON(data);
			    			    	/* alert(obj); */
			    					if(obj=="修改成功"){
			    						 queryDg();
			    						 $("#editWin").window("close");
			    						 $.messager.alert("操作提示", obj,"info");
			    					}
			    			    } ,
			    			    error:function(data){
			    			    	var obj = jQuery.parseJSON(data);
			    			    	//alert(obj);
			    					if(obj=="修改失败"){
			    						$.messager.alert("操作提示", obj,"error");
			    						 //queryDg();
			    						 $("#editWin").window("close");
			    					}
			    			    }
			    			});  

			            }  
			           
			        });  	
			}
		</script>
		</div>
</body>

</html>