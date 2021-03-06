package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

@Data
public class SaleOrderDetailPo extends BasePo{
	private int id;
	
	private int good_id;
	
	private String good_name;
	
	private int good_price_id;
	
	private float good_price;
	
	private int good_num;
	
	private float total_price;
	
	private int order_id;
}
