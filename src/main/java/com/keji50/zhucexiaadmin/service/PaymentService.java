package com.keji50.zhucexiaadmin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.PaymentPoMapper;
import com.keji50.zhucexiaadmin.dao.po.PaymentPo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value = "paymentService")
public class PaymentService {
	
	@Resource(name = "paymentPoMapper")
	private PaymentPoMapper paymentPoMapper;
	
	public Page<PaymentPo> getCustomerByConditions(Map<String, Object> conditions){
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<PaymentPo> page = paymentPoMapper.selectByCondition(conditions);
        return page;
	}

	public int addpayment(PaymentPo payment) {
		// TODO Auto-generated method stub
		int result=paymentPoMapper.addpayment(payment);
		return result;
	}

	public PaymentPo getpayment(int id) {
		// TODO Auto-generated method stub
		PaymentPo c=paymentPoMapper.getpayment(id);
		return c;
	}

	public int updatepayment(PaymentPo payment) {
		// TODO Auto-generated method stub
		int result=paymentPoMapper.updatepayment(payment);
		return result;
	}

	public int deletepayment(int id) {
		// TODO Auto-generated method stub
		return paymentPoMapper.deletepayment(id);
	}

	/*public int addgoodattr(GoodAttrPo goodattr) {
		// TODO Auto-generated method stub
		int result=goodAttrPoMapper.addgoodattr(goodattr);
		return result;
	}
	public int deletegoodattr(int id) {
		// TODO Auto-generated method stub
		return goodAttrPoMapper.deletegoodattr(id);
	}
	public GoodAttrPo getgoodattr(int id) {
		// TODO Auto-generated method stub
		GoodAttrPo c=goodAttrPoMapper.getgoodattr(id);
		return c;
	}
	public int updategoodattr(GoodAttrPo goodattr) {
		// TODO Auto-generated method stub
		int result=goodAttrPoMapper.updategoodattr(goodattr);
		return result;
	}
*/



}
