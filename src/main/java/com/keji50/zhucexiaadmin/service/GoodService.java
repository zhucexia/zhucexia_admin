package com.keji50.zhucexiaadmin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.GoodPoMapper;
import com.keji50.zhucexiaadmin.dao.po.CustomerPo;
import com.keji50.zhucexiaadmin.dao.po.GoodPo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value="GoodService")
public class GoodService {
	@Resource(name="goodPoMapper")
	private GoodPoMapper goodPoMapper;
	
	public int insertGood(GoodPo goodPo){
		System.out.println("进入了goodService");
		goodPo.setDetail_content(goodPo.getDetail_content().trim());
		return goodPoMapper.insertGood(goodPo);	
	}
	
	/*分页查询*/
	public Page<GoodPo> getGoodByConditions(Map<String, Object> conditions) {
		
		System.out.println("进入了GoodService的分页查询信息方法----getGoodByCondtions");
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<GoodPo> page = goodPoMapper.selectByCondition(conditions);
        System.out.println("在getGoodByCondtions中-----"+page.getTotal());
        return page;
	}
	
	/*删除产品信息*/
	public int deleteGood(int id){
		System.out.println("进入产品删除的service中的deleteGood方法，此处id值为："+id);
		return goodPoMapper.deleteGood(id);
	}

	public List<Map<String, Object>> selectGoodType() {
		return goodPoMapper.selectGoodType();
	}
     
	/*查询商品信息，修改商品信息*/
	public GoodPo getGoodById(String id) {
		return goodPoMapper.getGoodById(id);
	}
	public List<Map<String, Object>> selectGood() {
		// TODO Auto-generated method stub
		return goodPoMapper.selectGood();
	}

	public int updateGood(GoodPo goodPo) throws RuntimeException {
		int flag=goodPoMapper.updateGood(goodPo);
		if(flag>0){
			return flag;
		}
		else{
			throw new RuntimeException();
		}
	}

	public int delGood(int id) throws RuntimeException{
		int flag=goodPoMapper.delGood(id);
		if(flag>0){
			return flag;
		}
		else{
			throw new RuntimeException();
		}
	}

}
