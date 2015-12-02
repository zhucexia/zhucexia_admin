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
import com.keji50.zhucexiaadmin.dao.po.GoodAttrValuePo;
import com.keji50.zhucexiaadmin.dao.po.GoodPricePo;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.service.GoodAttrService;
import com.keji50.zhucexiaadmin.service.GoodPriceService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

@Controller
@RequestMapping("/goodprice")
public class GoodPriceController {

	@Resource(name="GoodPriceService")
	private GoodPriceService goodPriceService;
	@Resource(name="goodAttrService")
	private GoodAttrService goodAttrService;
	
	
	/*列表显示产品信息*/
	@RequestMapping("/listGoodPrice")
	public String listPro(){
		return "goodprice/listGoodPrice";
	}
	
	@RequestMapping(value = "/getGoodPriceList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request,HttpServletResponse response) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<Map<String,Object>> page = goodPriceService.getPriceByConditions(conditions);
		return PageUtils.pageToMap(page);
		
	}
	
	@RequestMapping("/toAddGoodPrice")
	public String toAddGoodPrice(HttpServletRequest request){
		List<Map<String, Object>> list = goodPriceService.toAddPrice();
		String str="[{\'good_id\':\'0\',\'name\':\'商品名称\',\'selected\':true},";
		for(Map<String,Object> map:list){
			str+="{\'good_id\':\'"+map.get("id")+"\',"+"\'name\':\'"+map.get("name")+"\'},";
		}
		str = str.substring(0, str.length()-1)+"]";
		request.setAttribute("json", str);
		return "goodprice/addGoodPrice";
	}

	@RequestMapping("/upLoadPrice")
	@ResponseBody
	public int upLoadPrice(HttpServletRequest request,HttpServletResponse response,GoodPricePo goodPricePo){
		
		SysUserPo sysUserPo = (SysUserPo)request.getSession().getAttribute("sysUserpo");
		Boolean flag = goodPriceService.checkPrice(goodPricePo);
		int i ;
		if(flag){	
			goodPricePo.setCreateBy(sysUserPo.getUsername());
			Timestamp time = new Timestamp(System.currentTimeMillis());
			goodPricePo.setCreateTime(time);
			int result = goodPriceService.upLoadPrice(goodPricePo,sysUserPo);
			if(result>0){
				i=0;
			}else{
				i=1;
			}
		}else{
			i=3;
		}
		return i;
	}
	
	@RequestMapping("/toUpdatePrice")
	public String toUpdateGoodPrice(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		Map<String,Object> map = goodPriceService.getPriceById(id);
		String str = "{\'id\':\'"+map.get("id")+"\',\'good_id\':\'"+map.get("good_id")+"\',\'good_attr\':\'"+
		map.get("good_attr")+"\',\'price\':\'"+map.get("price")+"\',\'name\':\'"+map.get("name")+"\'}";
		JSONObject json = JSONObject.parseObject(str);
		request.setAttribute("json", json);
		return "goodprice/updateGoodPrice";
	}
	
	@RequestMapping("/updatePrice")
	@ResponseBody
	public JSONObject updatePrice(HttpServletRequest request,HttpServletResponse response){
		GoodPricePo goodPricePo = new GoodPricePo();
		goodPricePo.setId(Integer.parseInt(request.getParameter("id")));
		goodPricePo.setGoodId(Integer.parseInt(request.getParameter("good_id")));
		goodPricePo.setGoodAttr(request.getParameter("good_attr"));
		goodPricePo.setPrice(Float.parseFloat(request.getParameter("price")));
		goodPricePo.setUpdateBy(request.getParameter("updateBy"));
		int result = goodPriceService.updatePrice(goodPricePo);
		JSONObject json;
		String msg = "";
		if(result>0){
			json = JSONObject.parseObject("{'msg':'true'}");
		}else{
			json = JSONObject.parseObject("{'msg':'true'}");
		}
		return json;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(HttpServletRequest request,HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		int result = goodPriceService.deleteById(id);
		String msg = "";
		if(result>0){
			msg = "true";
		}else{
			msg = "false";
		}
		return msg;
	}
	
	
}
