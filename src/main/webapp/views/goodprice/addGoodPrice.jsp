<%@ page language="java" import="java.util.*,com.keji50.zhucexiaadmin.dao.po.SysUserPo" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/views/include/base.jsp"%>
<% SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo"); 
	System.out.println(sysUser.toString());%>
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
		<script type="text/javascript">
			function aa(){
				$("#addPrice").form('submit',{
					url:'${root}/goodprice/upLoadPrice',
					onSubmit:function(){
						validates ();
						return $(this).form('enableValidation').form('validate');
					},
					success:function(data){
						var data=eval("("+data+")");
						/*判断是否成功插入数据到数据库*/
						if(data==0){	
							$("#addWin").window('close');
							alert("添加成功！")
						}
						else if(data==1){
							alert("添加失败！")
						}else{
							alert("该价格已存在！")
						}
					}
				});
			}
			
			function validates () {
				$("input[name='price']").validatebox({    
					required: true,    
					validType: "integer",
					invalidMessage:'请输入整数！',
					missingMessage:'不能为空！'
				});
				$("input[name='goodAttr']").validatebox({
					required: false,
					validType: "goodAttr",
					invalidMessage: "请按照格式输入！"
				});
				var good_id = $("#combobox").val();
				alert(good_id);
			}
			
			$.extend($.fn.validatebox.defaults.rules, {
				goodAttr: {
					validator: function (value, param) {
						return /^([\u4e00-\u9fa5]+：[\u4e00-\u9fa5|\w]+；)+$/.test(value);
					},
					message: '请按照格式输入！'
				},
			});

		
		</script>
		 <form method="post" id="addPrice" >
			<table style="width: 100%;height: 40%;" class="CContent">
					<tbody>
						<tr>
					    	<td style="width:15%;heigh:30%;">选择商品:</td>
					    	<td style="">
					    		<input id="combobox" class="easyui-combobox" name="goodId" style="width:100px;" 
					    				data-options="editable:true,valueField:'good_id',textField:'name',data:${json}"/>
					    	    <!-- <input type="text" name="good_type_name" id="good_type_name"> -->
					    	</td>
					    </tr>
					    <tr>
					    	<td style="width:15%;heigh:40%;">商品详情:</td>
					    	<td>
					    		<input id="good_attr" name="goodAttr" type="text"/>
					    		<span>格式:属性1-属性值;属性2-属性值;</span>
							</td>
					    </tr>
					    <tr>
					    	<td style="width:15%;">添加价格:</td>
					    	<td><input id="price" name="price" type="text"/><span> 元</span></td>
					    </tr>
					    <tr style="visibility:hidden">
					    	<td>创建人</td>
					    	<td><input name="createBy" value="<%=sysUser.getUsername() %>"/></td>
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
</body>
		
</html>