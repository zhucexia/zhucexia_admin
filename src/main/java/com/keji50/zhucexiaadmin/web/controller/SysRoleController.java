package com.keji50.zhucexiaadmin.web.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.SysRolePo;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.service.SysRoleService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

@Controller
@RequestMapping("/sysRole")
public class SysRoleController {
	@Resource(name="sysRoleService")
	private SysRoleService sysRoleService;
	
	@RequestMapping("/getRoles")
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request,HttpServletResponse response) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<SysRolePo> page =  sysRoleService.getRoleByConditions(conditions);
		return PageUtils.pageToMap(page);	
	}
	/*列表页面*/
	@RequestMapping("/listRole")
	public String toList(){
		return "role/listRole";
	}
	
	
	/*角色添加*/
	@RequestMapping("/toAddRole")
	public String toAddRole(){
		System.out.println("进入了toAddRole方法里面！");
		return "role/addRole";
	}
	@RequestMapping(value="/addRoles",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject  addPro(SysRolePo sysRolePo,HttpServletRequest request){
		/*调用service层方法*/
		System.out.println(sysRolePo.toString()) ;
		/*把负责添加人的id值放入到sysRolePo中去*/
		SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo");
		String user_id = Integer.toString(sysUser.getId());
		sysRolePo.setCreateBy(user_id);
		/*返回是否插入数据的标示值*/
		int flag=sysRoleService.insertRole(sysRolePo);
		/*声明json数据类型变量，返回到前台*/
		JSONObject json;
		if(flag>0){
		json= JSONObject.parseObject("{'message':'true'}");
		}
		else{
		json=JSONObject.parseObject("{'message':'false'}");
		}
		return  json;
	}
	
	
	/*角色修改*/
	@RequestMapping("/toEditRole")
	public String toEditRole(String id,HttpServletRequest request){
		int ids=Integer.parseInt(id);
		SysRolePo sysRolePo=sysRoleService.getRoleById(ids);
		System.out.println("进入了sysRoleController方法--toEditRole--"+sysRolePo.toString());
		request.setAttribute("sysRolePo", sysRolePo);
		return "role/updateRole";
	}
	@RequestMapping(value="/editRole" ,method = RequestMethod.POST)
	@ResponseBody
	public JSONObject editRole(SysRolePo sysRolePo,HttpServletRequest request){
		/*把负责修改人的id值放入到sysRolePo中去*/
		SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo");
		String user_id = Integer.toString(sysUser.getId());
		sysRolePo.setUpdateBy(user_id);
		/*返回是否修改成功*/
		int flag=sysRoleService.updateRole(sysRolePo);
		/*声明json数据类型变量，返回到前台*/
		JSONObject json;
		if(flag>0){
		json= JSONObject.parseObject("{'message':'true'}");
		}
		else{
		json=JSONObject.parseObject("{'message':'false'}");
		}
		return  json;
	}
	
	
	/*删除角色信息,物理上不删除，逻辑上删除*/
	@RequestMapping("/delRole")
	@ResponseBody
	public JSONObject delRole(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println("当前被删除的值得id是："+id);
		int flag=sysRoleService.deleteRole(id);
		System.out.println("执行了sysRoleController的deleteRole方法---"+flag);
		/*声明json数据类型变量，返回到前台*/
		JSONObject json;
		if(flag>0){
		json= JSONObject.parseObject("{'message':'删除成功'}");
		}
		else{
		json=JSONObject.parseObject("{'message':'删除失败'}");
		}
		return  json;
	}
    
}
