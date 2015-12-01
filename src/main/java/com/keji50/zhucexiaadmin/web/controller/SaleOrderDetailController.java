	package com.keji50.zhucexiaadmin.web.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.keji50.zhucexiaadmin.dao.po.CustomerAddrPo;
import com.keji50.zhucexiaadmin.dao.po.SalaOrderPo;
import com.keji50.zhucexiaadmin.service.CustomerAddressService;
import com.keji50.zhucexiaadmin.service.SalaOrderService;
import com.keji50.zhucexiaadmin.service.SaleOrderDetailService;

@Controller
@RequestMapping(value="/saleorderdetail")
public class SaleOrderDetailController {
	
	@Resource(name="saleorderdetailservice")
	private SaleOrderDetailService saleOrderDetailService;
	@Resource(name = "salaorderservice")
	private SalaOrderService salaorderservice;
	@Resource(name = "customerAddressService")
	private CustomerAddressService customerAddressService;
	
	@RequestMapping(value="/getorderdetail")
	public String getOrderDetail(HttpServletRequest request){
		int order_id = Integer.valueOf(request.getParameter("id"));
		/*查询订单的详细信息*/
		SalaOrderPo saleOrderPo = salaorderservice.getorder(order_id);
		/*查询地址信息*/
		String addressId=saleOrderPo.getAddress();
		CustomerAddrPo addrPo=null;
		if(addressId!=null){
			addrPo=customerAddressService.getAddr(Integer.parseInt(addressId));
		}
		List<Map<String,Object>> list=saleOrderDetailService.queryDitail(saleOrderPo.getId());
		request.setAttribute("saleOrderPo", saleOrderPo);
		request.setAttribute("addrPo", addrPo);
		request.setAttribute("list", list);
		return "salaorder/orderDetail";
	}
}			
