package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;

public interface SysUserPoMapper {
	/*用户登录*/
	public SysUserPo login(SysUserPo sysUserPo);

	public int insertUser(SysUserPo sysUserPo);

	public int updateUser(SysUserPo sysUserPo);

	public int deleteUser(int id);

	public SysUserPo getUser(int id);

	public Page<SysUserPo> selectByCondition(Map<String, Object> conditions); 
}
