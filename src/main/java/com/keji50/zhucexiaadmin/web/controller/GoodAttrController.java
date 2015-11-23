package com.keji50.zhucexiaadmin.web.controller;
import java.util.HashMap;
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
import com.keji50.zhucexiaadmin.service.GoodService;
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
	
	@Resource(name="GoodService")
	private GoodService goodService;
	
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		/*查询出所有的商品*/
		List<Map<String,Object>> list = goodService.selectGood();
		System.out.println("商品总共："+list);
		/*返回json格式的数据，values,fields,是在addGoodjsp页面上规定的,显示商品类型下拉框*/
		String json="[{\'values\':\'0\',\'fields\':\'全部\',\'selected\':true},";
		for(Map<String, Object> map:list){
			json+="{\'values\':\'"+map.get("id").toString()+"\',"
					+ "\'fields\':\'"+map.get("name").toString()+"\'},";	
		}
		json=json.substring(0, json.length()-1)+"]";
		System.out.println("进入了sysGoodController的方法--toAddGood--"+json);
		request.setAttribute("jsons", json);
		return "goodattr/list";
	}
	@RequestMapping(value = "/add")

	public String add(HttpServletRequest request) {
		List<Map<String,Object>> list = goodService.selectGood();
		String json="[{\'values\':\'0\',\'fields\':\'请选择商品\',\'selected\':true},";
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
	public Map<String, Object> listByConditione(HttpServletRequest request) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<HashMap<String, Object>> page = goodAttrService.getCustomerByConditionse(conditions);
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
		System.out.println(goodattr.getCreateBy()+"---"+goodattr.getNames()+"---"+goodattr.getSort()+"---"+goodattr.getRemark()+"---"+goodattr.getCode()+"---"+goodattr.getGoodId());
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
		System.out.println("进入修改controller,名为："+goodattr.getNames());
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
