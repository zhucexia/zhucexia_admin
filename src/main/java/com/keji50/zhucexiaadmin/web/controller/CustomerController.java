package com.keji50.zhucexiaadmin.web.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value = "/getCustomerList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);

		Page<CustomerPo> page = customerService.getCustomerByConditions(conditions);
		return PageUtils.pageToMap(page);
	}
}
