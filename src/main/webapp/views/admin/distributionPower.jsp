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
	<form method="post" id ="distributePowerForm">
	    <input type="hidden" id="id" value="${role_id}" name="role_id"/>
	    <input type="hidden" id="selectedPower" name="selectedPower"/>
	    <input type="hidden" id="unSelected" name="unselected">
		<table  align="center">	
		     <tr>
		    	<td>
		    	<%-- <input  name="role_id" class="easyui-tree" value="${sysUserPo.role_id}" data-options="data:[{text:'item'}],checkbox:'true'" />  --%>
		    	<ul id="tt" class="easyui-tree"   data-options="data:${json},checkbox:true"></ul>
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
			//获取被选中的tree节点
			var nodes=$('#tt').tree('getChecked');	// get checked nodes
			//获取未被选中的节点
            var unnodes=$('#tt').tree('getChecked','unchecked');	// get checked nodes
            var str="";
            $.each(nodes,function (name,value){
            	str+=value.id+",";
            });
            $("#selectedPower").attr("value",str);
            var str2="";
            $.each(unnodes,function(name,value){
            	str2+=value.id+",";
            });
            $("#unSelected").attr("value",str2);
            //$("#unselected").attr("value",);
			//ajax 动态提交表单数据			
			$("#distributePowerForm").form('submit',{
				url :"${root}/sysRolePower/distriPower", 
				success:function(data){
					/*判断是否成功插入数据到数据库*/
					data=eval('('+data+')');
					alert(data.msg);
						$("#changeSuccess").val="success";
						$("#distriWin").window('close');						
				}	
			});
		}
	</script>	   
</body>
</html>