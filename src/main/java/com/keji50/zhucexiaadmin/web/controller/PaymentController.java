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
import com.keji50.zhucexiaadmin.dao.po.PaymentPo;
import com.keji50.zhucexiaadmin.service.PaymentService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

/**
 * 后台商品分类信息控制器
 * @author hc
 *
 */
@Controller
@RequestMapping(value = "/payment")
public class PaymentController {

	@Resource(name = "paymentService")
	private PaymentService paymentService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		return "payment/list";
	}
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) {
		return "payment/add";
	}
	@RequestMapping(value = "/getPaymentList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<PaymentPo> page = paymentService.getCustomerByConditions(conditions);
		System.out.println("执行查询"+page.size());
		return PageUtils.pageToMap(page);
	}
	
	
	@RequestMapping(value = "/addpayment", method = RequestMethod.POST)	
	@ResponseBody
	public String addpayment(HttpServletRequest request,HttpServletResponse response,PaymentPo payment) {
		System.out.println("进入新增controller");
		System.out.println(payment.getCreateBy()+"---"+payment.getName()+"---"+payment.getCode()+"---"+payment.getRemark());
		
		int result=paymentService.addpayment(payment);
		String mess="";
		if(result>0){
			mess="新增成功";
		}else{
			mess="新增失败";
		}
		return mess;
	}
	
	
	@RequestMapping(value = "/getpayment", method = RequestMethod.POST)	
	public String getpayment(HttpServletRequest request) {
		System.out.println("编辑id："+request.getParameter("id"));
		int id=Integer.valueOf(request.getParameter("id"));
		PaymentPo payment=paymentService.getpayment(id);
		request.setAttribute("payment", payment);
		//System.out.println(cus.getUsername());
		return "payment/update";
	}
	
	@RequestMapping(value = "/updatepayment")	
	@ResponseBody
	public String updatepayment(HttpServletRequest request,PaymentPo payment) {
		System.out.println("进入修改controller,名为："+payment.getId()+"--------"+payment);
		int result=paymentService.updatepayment(payment);
		String mess="";
		if(result>0){
			mess="修改成功";
		}else{
			mess="修改成功";	
		}
		System.out.println(mess);
		return mess;
	}
	@RequestMapping(value = "/deletepayment", method = RequestMethod.POST)	
	@ResponseBody
	public JSONObject deletepayment(HttpServletRequest request) {
		System.out.println(request.getParameter("sno"));
		int id=Integer.valueOf(request.getParameter("sno"));
		int result=paymentService.deletepayment(id);
		JSONObject json;
		if(result>0){
			json=JSONObject.parseObject("{'message':'删除成功'}");
		}else{
			json=JSONObject.parseObject("{'message':'删除失败'}");
		}		
		return json;
	}

	
}
