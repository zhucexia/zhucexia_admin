package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.SysRolePo;

public interface SysRolePoMapper {

	Page<SysRolePo> selectByCondition(Map<String, Object> conditions);

	public int  insertRole(SysRolePo sysRolePo);

	public SysRolePo getRoleById(int id);

	public int updateRole(SysRolePo sysRolePo);

	public int deleteRole(int id);
	
	public SysRolePo checkRole(SysRolePo sysRole);

	public List<SysRolePo> addRoleToUser();
	

	

}
