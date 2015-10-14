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
import com.keji50.zhucexiaadmin.dao.po.GoodAttrValuePo;
import com.keji50.zhucexiaadmin.service.GoodAttrValueService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

/**
 * 后台商品分类信息控制器
 * @author hc
 *
 */
@Controller
@RequestMapping(value = "/goodattrvalue")
public class GoodAttrValueController {

	@Resource(name = "goodAttrValueService")
	private GoodAttrValueService goodAttrValueService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		return "goodattrvalue/list";
	}
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) {
		return "goodattrvalue/add";
	}
	@RequestMapping(value = "/getGoodAttrValueList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<GoodAttrValuePo> page = goodAttrValueService.getCustomerByConditions(conditions);
		System.out.println("执行查询"+page.size());
		for (GoodAttrValuePo goodAttrValuePo : page) {
			System.out.println("条件属性名称"+goodAttrValuePo.getGoodattr().getName()+"条件属性的code"+goodAttrValuePo.getGoodattr().getCode());
		};
		return PageUtils.pageToMap(page);
	}
	
	@RequestMapping(value = "/deletegoodattrvalue", method = RequestMethod.POST)	
	@ResponseBody
	public JSONObject deletegoodattrvalue(HttpServletRequest request) {
		System.out.println(request.getParameter("sno"));
		int id=Integer.valueOf(request.getParameter("sno"));
		int result=goodAttrValueService.deletegoodattrvalue(id);
		JSONObject json;
		if(result>0){
			json=JSONObject.parseObject("{'message':'删除成功'}");
		}else{
			json=JSONObject.parseObject("{'message':'删除失败'}");
		}		
		return json;
	}
	
	@RequestMapping(value = "/addgoodattrvalue", method = RequestMethod.POST)	
	@ResponseBody
	public String addgoodattr(HttpServletRequest request,HttpServletResponse response,GoodAttrValuePo goodattrvalue) {
		System.out.println("进入新增controller");
		System.out.println(goodattrvalue.getCreateBy()+"---"+goodattrvalue.getAttrvalue()+"---"+goodattrvalue.getGoodid()+"---"+goodattrvalue.getSort()+"---"+goodattrvalue.getCreateBy());
		
		int result=goodAttrValueService.addgoodattrvalue(goodattrvalue);
		String mess="";
		if(result>0){
			mess="新增成功";
		}else{
			mess="新增失败";
		}
		return mess;
	}
	
	@RequestMapping(value = "/getgoodattrvalue", method = RequestMethod.POST)	
	public String getgoodattr(HttpServletRequest request) {
		System.out.println("编辑id："+request.getParameter("id"));
		int id=Integer.valueOf(request.getParameter("id"));
		GoodAttrValuePo goodAttrValuePo=goodAttrValueService.getgoodattrvalue(id);
		request.setAttribute("goodAttrValuePo", goodAttrValuePo);
		//System.out.println(cus.getUsername());
		return "goodattrvalue/update";
	}
	
	@RequestMapping(value = "/updategoodattrvalue")	
	@ResponseBody
	public String updategoodattrvalue(HttpServletRequest request,GoodAttrValuePo goodattrvalue) {
		System.out.println("进入修改controller,名为："+goodattrvalue.getAttrvalue()+"--"+goodattrvalue.getUpdateBy()+"--"+goodattrvalue.getGoodattrid()+"--"+goodattrvalue.getGoodid()+"--"+goodattrvalue.getSort());
		int result=goodAttrValueService.updategoodattrvalue(goodattrvalue);
		System.out.println("进入修改controller处理后"+goodattrvalue);
		String mess="";
		if(result>0){
			mess="修改成功";
		}else{
			mess="修改失败";
		}
		System.out.println(mess);
		return mess;
	}
	
}
