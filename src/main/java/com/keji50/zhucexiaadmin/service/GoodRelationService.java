package com.keji50.zhucexiaadmin.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keji50.zhucexiaadmin.dao.mapper.GoodRelationPoMapper;
import com.keji50.zhucexiaadmin.dao.po.GoodRelationPo;
@Service(value="goodRelationService")
public class GoodRelationService {
	@Resource(name="goodRelationPoMapper")
	private GoodRelationPoMapper goodRelationPoMapper;

	public List<HashMap<String, Object>> getGoodRelation(Map<String, Object> map) {
		return goodRelationPoMapper.getGoodRelation(map);
	}

	public int delRelation(Map<String, Object> map) {
		return goodRelationPoMapper.delRelation(map);
	}

	public int addRelation(GoodRelationPo goodRelationPo) {
		// TODO Auto-generated method stub
		return goodRelationPoMapper.addRelation(goodRelationPo);
	}


}