package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

@Data
public class GoodPricePo extends BasePo{
	private int id;
	
	private int goodId;
	
	private String goodAttr;
	
	private float price;
}
