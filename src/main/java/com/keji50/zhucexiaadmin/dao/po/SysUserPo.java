package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

/*系统管理员*/
@Data
public class SysUserPo extends BasePo {
	/*主键值*/
	private Integer id;
	/*用户名*/
	private String  username;
	/*密码*/
	private String password;
	/*真实姓名*/
	private String realname;
	/*角色id值*/
	private String role_id;
	/*电话号码*/
	private String mobile;
	/*邮件*/
	private String eamil;
	/*公司*/
	private String company;
	/*地址*/
	private String address;
	/*部门名称*/
	private String dept_name;
	/* 数据状态 c:草稿 s;已审核 d:删除*/
	private String state;


}
