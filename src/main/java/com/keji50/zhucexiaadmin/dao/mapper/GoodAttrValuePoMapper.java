package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrPo;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrValuePo;

public interface GoodAttrValuePoMapper {
	
	Page<GoodAttrValuePo> selectByCondition(Map<String, Object> conditions);

	GoodAttrValuePo getgoodattrvalue(int id);

	int addgoodattrvalue(GoodAttrValuePo goodattrvalue);

	int deletegoodattrvalue(int id);

	int updategoodattrvalue(GoodAttrValuePo goodattrvalue);
	
	GoodAttrValuePo checkAttrValue(GoodAttrValuePo goodAttrValue);

	String getAttrOptionValue(int goodAttrId);
	
	int updateAttrOptionValue(GoodAttrPo goodAttrPo);
}
