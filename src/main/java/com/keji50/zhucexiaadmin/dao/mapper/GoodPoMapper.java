package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.GoodPo;

public interface GoodPoMapper {
	/*插入产品信息*/
	public int  insertGood(GoodPo goodPo);
	/*分页查询产品信息*/
	public Page<GoodPo> selectByCondition(Map<String,Object> conditions);
	/*删除产品信息*/
	public int deleteGood(int id);
	/*修改商品信息*/
	public int updateGood(int id);
	public List<Map<String, Object>> selectGoodType();
	public GoodPo getGoodById(String id);
	/**
	 * 下拉框查询
	 * @return
	 */
	public List<Map<String, Object>> selectGood();
}
