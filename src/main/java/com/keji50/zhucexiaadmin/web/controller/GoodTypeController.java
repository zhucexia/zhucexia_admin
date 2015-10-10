package com.keji50.zhucexiaadmin.web.controller;



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
import com.keji50.zhucexiaadmin.dao.po.GoodTypePo;
import com.keji50.zhucexiaadmin.service.GoodTypeService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

/**
 * 后台商品分类信息控制器
 * @author hc
 *
 */
@Controller
@RequestMapping(value = "/goodtype")
public class GoodTypeController {

	@Resource(name = "goodTypeService")
	private GoodTypeService goodTypeService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		return "goodtype/list";
	}
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) {
		return "goodtype/add";
	}
	@RequestMapping(value = "/getGoodTypeList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<GoodTypePo> page = goodTypeService.getCustomerByConditions(conditions);
		System.out.println("执行查询"+page.size());
		return PageUtils.pageToMap(page);
	}
	
	@RequestMapping(value = "/deletegoodtype", method = RequestMethod.POST)	
	@ResponseBody
	public JSONObject deletegoodtype(HttpServletRequest request) {
		System.out.println(request.getParameter("sno"));
		int id=Integer.valueOf(request.getParameter("sno"));
		int result=goodTypeService.deletegoodtype(id);
		JSONObject json;
		if(result>0){
			json=JSONObject.parseObject("{'message':'删除成功'}");
		}else{
			json=JSONObject.parseObject("{'message':'删除失败'}");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/addgoodtype", method = RequestMethod.POST)	
	@ResponseBody
	public String addgoodtype(HttpServletRequest request,HttpServletResponse response,GoodTypePo goodtype) {
		System.out.println("进入新增controller");
		System.out.println(goodtype.getCreateBy()+"---"+goodtype.getName()+"---"+goodtype.getSort()+"---"+goodtype.getRemark()+"---"+goodtype.getCode());
		
		int result=goodTypeService.addgoodtype(goodtype);
		String mess="";
		if(result>0){
			mess="新增成功";
		}else{
			mess="新增失败";
		}
		return mess;
	}
	
	@RequestMapping(value = "/getgoodtype", method = RequestMethod.POST)	
	public String getgoodtype(HttpServletRequest request) {
		System.out.println("编辑id："+request.getParameter("id"));
		int id=Integer.valueOf(request.getParameter("id"));
		GoodTypePo goodty=goodTypeService.getgoodtype(id);
		request.setAttribute("goodtype", goodty);
		//System.out.println(cus.getUsername());
		return "goodtype/update";
	}
	
	@RequestMapping(value = "/updategoodtype")	
	@ResponseBody
	public String updategoodtype(HttpServletRequest request,GoodTypePo goodtype) {
		System.out.println("进入修改controller,名为："+goodtype.getName());
		int result=goodTypeService.updategoodtype(goodtype);
		String mess="";
		if(result>0){
			mess="修改成功";
		}else{
			mess="修改成功";	
		}
		System.out.println(mess);
		return mess;
	}
	
}
