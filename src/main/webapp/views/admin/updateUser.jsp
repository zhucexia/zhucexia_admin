<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include/base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" id ="updateUserForm">
	    <input type="hidden" name="id" value="${sysUserPo.id}"/>
		<table border="1" cellspacing="0" bordercolor="green" align="center">	
			<tr>
				<td>用户名</td>
				<td><input type="text"  name="username" id="username" value="${sysUserPo.username}"></td>
			</tr>
		     <tr>
		    	<td>真实姓名</td>
		    	<td><input type="text" name="realname" id="realname" value="${sysUserPo.realname}"></td>
		    </tr>
		     <tr>
		    	<td>角色</td>
		    	<td><input  name="role_id" class="easyui-combobox" value="${sysUserPo.role_id}" data-options="editable:false,valueField:'values',textField:'fields',data:${jsons}" /> </td>
		    </tr>
		     <tr>
		    	<td>手机号</td>
		    	<td><input type="text" name="mobile" id="mobile" value="${sysUserPo.mobile}"></td>
		    </tr>
		     <tr>
		    	<td>邮件</td>
		    	<td><input type="text" name="email" id="email" value="${sysUserPo.email}"></td>
		    </tr>
		     <tr>
		    	<td>公司名称</td>
		    	<td><input type="text" name="company" id="company" value="${sysUserPo.company}"></td>
		    </tr>
		     <tr>
		    	<td>地址</td>
		    	<td><input type="text" name="address" id="address" value="${sysUserPo.address}"></td>
		    </tr>
		     <tr>
		    	<td>部门名称</td>
		    	<td><input type="text" name="dept_name" id="dept_name" value="${sysUserPo.dept_name}"></td>
		    </tr>
		    <tr>
		    	<td><input type="button" value="保存"  id="sub" onclick="submits()"></td>
		    	<td><input type="button" value="取消"></td>
		    </tr>	    		    		   		    
		</table>
	</form>
	<script type="text/javascript" src="${root }/static/js/validate.js"></script>
	<script type="text/javascript">
	function validates () {
		$("input[name='username']").validatebox({    
			required: true,    
			validType: 'loginName',
			invalidMessage:'英文字母、数字及下划线。',
			missingMessage:'用户名不能为空！'
		});
		$("input[name='realname']").validatebox({    
			required: true,    
			validType: 'chinese',
			invalidMessage:'请输入汉字！',
			missingMessage:'真实姓名不能为空！'
		});
		$("input[name='mobile']").validatebox({    
			required: true,    
			validType: "mobile",
			invalidMessage:'请输入正确的手机号！',
			missingMessage:'手机不能为空！'
		});
		$("input[name='email']").validatebox({    
			required: true,    
			validType: "email",
			invalidMessage:'请输入正确的邮箱号！',
			missingMessage:'邮箱地址不能为空！'
		});
		$("input[name='dept_name']").validatebox({    
			required: true,    
			validType: "unnormal",
			invalidMessage:'请输入合法的值！',
			missingMessage:'不能为空！'
			
		});
		$("input[name='company']").validatebox({    
			required: true,    
			validType: "unnormal",
			invalidMessage:'请输入合法的值！',
			missingMessage:'不能为空！'
		});
		$("input[name='address']").validatebox({    
			required: true,    
			validType: "unnormal",
			invalidMessage:'请输入合法的值！',
			missingMessage:'不能为空！'
		});
    //设置text需要验证
	}
	function submits(){
			//ajax 动态提交表单数据			
			$("#updateUserForm").form('submit',{
				url :"${root}/sysUser/updateUser", 
				onSubmit:function(){	
					validates();
					//alert($(this).form('enableValidation').form('validate'));
					return $(this).form('enableValidation').form('validate');	
				},
				success:function(data){
					var data=eval("("+data+")");
					/*判断是否成功插入数据到数据库*/
					alert(data.message);
					if(data.message){	
						$("#changeSuccess").val() == "success"
						$("#editWin").window('close');		
					}
					else{}
				}	
			})
		}
	</script>	   
</body>
</html>