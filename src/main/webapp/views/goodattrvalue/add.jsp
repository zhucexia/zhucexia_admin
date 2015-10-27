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
							<td><label>商品id:</label></td>
<<<<<<< HEAD
							<td><input type="text" name="goodid" ></input></td>
							<td><label>商品可选条件id:</label></td>
							<td>
								<input  type="text" name="goodattrid" />
							</td>
							
						</tr>
						<tr>
							<td><label>可选条件值:</label></td>
							<td><input type="text" name="attrvalue"></td>
							<td><label>序号:</label></td>
							<td><input type="text" name="sort"/></td>
						</tr>
						<tr>
							<!-- <td><label>创建时间:</label></td>
							<td><input id="createTime" type="text" name="createTime"/></td> -->
							<%-- <td><label>商品名称(开发填为id):</label></td>
							<td><input  name="good_id" class="easyui-combobox" data-options="editable:false,valueField:'values',textField:'fields',data:${jsons}" /> </td>
							<td><input id="good_id" type="text" name="goodid"/></td> --%>
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
		password: {
			 validator: function(value, param)
	            {
	                return /^(?=.*\d.*)(?=.*[a-zA-Z].*).{6,50}$/
	                        .test(value);
	            },
	            message: "密码不合法（至少6位，必须有字母和数字）"
		},
	    idcard: {// 验证身份证
	        validator: function (value) {
	            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
	    },
	        message: '身份证号码格式不正确'
	    },
	    minLength: {
	        validator: function (value, param) {
	            return value.length >= param[0];
	        },
	        message: '请输入至少（2）个字符.'
	    },
	    length: { validator: function (value, param) {
	        var len = $.trim(value).length;
	        return len >= param[0] && len <= param[1];
	    },
	        message: "输入内容长度必须介于{0}和{1}之间."
	    },
	    phone: {// 验证电话号码
	        validator: function (value) {
	            return /^((\d2,3)|(\d{3}\-))?(0\d2,3|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
	        },
	        message: '格式不正确,请使用下面格式:020-88888888'
	    },
	    sort: {// 验证序号
	        validator: function (value) {
	        	 
	            return /^([0-9])+\d*$/i.test(value);
	        },
	        message: '序号格式不正确'
	    },
	})
	function validate() {
		$("input[name='goodid']").validatebox({    
			required: true,    
			validType: 'sort',
			invalidMessage:'请输入数字',
			missingMessage:'商品id不能为空！'
		});
		
		$("input[name='sort']").validatebox({    
			required: true,    
			validType: 'sort',
			invalidMessage:'请输入数字序号！',
			missingMessage:'序号不能为空！'
		});
		
		$("input[name='createBy']").validatebox({    
			required: true,    
			validType: 'createBy',
			invalidMessage:'英文字母、数字及下划线。',
			missingMessage:'创建人不能为空！'
		});
		$("input[name='goodattrid']").validatebox({    
			required: true,    
			validType: 'sort',
			invalidMessage:'请输入数字',
			missingMessage:'商品属性id不能为空！'
		});
		$("input[name='attrvalue']").validatebox({    
			required: true,    
			//validType: "email",
			//invalidMessage:'请输入正确的邮箱号！',
			missingMessage:'属性值不能为空！'
		});
		
    //设置text需要验证
   
	}
</script>
		<script type="text/javascript">
			function aa(){
				
				   $.messager.confirm("操作提示", "您确定要执行新增吗？", function (data) {  
			            if (data) {  
			            	
			            	$('#yourformid').form('submit', {    
			    			    url:"${root }/goodattrvalue/addgoodattrvalue",  
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
			    			       
=======
							<td><input name="goodid" ></input></td>
							<td><label>商品可选条件id:</label></td>
							<td>
								<input  type="text" name="goodattrid" />
							</td>
							
						</tr>
						<tr>
							<td><label>可选条件值:</label></td>
							<td><input type="text" name="attrvalue"></td>
							<td><label>序号:</label></td>
							<td><input type="text" name="sort"/></td>
						</tr>
						<tr style="display:none;">
							<!-- <td><label>创建时间:</label></td>
							<td><input id="createTime" type="text" name="createTime"/></td> -->
							<%-- <td><label>商品名称(开发填为id):</label></td>
							<td><input  name="good_id" class="easyui-combobox" data-options="editable:false,valueField:'values',textField:'fields',data:${jsons}" /> </td>
							<td><input id="good_id" type="text" name="goodid"/></td> --%>
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
		password: {
			 validator: function(value, param)
	            {
	                return /^(?=.*\d.*)(?=.*[a-zA-Z].*).{6,50}$/
	                        .test(value);
	            },
	            message: "密码不合法（至少6位，必须有字母和数字）"
		},
	    idcard: {// 验证身份证
	        validator: function (value) {
	            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
	    },
	        message: '身份证号码格式不正确'
	    },
	    minLength: {
	        validator: function (value, param) {
	            return value.length >= param[0];
	        },
	        message: '请输入至少（2）个字符.'
	    },
	    length: { validator: function (value, param) {
	        var len = $.trim(value).length;
	        return len >= param[0] && len <= param[1];
	    },
	        message: "输入内容长度必须介于{0}和{1}之间."
	    },
	    phone: {// 验证电话号码
	        validator: function (value) {
	            return /^((\d2,3)|(\d{3}\-))?(0\d2,3|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
	        },
	        message: '格式不正确,请使用下面格式:020-88888888'
	    },
	    sort: {// 验证序号
	        validator: function (value) {
	        	 
	            return /^([0-9])+\d*$/i.test(value);
	        },
	        message: '序号格式不正确'
	    },
	})
	function validate() {
		$("input[name='goodid']").validatebox({    
			required: true,    
			validType: 'sort',
			invalidMessage:'请输入数字',
			missingMessage:'商品id不能为空！'
		});
		
		$("input[name='sort']").validatebox({    
			required: true,    
			validType: 'sort',
			invalidMessage:'请输入数字序号！',
			missingMessage:'序号不能为空！'
		});
		
		$("input[name='createBy']").validatebox({    
			required: true,    
			validType: 'createBy',
			invalidMessage:'英文字母、数字及下划线。',
			missingMessage:'创建人不能为空！'
		});
		$("input[name='goodattrid']").validatebox({    
			required: true,    
			validType: 'sort',
			invalidMessage:'请输入数字',
			missingMessage:'商品属性id不能为空！'
		});
		$("input[name='attrvalue']").validatebox({    
			required: true,    
			//validType: "email",
			//invalidMessage:'请输入正确的邮箱号！',
			missingMessage:'属性值不能为空！'
		});
		
    //设置text需要验证
   
	}
</script>
		<script type="text/javascript">
			function aa(){
				
				   $.messager.confirm("操作提示", "您确定要执行新增吗？", function (data) {  
			            if (data) {  
			            	
			            	$('#yourformid').form('submit', {    
			    			    url:"${root }/goodattrvalue/addgoodattrvalue",  
			    			    onSubmit: function(){
			    			    	validate();
			    			    	return $(this).form('validate');
			    			    },    
			    			    success:function(data){ 
			    					if(data==0){
			    						queryDg();
			    						$("#addWin").window("close");
										alert("添加成功！");			    						 
			    					}else if(data==1){
			    						alert("发现异常，请联系系统管理员");
			    					}else
			    						alert("该属性已存在！");
>>>>>>> refs/remotes/origin/master
			    			    }    
			    			});  
			            }  
			           
			        });  	
			

			}
		</script>
</body>
</html>
