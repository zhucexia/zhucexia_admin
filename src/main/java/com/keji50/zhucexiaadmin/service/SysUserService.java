package com.keji50.zhucexiaadmin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keji50.zhucexiaadmin.dao.mapper.SysUserPoMapper;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;

@Service(value="SysUserService")
public class SysUserService {
	@Resource(name="sysUserPoMapper")
	private SysUserPoMapper sysUserPoMapper;
    /*用户登录*/
	public SysUserPo login(SysUserPo sysUserPo){
		System.out.println("进入了sysuserService的方法---login中");
		return sysUserPoMapper.login(sysUserPo);	
	}
}
