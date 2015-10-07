package com.keji50.zhucexiaadmin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admins")
public class AdminController {
	/*后台欢迎界面*/
	@RequestMapping("/welcome")
	public String welcome(){
		
		return "admin/index";
	}
}
