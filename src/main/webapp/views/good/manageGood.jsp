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
	<form method="post" id ="manageGoodForm">
	    <input type="hidden" id="id" value="${good_id}" name="good_id"/>
	    <input type="hidden" id="selectedGood" name="selectedGood"/>
	    <input type="hidden" id="unSelected" name="unSelected">
	   <input type="hidden" id="selectedName" name="selectedName"/>
	    <input type="hidden" id="unSelectedName" name="unSelectedName">
		<table  align="center" width="50%" height="50%">	
			 <tr align="center">
			 	<td >
			 		<font size="3" >可选产品</font>
			 	</td>
			 <!-- 	<td>
			 		<font size="3">必选</font>
			 	</td> -->
			</tr>
		     <tr>
		    	<td>
		    	<%-- <input  name="role_id" class="easyui-tree" value="${sysUserPo.role_id}" data-options="data:[{text:'item'}],checkbox:'true'" />  --%>
		    	<ul id="tt" class="easyui-tree"   data-options="data:${json},checkbox:true"></ul>
		    	</td>
		    </tr>
		    <tr>
		    	<td><input type="button" value="保存"  id="sub" onclick="submits()"></td>
		    	<td><input type="button" value="取消" id="cancels" onclick="cancels()"></td>
		    </tr>	    		    		   		    
		</table>
	</form>
	
	<script type="text/javascript">
	function cancels () {
		if(confirm("确定离开本页面！")){
			$("#manageWin").window('close');
		}
	}
	function submits(){
			//获取被选中的tree节点
			var nodes=$('#tt').tree('getChecked');	// get checked nodes
			//获取未被选中的节点
            var unnodes=$('#tt').tree('getChecked','unchecked');	// get checked nodes
            var stId="";
            var stName=""
            /*拼接选中id字符串*/
            $.each(nodes,function (name,value){
            	stId+=value.id+",";
            	stName+=value.text+","
            });
            /*拼接未选中id字符串*/
            var strId=""
            var strName="";
            $.each(unnodes,function (name,value){
            	//分割字符获取id和name
            	strId+=value.id+",";
            	strName=value.text+",";
            });
            $("#selectedGood").attr("value",stId);
            $("#selectedName").attr("value",stName);
            $("#unSelected").attr("value",strId);
            $("#unSelectedName").attr("value",strName);
			//ajax 动态提交表单数据			
			$("#manageGoodForm").form('submit',{
				url :"${root}/goodRelation/manageGood", 
				onSubmit:function(param){
					//alert($(this).form('enableValidation').form('validate'));
					//return $(this).form('enableValidation').form('validate');	
				},
				success:function(data){
					var data=eval("("+data+")");
					/*判断是否成功插入数据到数据库*/
					if(data.message){	
						$("#manageWin").window('close');		
					}
					else{
						
						
					}
				}	
			})
		}
	</script>	   
	
</body>
</html>