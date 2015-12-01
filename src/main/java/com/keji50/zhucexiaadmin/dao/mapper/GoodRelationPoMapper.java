package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.keji50.zhucexiaadmin.dao.po.GoodRelationPo;
public interface GoodRelationPoMapper {
	List<HashMap<String, Object>> getGoodRelation(Map<String, Object> map);

	public int delRelation(Map<String, Object> map);

	public int addRelation(GoodRelationPo goodRelationPo);

	public GoodRelationPo querry(GoodRelationPo goodRelationPo);
	

}
