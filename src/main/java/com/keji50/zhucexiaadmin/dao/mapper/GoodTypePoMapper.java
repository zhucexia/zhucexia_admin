package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.GoodTypePo;

public interface GoodTypePoMapper {
	
	Page<GoodTypePo> selectByCondition(Map<String, Object> conditions);

	int deletecustomer(int id);

	GoodTypePo getgoodtype(int id);

	int addgoodtype(GoodTypePo goodtype);

	int updategoodtype(GoodTypePo goodtype);
}
