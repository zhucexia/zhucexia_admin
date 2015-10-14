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
import com.keji50.zhucexiaadmin.dao.po.GoodAttrPo;
import com.keji50.zhucexiaadmin.service.GoodAttrService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

/**
 * 后台商品分类信息控制器
 * @author hc
 *
 */
@Controller
@RequestMapping(value = "/goodattr")
public class GoodAttrController {

	@Resource(name = "goodAttrService")
	private GoodAttrService goodAttrService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		return "goodattr/list";
	}
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) {
		return "goodattr/add";
	}
	@RequestMapping(value = "/getGoodAttrList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<GoodAttrPo> page = goodAttrService.getCustomerByConditions(conditions);
		System.out.println("执行查询"+page.size());
		return PageUtils.pageToMap(page);
	}
	
	@RequestMapping(value = "/deletegoodattr", method = RequestMethod.POST)	
	@ResponseBody
	public JSONObject deletegoodattr(HttpServletRequest request) {
		System.out.println(request.getParameter("sno"));
		int id=Integer.valueOf(request.getParameter("sno"));
		int result=goodAttrService.deletegoodattr(id);
		JSONObject json;
		if(result>0){
			json=JSONObject.parseObject("{'message':'删除成功'}");
		}else{
			json=JSONObject.parseObject("{'message':'删除失败'}");
		}		
		return json;
	}
	
	@RequestMapping(value = "/addgoodattr", method = RequestMethod.POST)	
	@ResponseBody
	public String addgoodattr(HttpServletRequest request,HttpServletResponse response,GoodAttrPo goodattr) {
		System.out.println("进入新增controller");
		System.out.println(goodattr.getCreateBy()+"---"+goodattr.getName()+"---"+goodattr.getSort()+"---"+goodattr.getRemark()+"---"+goodattr.getCode());
		
		int result=goodAttrService.addgoodattr(goodattr);
		String mess="";
		if(result>0){
			mess="新增成功";
		}else{
			mess="新增失败";
		}
		return mess;
	}
	
	@RequestMapping(value = "/getgoodattr", method = RequestMethod.POST)	
	public String getgoodattr(HttpServletRequest request) {
		System.out.println("编辑id："+request.getParameter("id"));
		int id=Integer.valueOf(request.getParameter("id"));
		GoodAttrPo goodty=goodAttrService.getgoodattr(id);
		request.setAttribute("goodtype", goodty);
		//System.out.println(cus.getUsername());
		return "goodattr/update";
	}
	
	@RequestMapping(value = "/updategoodattr")	
	@ResponseBody
	public String updategoodattr(HttpServletRequest request,GoodAttrPo goodattr) {
		System.out.println("进入修改controller,名为："+goodattr.getName());
		int result=goodAttrService.updategoodattr(goodattr);
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
