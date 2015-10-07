package com.keji50.zhucexiaadmin.web.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.service.SysUserService;
import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

/*系统用户*/
@Controller
@RequestMapping("/sysUser")
public class SysUserController {
	@Resource(name="SysUserService")
	private SysUserService sysUserService;
	
	/*系统用户登录*/
	@RequestMapping("/login")
	public String login(SysUserPo sysuser,HttpServletRequest request){
		System.out.println("进入了sysuserController的方法--login");
		/*判断用户是否存在*/
		SysUserPo sysUserPo=sysUserService.login(sysuser);
		request.getSession().setAttribute("sysUserpo", sysUserPo);
		if(sysUserPo!=null){
			
			return "admin/index";
		}
		else{
			return "admin/login";
		}
	}
	/*进入用户登录页面*/
	@RequestMapping("/toLogin")
	public String tologin(){
		return "admin/login";
	}

}
