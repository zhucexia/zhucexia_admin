<%@ page language="java" import="java.util.*,com.keji50.zhucexiaadmin.dao.po.SysUserPo" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/views/include/base.jsp"%>
<% SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${root }/static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${root }/static/js/jquery-ui.js"></script> 
<title>Insert title here</title>
<link href="${root }/static/css/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/easyui.css" rel="stylesheet"/>
</head>
<body>
		

		 <form method="post" id="yourformid" >
			<table style="width: 100%;height:auto" class="CContent">
					<tbody>
						<tr>
							<td><label>支付名称:</label></td>
							<td><input type="text" name="name" ></input></td>
							<td><label>支付代码:</label></td>
							<td>
								<input  type="text" name="code" />
							</td>
							
						</tr>
						<tr>
							<td><label>优惠费率:</label></td>
							<td><input type="text" name="payment_fee"></td>
							<td><label>备注:</label></td>
							<td><input id="remark" type="text" name="remark"/></td>
						</tr>
						<tr>
							 <!-- <td><label>创建时间:</label></td>
							<td><input id="createTime" type="text" name="createTime"/></td> 
							 <td><label>状态:</label></td>
							<td>
								<select id="state"  name="state" class="text" style="width:150px">
										<option value="s" selected="selected">审核</option>
										 <option value="c">草稿</option>
										<option value="d">删除</option> 
								</select>
							</td> -->
							<td><label>创建人:</label></td>
							<td><input id="createBy" type="text" name="createBy" value="<%=sysUser.getUsername() %>"/></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" align="center"><input 
								type="button" class="right-button08" onclick="aa()" style="margin-left: 20px"
								value="新 增"></input></td>
						</tr>
					</tfoot>
				</table>
		</form> 
		<script type="text/javascript">
	
	$.extend($.fn.validatebox.defaults.rules, {
		code: {
			validator: function (value, param) {
				return /^[\w]+$/.test(value);
			},
			message: '英文字母、数字及下划线。'
		},
		createBy: {
			validator: function (value, param) {
				return /^[\w]+$/.test(value);
			},
			message: '英文字母、数字及下划线。'
		},
	    sort: {// 验证序号
	        validator: function (value) {
	        	 
	            return /^([0-9])+\d*$/i.test(value);
	        },
	        message: '序号格式不正确'
	    },
	})
	function validate() {
		$("input[name='code']").validatebox({    
			required: true,    
			validType: 'code',
			invalidMessage:'英文字母、数字及下划线。',
			missingMessage:'条件代码不能为空！'
		});
		
		$("input[name='name']").validatebox({    
			missingMessage:'序号不能为空！'
		});
		
		$("input[name='createBy']").validatebox({    
			required: true,    
			validType: 'createBy',
			invalidMessage:'英文字母、数字及下划线。',
			missingMessage:'创建人不能为空！'
		});
   
	}
</script>
		<script type="text/javascript">
			function aa(){
				
				   $.messager.confirm("操作提示", "您确定要执行新增吗？", function (data) {  
			            if (data) {  
			            	
			            	$('#yourformid').form('submit', {    
			    			    url:"${root }/payment/addpayment",  
			    			    onSubmit: function(){
			    			    	validate();
			    			    	return $(this).form('validate');
			    			    },    
			    			    success:function(data){ 
			    			    	var obj = jQuery.parseJSON(data);
			    					if(obj=="新增成功"){
			    						queryDg();
			    						$("#addWin").window("close");
			    						$.messager.alert("操作提示", obj,"info");
			    						 
			    					}
			    			       
			    			    }    
			    			});  
			            }  
			           
			        });  	
			

			}
		</script>
</body>
</html>