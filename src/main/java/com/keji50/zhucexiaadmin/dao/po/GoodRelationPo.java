package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

@Data
public class GoodRelationPo extends BasePo {
	/*id值*/
	private Integer id;
	/*商品id*/
	private Integer good_id;
	/*关联商品id*/
	private Integer related_good_id;
	/*关联商品名称*/
	private String related_good_name;
	/*是否必须*/
	private String is_necesssary;
	
}
