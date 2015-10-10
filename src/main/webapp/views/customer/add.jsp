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
							<td><label>用户名:</label></td>
							<td><input type="text" name="username" ></input></td>
							<td><label>绑定手机号:</label></td>
							<td>
								<input  type="text" name="phoneNumber" />
							</td>
							
						</tr>
						<tr>
							<td><label>绑定邮箱号:</label></td>
							<td><input type="text" name="email"></td>
							<td><label>密码:</label></td>
							<td><input id="password" type="text" name="password"/></td>
						</tr>
						<tr>
							<!-- <td><label>创建时间:</label></td>
							<td><input id="createTime" type="text" name="createTime"/></td> -->
							<td><label>创建人:</label></td>
							<td><input id="createBy" type="text" name="createBy"/></td>
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
		loginName: {
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
	    mobile: {// 验证手机号码
	        validator: function (value) {
	        	
	            return /^(13|15|18)\d{9}$/i.test(value);
	        },
	        message: '手机号码格式不正确'
	    },
	   
	})
	function validate() {
		$("input[name='username']").validatebox({    
			required: true,    
			validType: 'loginName',
			invalidMessage:'英文字母、数字及下划线。',
			missingMessage:'用户名不能为空！'
		});
		$("input[name='password']").validatebox({    
			required: true,    
			validType: 'password',
			invalidMessage:'密码由字母和数字组成，至少6位',
			missingMessage:'密码不能为空！'
		});
		$("input[name='phoneNumber']").validatebox({    
			required: true,    
			validType: "mobile",
			invalidMessage:'请输入正确的手机号！',
			missingMessage:'手机不能为空！'
		});
		$("input[name='email']").validatebox({    
			required: true,    
			validType: "email",
			invalidMessage:'请输入正确的邮箱号！',
			missingMessage:'手机不能为空！'
		});
		$("input[name='createBy']").validatebox({    
			required: true,    
			validType: 'createBy',
			invalidMessage:'英文字母、数字及下划线。',
			missingMessage:'创建人不能为空！'
		});
    //设置text需要验证
   
	}
</script>
		<script type="text/javascript">
			function aa(){
				
				   $.messager.confirm("操作提示", "您确定要执行新增吗？", function (data) {  
			            if (data) {  
			            	
			            	$('#yourformid').form('submit', {    
			    			    url:"${root }/customer/newcus",  
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