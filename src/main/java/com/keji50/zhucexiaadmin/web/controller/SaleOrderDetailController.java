package com.keji50.zhucexiaadmin.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.SaleOrderDetailPo;
import com.keji50.zhucexiaadmin.service.SaleOrderDetailService;

@Controller
@RequestMapping(value="/saleorderdetail")
public class SaleOrderDetailController {
	
	@Resource(name="saleorderdetailservice")
	private SaleOrderDetailService saleOrderDetailService;
	
	@RequestMapping(value="/getorderdetail")
	@ResponseBody
	public Map<String,Object> getOrderDetail(HttpServletRequest request){
		int order_id = Integer.valueOf(request.getParameter("id"));
		SaleOrderDetailPo c = saleOrderDetailService.getOrderDitail(order_id);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("order_id", c.getOrder_id());
		map.put("good_id", c.getGood_id());
		map.put("good_name", c.getGood_name());
		map.put("good_price_id", c.getGood_price_id());
		map.put("good_price", c.getGood_price());
		map.put("good_num", c.getGood_num());
		map.put("total_price", c.getTotal_price());
		return map;
	}
}
