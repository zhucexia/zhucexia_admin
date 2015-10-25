package com.keji50.zhucexiaadmin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.SysUserPoMapper;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value="SysUserService")
public class SysUserService {
	@Resource(name="sysUserPoMapper")
	private SysUserPoMapper sysUserPoMapper;
    /*用户登录*/
	public SysUserPo login(SysUserPo sysUserPo){
		System.out.println("进入了sysuserService的方法---login中");
		return sysUserPoMapper.login(sysUserPo);	
	}
	public Page<SysUserPo> getUserByConditions(Map<String, Object> conditions) {
		System.out.println("进入了SysUserService的分页查询信息方法----getUserByCondtions");
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<SysUserPo> page = sysUserPoMapper.selectByCondition(conditions);
        System.out.println("在getUserByCondtions中-----"+page.getTotal());
        for (SysUserPo sysUserPo : page) {
			System.out.println(sysUserPo.getCreateBy()+"----"+sysUserPo.getCreateTime()+"----"+sysUserPo.getUpdateTime());
		}
        return page;
	}
	public int insertUser(SysUserPo sysUserPo) {
		System.out.println("进入了sysUserService方法--insertUser");
		return sysUserPoMapper.insertUser(sysUserPo);
	}
	public SysUserPo getUser(int id) {
		return sysUserPoMapper.getUser(id);
		
	}
	public int updateUser(SysUserPo sysUserPo) {
		
		return sysUserPoMapper.updateUser(sysUserPo);
	}
	public int deleteUser(int id) {
		return sysUserPoMapper.deleteUser(id);
	}
}
