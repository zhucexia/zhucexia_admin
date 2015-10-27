package com.keji50.zhucexiaadmin.web.controller;

import java.util.ArrayList;
import java.util.List;
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
import com.keji50.zhucexiaadmin.dao.po.SysRolePowerPo;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.service.SysRolePowerService;
import com.keji50.zhucexiaadmin.service.SysRoleService;
import com.keji50.zhucexiaadmin.service.SysUserService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;


/*系统用户*/
@Controller
@RequestMapping("/sysUser")
public class SysUserController {
	
	@Resource(name="SysUserService")
	private SysUserService sysUserService;
	@Resource(name="sysRoleService")
    private SysRoleService sysRoleService;
	@Resource(name="SysRolePowerService")
	private SysRolePowerService sysRolePowerService;

	/*系统用户登录*/
	@RequestMapping("/login")
	public String login(SysUserPo sysuser,HttpServletRequest request){
		System.out.println("进入了sysuserController的方法--login");
		/*判断用户是否存在*/
		SysUserPo sysUserPo=sysUserService.login(sysuser);
		request.getSession().setAttribute("sysUserpo", sysUserPo);
		
		if(sysUserPo!=null){
			List<SysRolePowerPo> srp=sysRolePowerService.getRolePower(sysUserPo.getRole_id());
			List<SysRolePowerPo> srp1=new ArrayList<SysRolePowerPo>();
			List<SysRolePowerPo> srp2=new ArrayList<SysRolePowerPo>();
			List<SysRolePowerPo> srp3=new ArrayList<SysRolePowerPo>();
			List<SysRolePowerPo> srp4=new ArrayList<SysRolePowerPo>();
			for (SysRolePowerPo sysRolePowerPo : srp) {
				if(sysRolePowerPo.getSysPowerPo().getTreeType()==1){
					srp1.add(sysRolePowerPo);
				}else if(sysRolePowerPo.getSysPowerPo().getTreeType()==2){
					srp2.add(sysRolePowerPo);
				}else if(sysRolePowerPo.getSysPowerPo().getTreeType()==3){
					srp3.add(sysRolePowerPo);
				}else if(sysRolePowerPo.getSysPowerPo().getTreeType()==4){
					srp4.add(sysRolePowerPo);
				}
			}
			System.out.println("总共条数"+srp.size());
			System.out.println("------------**********"+srp);
			request.setAttribute("srp1",srp1);System.out.println("srp1:size"+srp1.size());
			request.setAttribute("srp2",srp2);System.out.println("srp2:size"+srp2.size());
			request.setAttribute("srp3",srp3);System.out.println("srp3:size"+srp3.size());
			request.setAttribute("srp4",srp4);System.out.println("srp4:size"+srp4.size());
			return "admin/index";
		}
		else{
			request.setAttribute("ts", "提示: 输入用户或密码错误！！！");
			
			return "admin/login";
		}
	}
	/*进入用户登录页面*/
	@RequestMapping("/toLogin")
	public String tologin(HttpServletRequest request){
		if(request.getSession().getAttribute("sysUserpo")!=null){
			request.getSession().removeAttribute("sysUserpo");
		}
		return "admin/login";
	}
	/*跳转到用户列表显示*/
	@RequestMapping("/listUser")
	public String listUser(){
		return "admin/listUser";
	}
	
	/*分页返回列表用户信息*/
	@RequestMapping("/getUser")
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request,HttpServletResponse response) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<SysUserPo> page =  sysUserService.getUserByConditions(conditions);
		System.out.println("进入了sysUserController的方法--listByConditon--"+page.getPages());
		return PageUtils.pageToMap(page);	
	}
	
	
	/*用户添加*/
	@RequestMapping("/toAddUser")
	public String toAddUser(HttpServletRequest request){
		/*查询所有的角色信息*/
		List<SysRolePo> list=sysRoleService.addRoleToUser();
		/*返回json格式的数据，values,fields,是在addRolejsp页面上规定的*/
		String json="[{\'values\':\'0\',\'fields\':\'请选择角色\',\'selected\':true},";
		for(SysRolePo sysRole:list){
			json+="{\'values\':\'"+sysRole.getId()+"\',"
					+ "\'fields\':\'"+sysRole.getName()+"\'},";	
		}
		json=json.substring(0, json.length()-1)+"]";
		System.out.println("进入了sysUserController的方法--toAddUser--"+json);
		request.setAttribute("jsons", json);
		return "admin/addUser";
	}
	@RequestMapping(value="/addUser",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addUser(HttpServletRequest request,SysUserPo sysUserPo){
		/*调用service层方法*/
		System.out.println(sysUserPo.toString()) ;
		/*把负责添加人的id值放入到sysRolePo中去*/
		SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo");
		String user_id = Integer.toString(sysUser.getId());
		sysUserPo.setCreateBy(user_id);
		/*返回是否插入数据的标示值*/
		int flag=sysUserService.insertUser(sysUserPo);
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
	
	
	
	/*修改用户信息*/
	
	/*跳转到用户信息界面，并且查询用户的信息到页面*/
	@RequestMapping("/toUpUser")
	public String toUpdateUser(HttpServletRequest request	){
		/*页面传值userid到后台,查找被修改用户的信息*/
		String ids=request.getParameter("id");
		SysUserPo sysUserPo=sysUserService.getUser(Integer.parseInt(ids));
		/*获取所有的角色信息*/
		List<SysRolePo> list=sysRoleService.addRoleToUser();
		/*返回json格式的数据，values,fields,是在addRolejsp页面上规定的*/
		String json="[{\'values\':\'0\',\'fields\':\'请选择角色\'},";
		for(SysRolePo sysRole:list){
			int id=sysRole.getId();
			if(id==Integer.parseInt(sysUserPo.getRole_id())){
				json+="{\'values\':\'"+sysRole.getId()+"\',"
						+ "\'fields\':\'"+sysRole.getName()+"\',\'selected\':true},";	
			}
			else{
			json+="{\'values\':\'"+sysRole.getId()+"\',"
					+ "\'fields\':\'"+sysRole.getName()+"\'},";	
			}
		}
		json=json.substring(0, json.length()-1)+"]";
		request.setAttribute("jsons", json);
		request.setAttribute("sysUserPo", sysUserPo);
		return "admin/updateUser";
	}
	/*修改用户信息*/
	@RequestMapping(value="/updateUser",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateuser(HttpServletRequest request,SysUserPo sysUserPo){
		/*获取修改用户信息的人的id值*/
		/*把负责修改人的id值放入到sysUserPo中去*/
		SysUserPo sysUser=(SysUserPo)request.getSession().getAttribute("sysUserpo");
		
		String user_id = Integer.toString(sysUser.getId());
		sysUserPo.setUpdateBy(user_id);
		System.out.println("进入了sysUserController的方法--updateuser--"+sysUserPo.toString());
		/*调用service层方法*/
		int flag=sysUserService.updateUser(sysUserPo);
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
	
	/*删除用户信息，逻辑上的删除即修改状态字段的值*/
	@RequestMapping("/delUser")
	@ResponseBody
	public JSONObject delUser(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println("当前被删除的值得id是："+id);
		int flag=sysUserService.deleteUser(id);
		System.out.println("执行了sysUserController的deleteUser方法---"+flag);
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
