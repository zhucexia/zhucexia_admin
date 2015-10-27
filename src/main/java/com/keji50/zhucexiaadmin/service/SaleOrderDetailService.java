package com.keji50.zhucexiaadmin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keji50.zhucexiaadmin.dao.mapper.SaleOrderDetailPoMapper;
import com.keji50.zhucexiaadmin.dao.po.SaleOrderDetailPo;

@Service(value="saleorderdetailservice")
public class SaleOrderDetailService {
	@Resource(name="saleOrderDetailPoMapper")
	private SaleOrderDetailPoMapper saleOrderDetailPoMapper;
	public SaleOrderDetailPo getOrderDitail(int order_id){
		SaleOrderDetailPo c=saleOrderDetailPoMapper.getOrderDetail(order_id);
		return c;
	}
}
