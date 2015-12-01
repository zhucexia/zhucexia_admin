package com.keji50.zhucexiaadmin.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.keji50.zhucexiaadmin.dao.po.SysRolePowerPo;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.service.SysRolePowerService;

@Controller
@RequestMapping("/sysRolePower")
public class SysRolePowerController {
	
	@Resource(name="SysRolePowerService")
	private SysRolePowerService sysRolePowerService;
	
	/*给登录用户分配权限菜单*/
	@RequestMapping("/getRolePower")
	@ResponseBody
	public JSON getRolePower(HttpServletRequest request){
		SysUserPo sysUserPo = (SysUserPo) request.getSession().getAttribute("sysUserpo");
		List<SysRolePowerPo> list=sysRolePowerService.getRolePower(sysUserPo.getRole_id());
		String str = "[";
		if(list.size()>0){
			for(SysRolePowerPo sysRole:list){
				str+="{\"id\":\""+sysRole.getId()+"\",\"text\":"
						+ "\""+sysRole.getSysPowerPo().getName()+"\","
								+ "\"attributes\":{\"url\":\""+request.getContextPath()+"/"+sysRole.getSysPowerPo().getHref()+"\"},"
								+ "\"iconCls\":\"icon-save\"},";	
			}
			str=str.substring(0,str.length()-1);
			str+="]";
			//json=JSONObject.parseObject(str);
		}
		else{
			
		}
		JSON json = JSON.parseArray(str);
		return json;
	}
	@RequestMapping("/aa")
	public String aa(){
		return "admin/login";
	}
	
	
	/*给角色分配权限*/
	@RequestMapping("/toDistriPower")
	public String toDistriPower(HttpServletRequest request){
		/*从页面获取到角色的id值，通过角色的id值获取该角色对应 的所有的权限*/
		String role_id=request.getParameter("id");
		List<HashMap<String,Object>> list=sysRolePowerService.getPowers(role_id);
		String str="[";
		/*获取所有权限的枚举值*/
		for(HashMap<String,Object> map :list){
			/*判断该角色有没有当前的权限*/
			if(map.get("power_id")!=null){
				str+="{'id':'"+map.get("id")+"','text':'"+map.get("name")+"',"
						+ "'checked':true},";
			}
			else{
				str+="{'id':'"+map.get("id")+"','text':'"+map.get("name")+"'},";
			}
		}
		str=str.substring(0,str.length()-1)+"]";
		request.setAttribute("json", str);
		request.setAttribute("role_id", role_id);
		return "admin/distributionPower";
	}
	
	/*重新选择权限，进行分配*/
	@RequestMapping("/distriPower")
	@ResponseBody
	public JSONObject distriPower(String role_id,String selectedPower,String unselected,HttpServletRequest request){
		/*获取目前角色有那些权限*/
		SysRolePowerPo sysRolePowerPo = new SysRolePowerPo();
		selectedPower =selectedPower.substring(0,selectedPower.length()-1);
		String [] powerIds = selectedPower.split(",");
		for(int i=0;i<powerIds.length;i++){
			sysRolePowerPo.setPower_id(powerIds[i]);
			sysRolePowerPo.setRole_id(role_id);
			if(sysRolePowerService.checkRolePower(sysRolePowerPo)){
				sysRolePowerService.insertRolePower(sysRolePowerPo);
			}
		}
		unselected = unselected.substring(0, unselected.length()-1);
		String [] unselectedIds = unselected.split(",");
		for(int i=0;i<unselectedIds.length;i++){
			sysRolePowerPo.setPower_id(unselectedIds[i]);
			sysRolePowerPo.setRole_id(role_id);
			if(!sysRolePowerService.checkRolePower(sysRolePowerPo)){
				sysRolePowerService.deleteRolePower(sysRolePowerPo);
			}
		}
		String str = "{'msg':'true'}";
		JSONObject json = JSONObject.parseObject(str);
		return json;
	}
}
