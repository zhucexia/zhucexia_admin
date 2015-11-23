package com.keji50.zhucexiaadmin.service;

import java.text.SimpleDateFormat;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.CustomerPoMapper;
import com.keji50.zhucexiaadmin.dao.po.CustomerPo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value = "customerService")
public class CustomerService {
	
	@Resource(name = "customerPoMapper")
	private CustomerPoMapper customerPoMapper;
	
	public Page<CustomerPo> getCustomerByConditions(Map<String, Object> conditions){
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<CustomerPo> page = customerPoMapper.selectByCondition(conditions);
       /* SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
        for (CustomerPo customerPo : page) {
        	@SuppressWarnings("unused")
			String date=sf.format(customerPo.getCreateTime());
            
		}*/
        return page;
	}

	public int deletecustomer(int id) {
		return customerPoMapper.deletecustomer(id);
	}

	public int addcustomer(CustomerPo cust) {
		int result=customerPoMapper.addcustomer(cust);
		return result;
	}

	public CustomerPo getCustomer(int id) {
		CustomerPo c=customerPoMapper.getCustomer(id);
		return c;
	}

	public int updatecustomer(CustomerPo cust) {
		int result=customerPoMapper.updatecustomer(cust);
		return result;
	}
	
	public Boolean checkCustomer(CustomerPo cust){
		Boolean flag = customerPoMapper.checkCustomer(cust)==null;
		return flag;
	}



}
