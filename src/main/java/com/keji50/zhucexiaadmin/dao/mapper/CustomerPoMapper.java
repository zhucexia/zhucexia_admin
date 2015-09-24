package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.Map;
import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.CustomerPo;

public interface CustomerPoMapper {
	
	Page<CustomerPo> selectByCondition(Map<String, Object> conditions);
}
