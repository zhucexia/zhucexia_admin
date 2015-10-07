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
	<form method="post" id ="addProForm">
		<table border="1" cellspacing="0" bordercolor="green" align="center">
			<tr>
				<td>产品名</td>
				<td><input type="text" class="easyui-textbox" name="product_name" data-options="required:true"></td>
			</tr>
		    <tr>
		    
		    
		    	<td>产品价格</td>
		    	<td><input type="text" name="product_price" id="product_price"></td>
		    </tr>
		    <tr>
		    	<td>产品描述</td>
		    	<td>
		    		<textarea rows="20" cols="50" name="product_description"></textarea>
		    	</td>
		    </tr>
		    <tr>
		    	<td>产品图片</td>
		    	<td>
		    		<input type="file" name="product_image"/>
		    	</td>
		    </tr>
		    <tr>
		    	<td>上架/下架</td>
		    	<td>
		    		<select name="product_grounding">
		    			<option value="0" selected="selected">下架</option>
		    			<option value="1">上架</option>
		    		</select>
		    	</td>
		    </tr>
		    <tr>
		    	<td>创建人</td>
		    	<td>
		    		<input type="text"  name="createBy" id="createBy" >
		    	</td>
		    </tr>
		    <tr>
		    	<td><input type="button" value="保存"  id="sub" onclick="submits()"></td>
		    	<td><input type="button" value="取消"></td>
		    </tr>	    		    		   		    
		</table>
	</form>
	
	<script type="text/javascript">
	function submits(){
			//ajax 动态提交表单数据			
			$("#addProForm").form('submit',{
				url :"${root}/product/addPros", 
				onSubmit:function(){
					$("#product_price").numberbox({
						required:true,
						precision:2,
						min:0
					   
					});
					$("#bb").textbox({
						required:true
					});
					alert($(this).form('enableValidation').form('validate'));
					return $(this).form('enableValidation').form('validate');
					
				},
				success:function(data){
					var data=eval("("+data+")");
					/*判断是否成功插入数据到数据库*/
					alert(data.message);
					if(data.message){	
						$("#addWin").window('close');		
					}
					else{}
				}	
			})
		}
		function submits1(){
			alert("aaaaaaaaaaaaaaaaa");		
		}
	</script>	   
</body>
</html>