package com.keji50.zhucexiaadmin.dao.po;

import lombok.Data;

/*权限菜单*/
@Data
public class SysPowerPo extends BasePo {
	/*主键id*/
	private Integer id;
	/*权限菜单代码*/
	private String code;
	/*权限菜单名称*/
	private String name;
	/*状态，数据状态 c:草稿 s;已审核 d:删除*/
	private String href;

}
