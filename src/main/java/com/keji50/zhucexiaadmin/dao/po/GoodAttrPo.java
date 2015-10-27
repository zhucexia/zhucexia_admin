package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

@Data
public class GoodAttrPo extends BasePo {
	private int id;
	private int goodTypeId;
	
	private String code;
	
	private String names;
	
	private int sort;
	
	private String remark;
	
	private String state;
	
	private String optionvalue;
	
}
