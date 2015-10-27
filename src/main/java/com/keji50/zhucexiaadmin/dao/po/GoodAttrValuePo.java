package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

@Data
public class GoodAttrValuePo extends BasePo {
	
	private int id;
	
	private int goodid;
	
	private int goodattrid;
	
	private String attrvalue;
	
	private int sort;
	
	private GoodAttrPo goodattr;
}
