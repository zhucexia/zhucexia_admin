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
	<form method="post" id ="editRoleForm">
	<input type="hidden" value="${sysRolePo.id}" name="id"/>
		<table border="1" cellspacing="0" bordercolor="green" align="center">
			<tr>
				<td>角色编号</td>
				<td><input type="text" class="easyui-textbox" name="code" id="role_code" value="${sysRolePo.code}"></td>
			</tr>
		    <tr>
		    	<td>角色名称</td>
		    	<td><input type="text" name="name" id="role_name" value="${sysRolePo.name}"></td>
		    </tr>
		    <tr>
		    	<td><input type="button" value="保存"  id="sub" onclick="submits()"></td>
		    	<td><input type="button" value="取消" onclick="closes()"></td>
		    </tr>	    		    		   		    
		</table>
	</form>
	
	<script type="text/javascript">
	function submits(){
			//ajax 动态提交表单数据			
			$("#editRoleForm").form('submit',{
				url :"${root}/sysRole/editRole", 
				onSubmit:function(){
					$("#role_code").textbox({
						required:true,
					   
					});
					$("#role_name").textbox({
						required:true
					});
					//alert($(this).form('enableValidation').form('validate'));
					return $(this).form('enableValidation').form('validate');
					
				},
				success:function(data){
					/*判断是否成功插入数据到数据库*/
					if(data==0){	
						$("#editWin").window('close');
						alert("修改成功！");
						$("#changeSuccess").val("success");
					}else if(data==1){
						alert("出现异常，请联系系统管理员！");
					}else{
						alert("修改失败，该角色已存在！");
					}
				}	
			})
		}
	function closes(){
		$("#editWin").window('close');
	}
	</script>	   
</body>
</html>