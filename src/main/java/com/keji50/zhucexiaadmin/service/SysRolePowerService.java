package com.keji50.zhucexiaadmin.service;

import java.util.HashMap;
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

	public List<HashMap<String, Object>> getPowers(String role_id) {
		return sysRolePowerPoMapper.getPowers(role_id);
			
	}
	
	public Boolean checkRolePower(SysRolePowerPo sysRolePowerPo){
		Boolean flag = sysRolePowerPoMapper.checkRolePower(sysRolePowerPo)==null;
		return flag;
	}

	public void insertRolePower(SysRolePowerPo sysRolePowerPo) {
		sysRolePowerPoMapper.insertRolePower(sysRolePowerPo);
	}

	public void deleteRolePower(SysRolePowerPo sysRolePowerPo) {
		sysRolePowerPoMapper.deleteRolePower(sysRolePowerPo);
	}
}
