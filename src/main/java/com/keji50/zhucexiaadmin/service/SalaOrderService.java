package com.keji50.zhucexiaadmin.service;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.SalaOrderPoMapper;
import com.keji50.zhucexiaadmin.dao.po.SalaOrderPo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;



@Service(value = "salaorderservice")
public class SalaOrderService {

	@Resource(name = "salaOrderPoMapper")
	private SalaOrderPoMapper salaOrderPoMapper;

	public Page<SalaOrderPo> getorderByConditions(Map<String, Object> conditions) {
		// TODO Auto-generated method stub
		// 设置分页信息
				PageUtils.initPageInfo(conditions);
				
				// 分页插件
		        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
		        // 根据查询条件查询客户信息
		        Page<SalaOrderPo> page = salaOrderPoMapper.selectByCondition(conditions);
		        //SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
//		        for (SalaOrderPo salaOrderPo : page) {
//		        	@SuppressWarnings("unused")
//					String date=sf.format(salaOrderPo.getCreateTime());
//		            
//				}
		        return page;
	}

	public int deletesalaorder(int id) {
		// TODO Auto-generated method stub
		int result=salaOrderPoMapper.deletesalaorder(id);
		return result;
	}

	public SalaOrderPo getorder(int id) {
		// TODO Auto-generated method stub
		SalaOrderPo c=salaOrderPoMapper.getorder(id);
		return c;
		
	}

	public int updateorder(SalaOrderPo cust) {
		
		int result=salaOrderPoMapper.updateorder(cust);
		return result;
	}
	public SalaOrderPo getOrderByNo(String order_no){
		return salaOrderPoMapper.getOrderByNo(order_no);
	}


	

}
