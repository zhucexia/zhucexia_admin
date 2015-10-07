package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.ProductPo;

public interface ProductPoMapper {
	/*插入产品信息*/
	public int  insertPro(ProductPo productPo);
	/*分页查询产品信息*/
	Page<ProductPo> selectByCondition(Map<String,Object> conditions);
	/*删除产品信息*/
	public int deletePro(int id);
}
