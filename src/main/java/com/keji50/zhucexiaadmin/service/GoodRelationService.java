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

	public int addRelation(GoodRelationPo goodRelationPo) throws RuntimeException {
		// 判断当前的配置关系是否存在,不存在时执行添加操作
		GoodRelationPo  goodRelation=goodRelationPoMapper.querry(goodRelationPo);
		if(goodRelation==null){
			int flag=goodRelationPoMapper.addRelation(goodRelationPo);
			if(flag>0){
				return flag;
			}
			else{
				throw new RuntimeException();
			}
		}
		else{
			return 0;
		}
	}


}