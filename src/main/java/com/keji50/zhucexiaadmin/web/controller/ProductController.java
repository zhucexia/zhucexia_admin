package com.keji50.zhucexiaadmin.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.ProductPo;
import com.keji50.zhucexiaadmin.service.ProductService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Resource(name="ProductService")
	private ProductService productService;
	
	@RequestMapping("/toAddPro")
	public String toAddPro(){
		return "product/addPro";
	}
	@RequestMapping(value="/addPros",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject  addPro(ProductPo productpo,HttpServletRequest request){
		/*调用service层方法*/
		/*返回是否插入数据的标示值*/
		int flag=productService.insertProduct(productpo);
		/*声明json数据类型变量，返回到前台*/
		JSONObject json;
		if(flag>0){
		json= JSONObject.parseObject("{'message':'true'}");
		}
		else{
		json=JSONObject.parseObject("{'message':'false'}");
		}
		return  json;
	}
	
	/*列表显示产品信息*/
	@RequestMapping("/listPro")
	public String listPro(){
		return "product/listPro";
	}
	
	
	@RequestMapping(value = "/getProductList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request,HttpServletResponse response) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<ProductPo> page = productService.getProductByConditions(conditions);
		return PageUtils.pageToMap(page);
		
	}
	
	
	/*删除产品信息*/
	@RequestMapping("/delPro")
	public void deletePro(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		int flag=productService.deletePro(id);		
	}

}
