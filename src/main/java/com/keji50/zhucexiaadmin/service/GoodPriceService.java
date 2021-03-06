package com.keji50.zhucexiaadmin.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.GoodAttrPoMapper;
import com.keji50.zhucexiaadmin.dao.mapper.GoodAttrValuePoMapper;
import com.keji50.zhucexiaadmin.dao.mapper.GoodPricePoMapper;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrPo;
import com.keji50.zhucexiaadmin.dao.po.GoodAttrValuePo;
import com.keji50.zhucexiaadmin.dao.po.GoodPricePo;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.web.utils.CodeUtil;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value="GoodPriceService")
public class GoodPriceService {

	@Resource(name="goodPricePoMapper")
	private GoodPricePoMapper goodPricePoMapper;
	@Resource(name="goodAttrPoMapper")
	private GoodAttrPoMapper goodAttrPoMapper;
	@Resource(name="goodAttrValuePoMapper")
	private GoodAttrValuePoMapper goodAttrValuePoMapper;
	
	/*分页查询*/
	public Page<Map<String,Object>> getPriceByConditions(Map<String, Object> conditions) {
		
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<Map<String,Object>> page = goodPricePoMapper.selectByCondition(conditions);
        return page;
	}
	
	//查出价格为空的商品
	public List<Map<String,Object>> toAddPrice(){
        return goodPricePoMapper.toAddPrice();
	}
	
	public int upLoadPrice(GoodPricePo goodPricePo, SysUserPo sysUserPo){
		int goodId = goodPricePo.getGoodId();
		String userName = sysUserPo.getUsername();
		Timestamp time = new Timestamp(System.currentTimeMillis());
		//提取商品属性字段，并解析出属性名和枚举值，分别插入good_attr和good_attr_value
		String goodAttr = goodPricePo.getGoodAttr();
		String[] goodAttrs = goodAttr.split("；"); 
		for(String item:goodAttrs){
			String goodAttrName = item.split("：")[0];
			String goodAttrValue = item.split("：")[1];
			//将属性名插入表good_attr
			GoodAttrPo goodAttrPo =new GoodAttrPo();
			goodAttrPo.setCode(CodeUtil.createCode(16));

			System.out.println(goodAttrPo.getCode());
			goodAttrPo.setGoodId(goodId);
			goodAttrPo.setNames(goodAttrName);
			goodAttrPo.setOptionvalue(goodAttrValue);
			int goodAttrId;
			Boolean bl = goodAttrPoMapper.checkGoodAttr(goodAttrPo)==null;
			if(bl){
				goodAttrPo.setCreateTime(time);
				goodAttrPo.setCreateBy(userName);
				goodAttrPoMapper.addgoodattr(goodAttrPo);
				goodAttrId=goodAttrPo.getId();
			}else{
				goodAttrId = goodAttrPoMapper.checkGoodAttr(goodAttrPo).getId();
			}
			//将属性枚举插入表good_attr_value
			GoodAttrValuePo goodAttrValuePo = new GoodAttrValuePo();
			goodAttrValuePo.setGoodid(goodPricePo.getGoodId());
			goodAttrValuePo.setGoodattrid(goodAttrId);
			goodAttrValuePo.setAttrvalue(goodAttrValue);
			Boolean bl1 = goodAttrValuePoMapper.checkAttrValue(goodAttrValuePo)==null;
			if(bl1){
				goodAttrValuePo.setCreateTime(time);
				goodAttrValuePo.setCreateBy(userName);
				goodAttrValuePoMapper.addgoodattrvalue(goodAttrValuePo);
				String optionValue = goodAttrValuePoMapper.getAttrOptionValue(goodAttrId);
				if(!optionValue.contains(goodAttrValue)){
					optionValue+=","+goodAttrValue;
					goodAttrPo.setOptionvalue(optionValue);
					goodAttrPo.setUpdateBy(userName);
					goodAttrPo.setUpdateTime(time);
					goodAttrPo.setId(goodAttrId);
					goodAttrValuePoMapper.updateAttrOptionValue(goodAttrPo);
				}
			}
			
			
		}
		return goodPricePoMapper.insertGoodPrice(goodPricePo);
	}

	public Map<String, Object> getPriceById(int id) {
		return goodPricePoMapper.getPriceById(id);
	}
	
	public int updatePrice(GoodPricePo goodPricePo){
		return goodPricePoMapper.updatePrice(goodPricePo);
	}

	public int deleteById(int id) {
		return goodPricePoMapper.deleteById(id);
	}

	public Boolean checkPrice(GoodPricePo goodPricePo) {
		boolean flag=false;
		if(goodPricePoMapper.checkPrice(goodPricePo)==null){
			flag=true;
		}
		return flag;
	}


}	

