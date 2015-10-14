package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrPo;
import com.keji50.zhucexiaadmin.dao.po.GoodTypePo;

public interface GoodAttrPoMapper {
	
	Page<GoodAttrPo> selectByCondition(Map<String, Object> conditions);

	int addgoodattr(GoodAttrPo goodattr);

	int deletegoodattr(int id);

	GoodAttrPo getgoodattr(int id);

	int updategoodattr(GoodAttrPo goodattr);
}
