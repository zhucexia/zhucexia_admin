package com.keji50.zhucexiaadmin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.GoodAttrPoMapper;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrPo;
import com.keji50.zhucexiaadmin.dao.po.GoodTypePo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value = "goodAttrService")
public class GoodAttrService {
	
	@Resource(name = "goodAttrPoMapper")
	private GoodAttrPoMapper goodAttrPoMapper;
	
	public Page<GoodAttrPo> getCustomerByConditions(Map<String, Object> conditions){
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<GoodAttrPo> page = goodAttrPoMapper.selectByCondition(conditions);
        return page;
	}

	public int addgoodattr(GoodAttrPo goodattr) {
		int result=goodAttrPoMapper.addgoodattr(goodattr);
		return result;
	}
	public int deletegoodattr(int id) {
		return goodAttrPoMapper.deletegoodattr(id);
	}
	public GoodAttrPo getgoodattr(int id) {
		GoodAttrPo c=goodAttrPoMapper.getgoodattr(id);
		return c;
	}
	public int updategoodattr(GoodAttrPo goodattr) {
		int result=goodAttrPoMapper.updategoodattr(goodattr);
		return result;
	}

	public Boolean checkGoodAtrr(GoodAttrPo goodAttrPo){
		Boolean flag = goodAttrPoMapper.checkGoodAttr(goodAttrPo)==null;
		return flag;
	}

	public List<Map<String, Object>> getGoodType() {
		
		return goodAttrPoMapper.getGoodType();
	}


}
