package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

@Data
public class CustomerPo extends BasePo {
	
	private int id;
	
	private String username;
	
	private String password;
	
	private String email;
	
	private String phoneNumber;
}
