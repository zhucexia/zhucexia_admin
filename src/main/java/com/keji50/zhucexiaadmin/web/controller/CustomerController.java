package com.keji50.zhucexiaadmin.web.controller;



import java.sql.Timestamp;
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
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
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
	public Map<String, Object> listByCondition(HttpServletRequest request,HttpServletResponse response) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<CustomerPo> page = customerService.getCustomerByConditions(conditions);
		//System.out.println("执行查询"+page.s);
/*		for (CustomerPo customerPo : page) {
			
			System.out.println("修改时间"+customerPo.getUpdateTime());
			
		}*/
	
		return PageUtils.pageToMap(page);
	}
	
	@RequestMapping(value = "/deletecustomer", method = RequestMethod.POST)	
	@ResponseBody
	public JSONObject deletecustomer(HttpServletRequest request) {
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
	public int newcus(HttpServletRequest request,HttpServletResponse response,CustomerPo cust) {
		Boolean flag = customerService.checkCustomer(cust);
		int i = 0;
		if(flag){
			SysUserPo sysUserPo = (SysUserPo)request.getSession().getAttribute("sysUserpo");
			String userName = sysUserPo.getUsername();
			cust.setCreateBy(userName);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			cust.setCreateTime(time);
			int result=customerService.addcustomer(cust);
			if(result>0){
				i=0;
			}else{
				i=1;
			}
		}else{
			i=2;
		}
		return i;
	}
	
	@RequestMapping(value = "/getcustomer", method = RequestMethod.POST)	
	public String getcustomer(HttpServletRequest request) {
		int id=Integer.valueOf(request.getParameter("id"));
		CustomerPo cus=customerService.getCustomer(id);
		request.setAttribute("customer", cus);
		return "customer/update";
	}
	
	@RequestMapping(value = "/updatecustomer")	
	@ResponseBody
	public int updatecustomer(HttpServletRequest request,CustomerPo cust) {
		Boolean flag = customerService.checkCustomer(cust);
		int i = 0;
		if(flag){
			SysUserPo sysUserPo = (SysUserPo)request.getSession().getAttribute("sysUserPo");
			String userName = sysUserPo.getUsername();
			cust.setUpdateBy(userName);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			cust.setUpdateTime(time);
			int result=customerService.updatecustomer(cust);
			if(result>0){
				i=0;
			}else{
				i=1;
			}
		}else{
			i=2;
		}
		return i;
	}
	
}
