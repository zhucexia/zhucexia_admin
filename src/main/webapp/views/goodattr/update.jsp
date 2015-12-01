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
<title>update title here</title>
<link href="${root }/static/css/bigpage.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<link href="${root }/static/css/easyui.css" rel="stylesheet"/>
</head>
<body>
		 <form method="post" id="updateform" >

		 	<input type="hidden" name="id" value="${goodAttr.id }"/>
			<table style="width: 100%;height:auto" class="CContent">
					<tbody>
						<tr>
							<td><label>条件名称:</label></td>
							<td><input type="text" name="names" value="${goodAttr.names }"></input></td>
							<td><label>条件代码:</label></td>
							<td>
								<input  type="text" name="code" value="${goodAttr.code }"/>
							</td>
							
						</tr>
						<tr>
							<td><label>序号:</label></td>
							<td><input type="text" name="sort" value="${goodAttr.sort }"></td>
							<td><label>备注:</label></td>
							<td><input id="remark" type="text" name="remark" value="${goodAttr.remark }"/></td>
						</tr>
						<tr style="display:none;">
							<td><label>商品id:</label></td>
							<td><input id="good_id" type="text" name="goodId" value="${goodAttr.goodId }"/></td>							
						</tr>
						<%-- <tr>
							<td><label>可选值:</label></td>
							<td><input type="text" name="optionvalue" value="${goodAttr.optionvalue }"></td>
							<td style="display:none;"><input id="updateBy" type="text" name="updateBy" value="<%=sysUser.getUsername() %>"/></td>
						</tr> --%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" align="center"><input 
								type="button" class="right-button08" onclick="updateone()" style="margin-left: 20px"
								value="修  改"></input></td>
						</tr>
					</tfoot>
				</table>
		</form> 
		
<script type="text/javascript">
			function updateone(){
				 $.messager.confirm("操作提示", "您确定要执行修改吗？", function (data) {  
			            if (data) {  
			            	$("#updateform").form("submit", {    
			    			    url:"${root }/goodattr/updategoodattr",  
			    			    onSubmit: function(){    
			    			        // do some check    
			    			        // return false to prevent submit;  
			    			        validate();
			    			    	return $(this).form('validate');
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
		$("input[name='code']").validatebox({    
			required: true,    
			validType: 'code',
			invalidMessage:'英文字母、数字及下划线。',
			missingMessage:'条件代码不能为空！'
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
		$("input[name='name']").validatebox({    
			required: true,    
			//validType: "email",
			//invalidMessage:'请输入正确的邮箱号！',
			missingMessage:'条件名称不能为空！'
		});
		$("input[name='good_id']").validatebox({    
			required: true,    
			//validType: "email",
			//invalidMessage:'请输入正确的邮箱号！',
			missingMessage:'商品不能为空！'
		});
		
    //设置text需要验证
   
	}
</script>
</body>

</html>
