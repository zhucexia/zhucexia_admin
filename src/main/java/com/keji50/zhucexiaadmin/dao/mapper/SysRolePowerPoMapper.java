package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.keji50.zhucexiaadmin.dao.po.SysRolePowerPo;

public interface SysRolePowerPoMapper {
	/*查询用户的角色id值*/
	public List<SysRolePowerPo> selectRolePower(String role_id);

	public List<HashMap<String, Object>> getPowers(String role_id);

	
	public int insertRolePower(SysRolePowerPo sysrRolePowerPo);
	
	public SysRolePowerPo checkRolePower(SysRolePowerPo sysRolePowerPo);
	
	public int deleteRolePower(SysRolePowerPo sysRolePowerPo);

}
