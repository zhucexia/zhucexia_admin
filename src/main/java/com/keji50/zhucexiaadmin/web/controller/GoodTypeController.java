package com.keji50.zhucexiaadmin.web.controller;



import java.sql.Timestamp;
import java.util.List;
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
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.service.GoodAttrService;
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
	@Resource(name = "goodAttrService")
	private GoodAttrService goodAttrService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		List<Map<String,Object>> list = goodAttrService.getGoodType();
		String json="[{\'values\':\'\',\'fields\':\'全部\',\'selected\':true},";
		for(Map<String, Object> map:list){
			json+="{\'values\':\'"+map.get("id").toString()+"\',"
					+ "\'fields\':\'"+map.get("name").toString()+"\'},";	
		}
		json=json.substring(0, json.length()-1)+"]";
		request.setAttribute("jsons", json);		
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
		Page<GoodTypePo> page = goodTypeService.getGoodTypeByConditions(conditions);
		return PageUtils.pageToMap(page);
	}
	
	@RequestMapping(value = "/deletegoodtype", method = RequestMethod.POST)	
	@ResponseBody
	public JSONObject deletegoodtype(HttpServletRequest request) {
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
	public int addgoodtype(HttpServletRequest request,HttpServletResponse response,GoodTypePo goodtype) {
		Boolean flag = goodTypeService.checkGoodType(goodtype);
		int i=0;
		if(flag){
			SysUserPo sysUserPo = (SysUserPo)request.getSession().getAttribute("sysUserpo");
			goodtype.setCreateBy(sysUserPo.getUsername());
			Timestamp time = new Timestamp(System.currentTimeMillis());
			goodtype.setCreateTime(time);
			int result=goodTypeService.addgoodtype(goodtype);
			if(result>0){
				i=0;
			}else{
				i=1;
			}
		}else{
			i=2;
		}
		return i;
	}
	
	@RequestMapping(value = "/getgoodtype", method = RequestMethod.POST)	
	public String getgoodtype(HttpServletRequest request) {
		int id=Integer.valueOf(request.getParameter("id"));
		GoodTypePo goodty=goodTypeService.getgoodtype(id);
		request.setAttribute("goodtype", goodty);
		//System.out.println(cus.getUsername());
		return "goodtype/update";
	}
	
	@RequestMapping(value = "/updategoodtype")	
	@ResponseBody
	public int updategoodtype(HttpServletRequest request,GoodTypePo goodtype) {
		Boolean flag = goodTypeService.checkGoodType(goodtype);
		int i = 0;
		if(flag){
			SysUserPo sysUserPo = (SysUserPo)request.getSession().getAttribute("sysUserpo");
			goodtype.setUpdateBy(sysUserPo.getUsername());
			Timestamp time = new Timestamp(System.currentTimeMillis());
			goodtype.setUpdateTime(time);
			int result=goodTypeService.updategoodtype(goodtype);
			if(result>0){
				i=0;
			}else{
				i=1;	
			}
		}else{
			i=2;
		}
		return i;
	}
	
}
