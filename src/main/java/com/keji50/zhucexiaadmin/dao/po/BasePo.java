package com.keji50.zhucexiaadmin.dao.po;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class BasePo {
	
	private String createBy;
	
	private Timestamp createTime;
	
	private String updateBy;
	
	private Timestamp updateTime;
	
}
