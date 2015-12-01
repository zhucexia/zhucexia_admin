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
import com.keji50.zhucexiaadmin.dao.po.SalaOrderPo;
import com.keji50.zhucexiaadmin.service.SalaOrderService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;





@Controller
@RequestMapping(value = "/salaorder")
public class SalaOrderController {
	
	@Resource(name = "salaorderservice")
	private SalaOrderService salaorderservice;
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		return "salaorder/list";
	}
	
	
	@RequestMapping(value = "/getorderList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<SalaOrderPo> page = salaorderservice.getorderByConditions(conditions);
		return PageUtils.pageToMap(page);
	}
	
	@RequestMapping(value = "/deletesalaorder", method = RequestMethod.POST)	
	@ResponseBody
	public JSONObject deletesalaorder(HttpServletRequest request) {
		int id=Integer.valueOf(request.getParameter("sno"));
		int result=salaorderservice.deletesalaorder(id);
		JSONObject json;
		if(result>0){
			json=JSONObject.parseObject("{'message':'删除成功'}");
		}else{
			json=JSONObject.parseObject("{'message':'删除失败'}");
		}
		
		return json;
	}
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) {
		return "salaorder/add";
	}
	
	
	@RequestMapping(value = "/getorder", method = RequestMethod.POST)	
	public String getorder(HttpServletRequest request) {
		int id=Integer.valueOf(request.getParameter("id"));
		SalaOrderPo order=salaorderservice.getorder(id);
		if(order.getOrderstate().equals("0")){
			order.setOrderstate("未确认");
		}else if(order.getOrderstate().equals("1")) {
			order.setOrderstate("已确认");
		}else if(order.getOrderstate().equals("2")){
			order.setOrderstate("交易成功");
		}else{
			order.setOrderstate("交易取消");
		}
		request.setAttribute("order", order);
		return "salaorder/update";
	}
	
	@RequestMapping(value = "/updateorder")	
	@ResponseBody
	public String updateorder(HttpServletRequest request,SalaOrderPo cust) {
		int result=salaorderservice.updateorder(cust);
		String mess="";
		if(result>0){
			mess="修改成功";
		}else{
			mess="修改成功";	
		}
		return mess;
	}
}
