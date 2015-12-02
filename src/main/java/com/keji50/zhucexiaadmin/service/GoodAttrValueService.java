package com.keji50.zhucexiaadmin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.GoodAttrValuePoMapper;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrPo;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrValuePo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value = "goodAttrValueService")
public class GoodAttrValueService {
	
	@Resource(name = "goodAttrValuePoMapper")
	private GoodAttrValuePoMapper goodAttrValuePoMapper;
	
	public Page<GoodAttrValuePo> getCustomerByConditions(Map<String, Object> conditions){
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<GoodAttrValuePo> page = goodAttrValuePoMapper.selectByCondition(conditions);
        return page;
	}

	public int addgoodattrvalue(GoodAttrValuePo goodattrvalue) {
		int result=goodAttrValuePoMapper.addgoodattrvalue(goodattrvalue);
		return result;
	}

	public int deletegoodattrvalue(int id) {
		return goodAttrValuePoMapper.deletegoodattrvalue(id);
	}
	public GoodAttrValuePo getgoodattrvalue(int id) {
		GoodAttrValuePo c=goodAttrValuePoMapper.getgoodattrvalue(id);
		return c;
	}
	public int updategoodattrvalue(GoodAttrValuePo goodattrvalue) {
		int result=goodAttrValuePoMapper.updategoodattrvalue(goodattrvalue);
		return result;
	}

	public Boolean checkAttrValue(GoodAttrValuePo goodAttrValue){
		Boolean flag = goodAttrValuePoMapper.checkAttrValue(goodAttrValue)==null;
		return flag;
	}

	public String getAttrOptionValue(int goodAttrId) {
		return goodAttrValuePoMapper.getAttrOptionValue(goodAttrId);
	}

	public int updateAttrOptionValue(GoodAttrPo goodAttrPo) {
		int i = goodAttrValuePoMapper.updateAttrOptionValue(goodAttrPo);
		return i;
	}

}
