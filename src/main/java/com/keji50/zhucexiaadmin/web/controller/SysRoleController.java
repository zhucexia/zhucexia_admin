package com.keji50.zhucexiaadmin.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.SimpleFormatter;

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
		return "role/addRole";
	}
	@RequestMapping(value="/addRoles",method = RequestMethod.POST)
	@ResponseBody
	public int addPro(SysRolePo sysRolePo,HttpServletRequest request){
		/*调用service层方法*/
		Boolean result = sysRoleService.checkRole(sysRolePo);
		int i = 0;
		if(result){
			/*把负责添加人的id值放入到sysRolePo中去*/
			SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo");
			String user_name = sysUser.getUsername();
			sysRolePo.setCreateBy(user_name);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			sysRolePo.setCreateTime(time);
			/*返回是否插入数据的标示值*/
			int flag=sysRoleService.insertRole(sysRolePo);
			/*声明json数据类型变量，返回到前台*/
			if(flag>0){
				i=0;
			}
			else{
				i=1;
			}
		}else{
			i=2;
		}
		return i;
	}
	
	
	/*角色修改*/
	@RequestMapping("/toEditRole")
	public String toEditRole(String id,HttpServletRequest request){
		int ids=Integer.parseInt(id);
		SysRolePo sysRolePo=sysRoleService.getRoleById(ids);
		request.setAttribute("sysRolePo", sysRolePo);
		return "role/updateRole";
	}
	@RequestMapping(value="/editRole" ,method = RequestMethod.POST)
	@ResponseBody
	public int editRole(SysRolePo sysRolePo,HttpServletRequest request){
		Boolean result = sysRoleService.checkRole(sysRolePo);
		int i;
		if(result){
			/*把负责修改人的id值放入到sysRolePo中去*/
			SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo");
			String user_name = sysUser.getUsername();
			sysRolePo.setUpdateBy(user_name);
			long l = System.currentTimeMillis();
			Timestamp time = new Timestamp(l);
			sysRolePo.setUpdateTime(time);
			/*返回是否修改成功*/
			int flag=sysRoleService.updateRole(sysRolePo);
			/*声明json数据类型变量，返回到前台*/
			if(flag>0){
				i=0;
			}else{
				i=1;
			}
		}else{
			i=2;
		}
		return i;
	}
	
	
	/*删除角色信息,物理上不删除，逻辑上删除*/
	@RequestMapping("/delRole")
	@ResponseBody
	public JSONObject delRole(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		int flag=sysRoleService.deleteRole(id);
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
    
	@RequestMapping("/toSetRolePower")
	@ResponseBody
	public String setRolePower(String id,HttpServletRequest request){
		int ids=Integer.parseInt(request.getParameter("id"));
		return null;
	}
}
