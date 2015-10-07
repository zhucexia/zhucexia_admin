package com.keji50.zhucexiaadmin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keji50.zhucexiaadmin.dao.mapper.SysRolePowerPoMapper;
import com.keji50.zhucexiaadmin.dao.po.SysRolePowerPo;

@Service(value="SysRolePowerService")
public class SysRolePowerService {
	@Resource(name="sysRolePowerPoMapper")
	private SysRolePowerPoMapper sysRolePowerPoMapper;

	public List<SysRolePowerPo> getRolePower(String role_id) {
		return  sysRolePowerPoMapper.selectRolePower(role_id);
	}
}
