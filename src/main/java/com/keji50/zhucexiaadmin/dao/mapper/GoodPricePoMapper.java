package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.GoodPricePo;

public interface GoodPricePoMapper {
	//插入产品价格信息
	public int insertGoodPrice(GoodPricePo goodPricePo);
	//按条件分页查询产品价格信息
	public Page<Map<String,Object>> selectByCondition(Map<String,Object> conditions);
	//查询商品
	public List<Map<String,Object>> toAddPrice();
	
	public Map<String,Object> getPriceById(int id);
	
	public int updatePrice(GoodPricePo goodPricePo);
	
	public int deleteById(int id);
	
	public GoodPricePo checkPrice(GoodPricePo goodPricePo);
	
	public int selGoodTypeId(int goodId);
	//public void addGoodAttr(GoodAttrPo goodAttrPo);
}
