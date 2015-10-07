package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

/*权限，角色映射关系*/
@Data
public class SysRolePowerPo extends BasePo {
	/*主键*/
	private Integer id;
	/*角色id*/
	private String role_id;
	/*权限id*/
	private String power_id;
	/*操作权限,插入权限， 0:未开通， 1已开通'*/
	private String power_insert;
	/*删除权限， 0:未开通， 1已开通'*/
	private String power_delete;
	/*查询权限， 0:未开通， 1已开通*/
	private String power_select;
	/*更新权限， 0:未开通， 1已开通*/
	private String power_update;
	private SysRolePo sysRolePo;
	private SysPowerPo sysPowerPo;

}
