package com.keji50.zhucexiaadmin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.keji50.zhucexiaadmin.dao.mapper.ProductPoMapper;
import com.keji50.zhucexiaadmin.dao.po.CustomerPo;
import com.keji50.zhucexiaadmin.dao.po.ProductPo;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;

@Service(value="ProductService")
public class ProductService {
	@Resource(name="productPoMapper")
	private ProductPoMapper productPoMapper;
	
	public int insertProduct(ProductPo productPo){
		System.out.println("进入了productService");
		return productPoMapper.insertPro(productPo);	
	}
	
	/*分页查询*/
	public Page<ProductPo> getProductByConditions(Map<String, Object> conditions) {
		
		System.out.println("进入了ProductService的分页查询信息方法----getProductByCondtions");
		// 设置分页信息
		PageUtils.initPageInfo(conditions);
		
		// 分页插件
        PageHelper.startPage((Integer) conditions.get(PageUtils.PAGE_NUM), (Integer) conditions.get(PageUtils.PAGE_SIZE));
        // 根据查询条件查询客户信息
        Page<ProductPo> page = productPoMapper.selectByCondition(conditions);
        System.out.println("在getProductByCondtions中-----"+page.getTotal());
        System.out.println(page.get(0).toString());
        return page;
	}
	
	/*删除产品信息*/
	public int deletePro(int id){
		System.out.println("进入产品删除的service中的deletePro方法，此处id值为："+id);
		return productPoMapper.deletePro(id);
	}
}
