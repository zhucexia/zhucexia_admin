package com.keji50.zhucexiaadmin.web.controller;

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
		System.out.println("role_id值为--"+sysUserPo.getRole_id());
		List<SysRolePowerPo> list=sysRolePowerService.getRolePower(sysUserPo.getRole_id());
		System.out.println(list.size()+"------");
		String str = "[";
		if(list.size()>0){
			for(SysRolePowerPo sysRole:list){
				System.out.println(sysRole.getSysPowerPo().toString());
				str+="{\"id\":\""+sysRole.getId()+"\",\"text\":"
						+ "\""+sysRole.getSysPowerPo().getName()+"\","
								+ "\"attributes\":{\"url\":\""+request.getContextPath()+"/"+sysRole.getSysPowerPo().getHref()+"\"},"
								+ "\"iconCls\":\"icon-save\"},";	
			}
			str=str.substring(0,str.length()-1);
			str+="]";
			System.out.println(str);
			//json=JSONObject.parseObject(str);
		}
		else{
			
		}
		System.out.println("进入了rolepowercontroller里面的getRolePower方法----"+list.size());
		JSON json = JSON.parseArray(str);
		System.out.println(json.toString());
		return json;
	}
	@RequestMapping("/aa")
	public String aa(){
		return "admin/login";
	}

}
