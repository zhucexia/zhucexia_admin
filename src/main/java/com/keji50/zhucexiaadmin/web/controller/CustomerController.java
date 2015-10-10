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
import com.keji50.zhucexiaadmin.dao.po.CustomerPo;
import com.keji50.zhucexiaadmin.service.CustomerService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

	@Resource(name = "customerService")
	private CustomerService customerService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		return "customer/list";
	}
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) {
		return "customer/add";
	}
	@RequestMapping(value = "/getCustomerList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<CustomerPo> page = customerService.getCustomerByConditions(conditions);
		System.out.println("执行查询"+page.size());
		for (CustomerPo customerPo : page) {
			
			System.out.println("修改时间"+customerPo.getUpdateTime());
			
		}
	
		return PageUtils.pageToMap(page);
	}
	
	@RequestMapping(value = "/deletecustomer", method = RequestMethod.POST)	
	@ResponseBody
	public JSONObject deletecustomer(HttpServletRequest request) {
		System.out.println(request.getParameter("sno"));
		int id=Integer.valueOf(request.getParameter("sno"));
		int result=customerService.deletecustomer(id);
		JSONObject json;
		if(result>0){
			json=JSONObject.parseObject("{'message':'删除成功'}");
		}else{
			json=JSONObject.parseObject("{'message':'删除失败'}");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/newcus", method = RequestMethod.POST)	
	@ResponseBody
	public String newcus(HttpServletRequest request,HttpServletResponse response,CustomerPo cust) {
		System.out.println("进入新增controller");
		System.out.println(cust.getPassword()+"---"+cust.getUsername()+"---"+cust.getEmail()+"---"+cust.getPhoneNumber()+"---"+cust.getCreateBy());
		
		int result=customerService.addcustomer(cust);
		String mess="";
		if(result>0){
			mess="新增成功";
		}else{
			mess="新增失败";
		}
		return mess;
	}
	
	@RequestMapping(value = "/getcustomer", method = RequestMethod.POST)	
	public String getcustomer(HttpServletRequest request) {
		System.out.println("编辑id："+request.getParameter("id"));
		int id=Integer.valueOf(request.getParameter("id"));
		CustomerPo cus=customerService.getCustomer(id);
		request.setAttribute("customer", cus);
		//System.out.println(cus.getUsername());
		return "customer/update";
	}
	
	@RequestMapping(value = "/updatecustomer")	
	@ResponseBody
	public String updatecustomer(HttpServletRequest request,CustomerPo cust) {
		System.out.println("进入修改controller,名为："+cust.getUsername());
		int result=customerService.updatecustomer(cust);
		String mess="";
		if(result>0){
			mess="修改成功";
		}else{
			mess="修改成功";	
		}
		return mess;
	}
	
}
