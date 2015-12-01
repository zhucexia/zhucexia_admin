package com.keji50.zhucexiaadmin.dao.mapper;

import java.util.List;

import com.keji50.zhucexiaadmin.dao.po.CustomerAddrPo;
import com.keji50.zhucexiaadmin.dao.po.CustomerPo;



public interface CustomerAddrPoMapper {
	
	int insert (CustomerAddrPo customerAddr);

	public CustomerAddrPo query(int i);

	public CustomerAddrPo getAddr(int addrId);

	public int updateDefaultAddr();

	public List<CustomerAddrPo> queryList(int id);

	public int update(CustomerPo customerAddrPo);
	public int isDefaultById(String id);

	public int delAddr(String id);
	



}
