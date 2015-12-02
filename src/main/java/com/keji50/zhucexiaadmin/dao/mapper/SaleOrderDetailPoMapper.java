package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.List;
import java.util.Map;

import com.keji50.zhucexiaadmin.dao.po.SaleOrderDetailPo;

public interface SaleOrderDetailPoMapper {
	SaleOrderDetailPo getOrderDetail(int order_id);

	public List<Map<String, Object>> querryDetails(int parseInt); 
}
