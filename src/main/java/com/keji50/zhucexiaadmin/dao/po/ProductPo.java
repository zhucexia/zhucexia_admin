package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

@Data
public class ProductPo extends BasePo {
	// 主键值
	private int id;
	//产品名称
	private String product_name;
	//产品价格
	private double product_price;
	// 产品描述
	private String product_description;
	//产品排序号
	private int product_code;
	//产品图片
	private String product_image;
	//产品上下架 0 代表下架，1代表上架
	private int product_grounding;
	//产品状态 0代表删除，1 代表正常
	private int product_status;
	
}
