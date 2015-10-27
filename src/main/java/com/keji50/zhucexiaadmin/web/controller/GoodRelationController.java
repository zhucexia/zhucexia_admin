package com.keji50.zhucexiaadmin.web.controller;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.keji50.zhucexiaadmin.dao.po.GoodRelationPo;
import com.keji50.zhucexiaadmin.dao.po.SysUserPo;
import com.keji50.zhucexiaadmin.service.GoodRelationService;

/*商品关联*/
@Controller
@RequestMapping("/goodRelation")
public class GoodRelationController {

	@Resource(name="goodRelationService")
	private GoodRelationService goodRelationService;
	
	/*配置商品关联关系，达到配置页面*/
	@RequestMapping("/toManageGood")
	public String toManageGood(HttpServletRequest request) throws UnsupportedEncodingException{
		/*当前商品id和类型名称*/
		String id=request.getParameter("id");
		request.setCharacterEncoding("utf-8");
		String good_type_name=new String(request.getParameter("good_type_name").getBytes("iso-8859-1"),"utf-8");
		System.out.println("good_type_name"+good_type_name);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("good_type_name", good_type_name);
		/*查询产品间的关联配置*/
		List<HashMap<String,Object>> list=goodRelationService.getGoodRelation(map);
		/*格式化数据,返回产品间配置到前台*/
		String str="[";
		for(HashMap<String,Object> maps :list){
			System.out.println("进入了GoodRelationController里面的toManageGood方法----"+maps.get("id"));
			System.out.println("id--"+maps.get("id")+"---Name--"+maps.get("name"));
			System.out.println("related_good_id----"+maps.get("related_good_id")+"---related_good_name==="+maps.get("related_good_name")+"good_id--"+maps.get("good_id"));
			/*判断该角色有没有当前的权限*/
			if(maps.get("related_good_id")!=null){
				str+="{'id':'"+maps.get("id")+"','text':'"+maps.get("name")+"',"
						+ "'checked':true},";
			}
			else{
				str+="{'id':'"+maps.get("id")+"','text':'"+maps.get("name")+"'},";
			}
		}
		str=str.substring(0,str.length()-1)+"]";
		System.out.println(str);
		request.setAttribute("json", str);
		request.setAttribute("good_id", id);
		System.out.println("进入了rolepowercontroller里面的toDistriPower方法----"+str);
		return "good/manageGood";
	}
	/*提交商品关系配置,
	 * 1.删除未被选中的配置
	 * 2.添加别选中的配置
	 * */
	@RequestMapping("/manageGood")
	@ResponseBody
	public JSONObject  manageGood(HttpServletRequest request){
		String selectedGood=request.getParameter("selectedGood");
		String unSelected =request.getParameter("unSelected");
		String selectedName=request.getParameter("selectedName");
		System.out.println("selectedGood--"+selectedGood+"---"+unSelected);
		String good_id=request.getParameter("good_id");
		/*获取当前的用户名称*/
		SysUserPo sysUserPo=(SysUserPo)request.getSession().getAttribute("sysUserpo");
		String name=sysUserPo.getUsername();
		/*判断是否有未被选中的值*/
		if(unSelected.length()>0){
			System.out.println(unSelected.length());
		/*删除未被选中配置*/
		Map<String,Object> map = new HashMap<String,Object>();
		//System.out.println("unSelected.lastIndexOf(,)--"+unSelected.lastIndexOf(","));
		unSelected=unSelected.substring(0,unSelected.lastIndexOf(","));
		map.put("good_id", good_id);
		map.put("unSelected", unSelected);
	   goodRelationService.delRelation(map);
		}
		/*插入选中配置,判断是否有选中的配置传递过来*/
		if(selectedGood.length()>0){
		String[] strSelected=selectedGood.split(",");
		String[] names=selectedName.split(",");
		for(int i=0;i<strSelected.length;i++){
			/*实例化一个GoodRelationPo对象 */
			GoodRelationPo goodRelationPo = new GoodRelationPo();
			goodRelationPo.setCreateBy(name);
			goodRelationPo.setIs_necesssary("1");
			goodRelationPo.setRelated_good_name(names[i]);
			goodRelationPo.setGood_id(Integer.parseInt(good_id));
			goodRelationPo.setRelated_good_id(Integer.parseInt(strSelected[i]));
			goodRelationService.addRelation(goodRelationPo);
		}
		}
		JSONObject json= JSONObject.parseObject("{'message':'true'}");
		return json;
	}
}
