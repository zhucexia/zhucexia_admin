package com.keji50.zhucexiaadmin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keji50.zhucexiaadmin.dao.mapper.CustomerAddrPoMapper;
import com.keji50.zhucexiaadmin.dao.po.CustomerAddrPo;
@Service(value = "customerAddressService")
public class CustomerAddressService {
	@Resource(name="customerAddrPoMapper")
	private CustomerAddrPoMapper customerAddrPoMapper;
  public CustomerAddrPo getAddr(Integer id){
	  return customerAddrPoMapper.getAddr(id);
  }





}
