package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.SalaOrderPo;

public interface SalaOrderPoMapper {

	Page<SalaOrderPo> selectByCondition(Map<String, Object> conditions);

	int deletesalaorder(int id);

	SalaOrderPo getorder(int id);

	int updateorder(SalaOrderPo cust);

	

}
