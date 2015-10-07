package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

/*角色*/
@Data
public class SysRolePo extends BasePo {
	/*主键id*/
	private Integer id;
	/*角色代码*/
	private String code;
	/*角色名称*/
	private String name;
	/*状态，数据状态 c:草稿 s;已审核 d:删除*/
	private String state;
	
}
