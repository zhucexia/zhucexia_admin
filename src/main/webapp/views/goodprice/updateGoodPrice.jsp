<%@ page language="java" import="java.util.*,com.keji50.zhucexiaadmin.dao.po.SysUserPo" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include/base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %> 
<% SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
   
  <%--   <script type="text/javascript"
	src="${root }/static/js/jquery-1.7.2.min.js"></script>  --%> 

	  
	<form method="post" id ="updatePrice"  enctype="multipart/form-data">
		<input type="hidden" name="id" value="${json.id}">
		<input type="hidden" name="good_id" value="${json.good_id}">
		<table border="1" cellspacing="0" bordercolor="green" align="center">
		    <tr>
		    	<td>商品名称</td>
		    	<td><input type="text" name="name" id="name" readonly="true" value="${json.name}"></td>
		    </tr>
		    <tr>
		    	<td>商品属性</td>
		    	<td>
		    		<input name="good_attr" readonly="true" type="text" value="${json.good_attr}"/>
		    	</td>
		    </tr>
		    <tr>
		    	<td>商品价格</td>
		    	<td>
		    		<input type="text" name="price" value="${json.price}"/>
		    	</td>
		    </tr>
		    <tr style="visibility:hidden">
		    	<td>修改人</td>
		    	<td><input name="updateBy" value="<%=sysUser.getUsername() %>"/></td>
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
		$("input[name='price']").validatebox({    
			required: true,    
			validType: "integer",
			invalidMessage:'请输入整数！',
			missingMessage:'不能为空！'
		});
		
    //设置text需要验证
	}
	function submits(){
			//ajax 动态提交表单数据			
			$("#updatePrice").form('submit',{
				url :"${root}/goodprice/updatePrice", 
				onSubmit:function(){
					alert($(this).form('enableValidation').form('validate'));
					validates();
					return $(this).form('enableValidation').form('validate');			
				},
				success:function(data){
					var obj = jQuery.parseJSON(data);
					/*判断是否成功插入数据到数据库*/
					if(obj.msg){	
						$("#editWin").window('close');
						alert("修改成功！");
					}
					else{
						alert("修改失败！");
					}
				}	
			})
		}
	</script>
</body>
</html>