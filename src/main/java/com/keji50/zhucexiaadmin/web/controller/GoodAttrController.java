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
import com.keji50.zhucexiaadmin.dao.po.GoodAttrPo;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
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
		List<Map<String,Object>> list = goodAttrService.getGoodType();
		String json="[{\'values\':\'0\',\'fields\':\'请选择类型\',\'selected\':true},";
		for(Map<String, Object> map:list){
			json+="{\'values\':\'"+map.get("id").toString()+"\',"
					+ "\'fields\':\'"+map.get("name").toString()+"\'},";	
		}
		json=json.substring(0, json.length()-1)+"]";
		System.out.println("进入了sysGoodController的方法--toAddGood--"+json);
		request.setAttribute("jsons", json);
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
	public int addgoodattr(HttpServletRequest request,HttpServletResponse response,GoodAttrPo goodattr) {
		System.out.println("进入新增controller");
		System.out.println(goodattr.getCreateBy()+"---"+goodattr.getName()+"---"+goodattr.getSort()+"---"+goodattr.getRemark()+"---"+goodattr.getCode()+"---"+goodattr.getGoodTypeId());
		Boolean flag = goodAttrService.checkGoodAtrr(goodattr);
		int i = 0;
		if(flag){
			SysUserPo sysUserPo = (SysUserPo)request.getSession().getAttribute("sysUserpo");
			goodattr.setCreateBy(sysUserPo.getUsername());
			Timestamp time = new Timestamp(System.currentTimeMillis());
			goodattr.setCreateTime(time);
			int result=goodAttrService.addgoodattr(goodattr);
			System.out.println("插入结果："+result);
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
	
	@RequestMapping(value = "/getgoodattr", method = RequestMethod.POST)	
	public String getgoodattr(HttpServletRequest request) {
		System.out.println("编辑id："+request.getParameter("id"));
		int id=Integer.valueOf(request.getParameter("id"));
		GoodAttrPo goodAttrPo=goodAttrService.getgoodattr(id);
		request.setAttribute("goodAttr", goodAttrPo);
		//System.out.println(cus.getUsername());
		return "goodattr/update";
	}
	
	@RequestMapping(value = "/updategoodattr")	
	@ResponseBody
	public int updategoodattr(HttpServletRequest request,GoodAttrPo goodattr) {
		System.out.println("进入修改controller,名为："+goodattr.getName());
		Boolean flag = goodAttrService.checkGoodAtrr(goodattr);
		int i=0;
		if(flag){
			SysUserPo sysUserPo = (SysUserPo)request.getSession().getAttribute("sysUserpo");
			goodattr.setUpdateBy(sysUserPo.getUsername());
			Timestamp time = new Timestamp(System.currentTimeMillis());
			goodattr.setUpdateTime(time);
			int result=goodAttrService.updategoodattr(goodattr);
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
