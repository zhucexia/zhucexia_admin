package com.keji50.zhucexiaadmin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.GoodTypePoMapper;
import com.keji50.zhucexiaadmin.dao.po.GoodTypePo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value = "goodTypeService")
public class GoodTypeService {
	
	@Resource(name = "goodTypePoMapper")
	private GoodTypePoMapper goodTypePoMapper;
	
	public Page<GoodTypePo> getGoodTypeByConditions(Map<String, Object> conditions){
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<GoodTypePo> page = goodTypePoMapper.selectByCondition(conditions);
        return page;
	}

	public int addgoodtype(GoodTypePo goodtype) {
		int result=goodTypePoMapper.addgoodtype(goodtype);
		return result;
	}

	public int deletegoodtype(int id) {
		return goodTypePoMapper.deletecustomer(id);
	}
	public GoodTypePo getgoodtype(int id) {
		GoodTypePo c=goodTypePoMapper.getgoodtype(id);
		return c;
	}
	public int updategoodtype(GoodTypePo goodtype) {
		int result=goodTypePoMapper.updategoodtype(goodtype);
		return result;
	}

	public Boolean checkGoodType(GoodTypePo goodtype){
		Boolean flag = goodTypePoMapper.checkGoodType(goodtype)==null;
		return flag;
	}


}
