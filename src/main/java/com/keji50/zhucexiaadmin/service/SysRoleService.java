package com.keji50.zhucexiaadmin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.SysRolePoMapper;
import com.keji50.zhucexiaadmin.dao.po.SysRolePo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

/*角色*/
@Service(value="sysRoleService")
public class SysRoleService {
	@Resource(name="sysRolePoMapper")
	private SysRolePoMapper sysRolePoMapper;
	public Page<SysRolePo> getRoleByConditions(Map<String, Object> conditions) {
		System.out.println("进入了SysRoleService的分页查询信息方法----getRolesByCondtions");
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<SysRolePo> page = sysRolePoMapper.selectByCondition(conditions);
        System.out.println("在getProductByCondtions中-----"+page.getTotal());
        for (SysRolePo sysRolePo : page) {
			System.out.println(sysRolePo.getCreateBy()+"----"+sysRolePo.getCreateTime()+"----"+sysRolePo.getUpdateTime());
		}
        return page;

    }
	public int insertRole(SysRolePo sysRolePo) {
		
		return sysRolePoMapper.insertRole(sysRolePo);
	}
	
	public Boolean checkRole(SysRolePo sysRolePo){
		Boolean flag = sysRolePoMapper.checkRole(sysRolePo)==null;
		return flag;
	}
	
	/*修改角色信息*/
	public SysRolePo getRoleById(int id) {
		return sysRolePoMapper.getRoleById(id);
	}
	public int updateRole(SysRolePo sysRolePo) {
		System.out.println("在sysRoleService的方法--updateRole中--"+sysRolePo.toString());
		return sysRolePoMapper.updateRole(sysRolePo);
	}
	public int deleteRole(int id) {
		return sysRolePoMapper.deleteRole(id);
	}
	/*查询所有角色的信息，用于添加用户的时候，用户选择角色---*/
	public List<SysRolePo> addRoleToUser(){
		return sysRolePoMapper.addRoleToUser();
	}
}
