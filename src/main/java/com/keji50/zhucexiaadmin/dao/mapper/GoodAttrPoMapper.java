package com.keji50.zhucexiaadmin.dao.mapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrPo;


public interface GoodAttrPoMapper {
	
	Page<GoodAttrPo> selectByCondition(Map<String, Object> conditions);

	int addgoodattr(GoodAttrPo goodattr);

	int deletegoodattr(int id);

	GoodAttrPo getgoodattr(int id);

	int updategoodattr(GoodAttrPo goodattr);


	Page<HashMap<String, Object>> selectByConditionse(Map<String, Object> conditions);

	
	public  GoodAttrPo checkGoodAttr(GoodAttrPo goodAttrPo);

	List<Map<String, Object>> getGoodType();

}
