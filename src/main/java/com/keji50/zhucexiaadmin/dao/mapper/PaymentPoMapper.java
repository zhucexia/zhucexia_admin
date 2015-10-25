package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.Map;

import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.PaymentPo;

public interface PaymentPoMapper {
	
	Page<PaymentPo> selectByCondition(Map<String, Object> conditions);

	int addpayment(PaymentPo payment);

	PaymentPo getpayment(int id);

	int updatepayment(PaymentPo payment);

	int deletepayment(int id);

	
}
