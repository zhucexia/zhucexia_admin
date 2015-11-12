<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include/base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
   
<%--     <script type="text/javascript"
	src="${root }/static/js/jquery-1.7.2.min.js"></script>  --%>
	  <script type="text/javascript" src="${root }/static/js/customer.js">
	  </script>
	<form method="post" id ="addProForm"  enctype="multipart/form-data">
		<input type="hidden" name="id" value="${goodPo.id}">
		<table border="1" cellspacing="0" bordercolor="green" align="center">
			<tr>
				<td>商品编号</td>
				<td><input type="text"  name="code" value="${goodPo.code}"></td>
			</tr>
		    <tr>
		    	<td>商品名称</td>
		    	<td><input type="text" name="name" id="name" value="${goodPo.name}"></td>
		    </tr>
		    <tr>
		    	<td>商品类型</td>
		    	<td>
		    		<input  name="good_type_name" name="good_type_name" class="easyui-combobox" data-options="editable:false,valueField:'values',textField:'fields',data:${jsons}" />
		    	    <!-- <input type="text" name="good_type_name" id="good_type_name"> -->
		    	</td>
		    </tr>
		    <tr>
		    	<td>价格范围</td>
		    	<td>
		    		<input type="text" name="price_range" value="${goodPo.price_range}"/>
		    	</td>
		    </tr>
		    <tr>
		    	<td>市场价</td>
		    	<td>
		    		<input type="text" name="price_market" value="${goodPo.price_market }"/>
		    	</td>
		    </tr>
		    <tr>
		    	<td>封面图片</td>
		    	<td>
		    		<div id="preview"></div>
		    		<input type="file" name="pic" value="${goodPo.pic}" onclick="previewImage(this)"/>
		    	</td>
		    </tr>
		    <tr>
		    	<td>注册时长</td>
		    	<td>
		    		<input type="text" name="register_cost" value="${goodPo.register_cost}"/>
		    	</td>
		    </tr>
		    <tr>
		    	<td>申请条件</td>
		    	<td>
		    		<textarea rows="3" cols="20" name="apply_condition" >${goodPo.apply_condition}</textarea>
		    	</td>
		    </tr>
		    <tr>
		    	<td>商品介绍</td>
		    	<td>
		    	
		    		<textarea rows="5" cols="30" name="detail_content" id="detail_content">
		    			${goodPo.detail_content}
		    		</textarea>
		    		<!-- <script type="text/javascript">
                             CKEDITOR.replace("editor01");
                    </script> -->
                    <script>
        				CKEDITOR.replace("detail_content",{filebrowserUploadUrl : "${root}/admin/upload?Type=File",  
						filebrowserImageUploadUrl : '${root}/admin/upload?Type=Image',  
						filebrowserFlashUploadUrl : '${root}/admin/upload?Type=Flash',
					    filebrowserImageBrowseUrl:"${root}/browerServer/fil?Type=Image&fo=resour",
					    filebrowserFlashBrowseUrl:"${root}/browerServer/fil?Type=Flash",
					    filebrowserBrowseUrl:"${root}/browerServer/fil?Type=File",
					    
        				});  
					</script> 
		    	</td>
		    </tr>		    		    		    		    		   
		    <tr>
		    	<td>上架时间</td>
		    	<td>
		    		<input type="text"  class="easyui-datebox" name="begin_sale_time" id="begin_sale_time" value="${goodPo.begin_sale_time}"><!-- data-options="formatter:function(){	    		
				return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();}" > -->
		    	</td>
		    </tr>
            <tr>
		    	<td>下架时间</td>
		    	<td>
		    		<input type="text" class="easyui-datebox"  name="end_sale_time" id="end_sale_time" value="${goodPo.end_sale_time }">
		    	</td>
		    </tr>
		    <tr>
		    	<td>首页显示</td>
		    	<td>
		    		<input  name="index_show" name="index_show" class="easyui-combobox" data-options="valueField:'value',textField:'fields',data:[{value:'1',fields:'是'<c:if test="${goodPo.index_show==1}">,selected:true</c:if>},{value:'0',fields:'否'<c:if test="${goodPo.index_show==0}">,selected:true</c:if>}]"  value="${goodPo.index_show}"/>
		    		<!-- <input type="text"  name="index_show" id="index_show" > -->
		    	</td>
		    </tr>
		    <tr>
		    	<td> 商品备注</td>
		    	<td>
		    		<input type="text"  name="remark" id="remark" value="${goodPo.remark}">
		    	</td>
		    </tr>
		    
		    <tr>
		    	<td>商品排序</td>
		    	<td>
		    		<input type="text"  name="sort" id="sort" value="${goodPo.sort}">
		    	</td>
		    </tr>
		    <tr>
		    	<td><input type="button" value="保存"  id="sub" onclick="submits()"></td>
		    	<td><input type="button" value="取消"></td>
		    </tr>	    		    		   		    
		</table>
		<input type="hidden" value="${goodPo.id }" name="goodId">
	</form>
	<script type="text/javascript" src="${root }/static/js/validate.js"></script>
	<script type="text/javascript">
	function uploadImage(){
		location.href="${root}//admin/upload";
	}
	 /*  $(function() {
		  var options={
			formatter: function(date){
				return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
			},
			parser: function(date){ 
				return new Date(Date.parse(date.replace(/-/g,"/")));
			}
				
		}; 
		$("#begin_sale_time").datebox(options); 
		
	 }); */
	function validates () {
		$("input[name='sort']").validatebox({    
			required: true,    
			validType: "integer",
			invalidMessage:'请输入整数！',
			missingMessage:'不能为空！'
		});
		/*  $("input[name='begin_sale_time']").validatebox({    
			required: true,    
			validType: "date",
			invalidMessage:'请输入正确的日期！',
			missingMessage:'日期不能为空！'
		});
		$("input[name='end_sale_time']").validatebox({    
			required: true,    
			validType: "date",
			invalidMessage:'请输入正确的日期！',
			missingMessage:'日期不能为空！'
		}); */
		$("input[name='price_market']").validatebox({    
			required: true,    
			validType: "intOrFloat",
			invalidMessage:'请输入数字！',
			missingMessage:'价格不能为空！'
		}); 
		
		$("input[name='price_range']").validatebox({    
			required: true,    
			validType: "unnormal",
			invalidMessage:'请输入合法的值！',
			missingMessage:'不能为空！'
			
		});
		$("input[name='register_cost']").validatebox({    
			required: true,    
			validType: "unnormal",
			invalidMessage:'请输入合法的值！',
			missingMessage:'不能为空！'
			
		});
		$("input[name='name']").validatebox({    
			required: true,    
			validType: "unnormal",
			invalidMessage:'请输入合法的值！',
			missingMessage:'不能为空！'
		});
		$("input[name='code']").validatebox({    
			required: true,    
			validType: "unnormal",
			invalidMessage:'请输入合法的值！',
			missingMessage:'不能为空！'
		});
    //设置text需要验证
	}
	function submits(){
			//ajax 动态提交表单数据			
			$("#addProForm").form('submit',{
				url :"${root}/good/updateGood",
				dataType:'json',
				onSubmit:function(){
					alert($(this).form('enableValidation').form('validate'));
					validates();
					return $(this).form('enableValidation').form('validate');			
				},
				success:function(data){
					var datas=eval("("+data+")");
					/*判断是否成功插入数据到数据库*/
					if(datas.message){	
						$("#changeSuccess").val("success");
						$("#editWin").window('close');		
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