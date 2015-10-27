package com.keji50.zhucexiaadmin.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;




import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.keji50.zhucexiaadmin.dao.po.GoodPo;
import com.keji50.zhucexiaadmin.dao.po.SysRolePo;
import com.keji50.zhucexiaadmin.service.GoodService;
import com.keji50.zhucexiaadmin.web.utils.PageUtils;
import com.keji50.zhucexiaadmin.web.utils.WebUtils;

@Controller
@RequestMapping("/good")
public class GoodController {

	@Resource(name="GoodService")
	private GoodService goodService;
	
	@RequestMapping("/toAddGood")
	public String toAddGood(HttpServletRequest request){
		System.out.println("进入了toAddGood方法里面！");
		/*查询出所有的商品类型*/
		List<Map<String,Object>> list = goodService.selectGoodType();
		/*返回json格式的数据，values,fields,是在addGoodjsp页面上规定的,显示商品类型下拉框*/
		String json="[{\'values\':\'0\',\'fields\':\'请选择类型\',\'selected\':true},";
		for(Map<String, Object> map:list){
			json+="{\'values\':\'"+map.get("id").toString()+","+map.get("name").toString()+"\',"
					+ "\'fields\':\'"+map.get("name").toString()+"\'},";	
		}
		json=json.substring(0, json.length()-1)+"]";
		System.out.println("进入了sysGoodController的方法--toAddGood--"+json);
		request.setAttribute("jsons", json);
		return "good/addGood";
	}
	@RequestMapping(value="/addGood",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject  addGood(GoodPo goodPo,HttpServletRequest request){
		/*调用service层方法*/
		System.out.println(goodPo.toString()) ;
		System.out.println("goodController---addGood方法---pic的值--"+goodPo.getPic());
		goodPo.setPic("111");
		goodPo.setPic_id("222");
		/*返回是否插入数据的标示值*/
		int flag=goodService.insertGood(goodPo);
		
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
	@RequestMapping("/listGood")
	public String listPro(){
		
		System.out.println("进入了listGood方法里面！");
		return "good/listGood";
	}
	
	@RequestMapping(value = "/getGoodList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listByCondition(HttpServletRequest request,HttpServletResponse response) {
		String requestJson = WebUtils.getRequestPayload(request);
		Map<String, Object> conditions = JSONObject.parseObject(requestJson);
		Page<GoodPo> page = goodService.getGoodByConditions(conditions);
		return PageUtils.pageToMap(page);
		
	}
	
	

	
	/*删除产品信息*/
	@RequestMapping("/delGood")
	public void deletePro(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println("当前被删除的值得id是："+id);
		int flag=goodService.deleteGood(id);
		System.out.println("执行了goodController的deleteGood方法---"+flag);
		
	}
	
	
	/*上传商品封面，添加商品信息*/
	@RequestMapping("/upload")  
	@ResponseBody
    public JSONObject upload(HttpServletRequest request, HttpServletResponse response,ModelMap maps) throws IOException, ParseException {  
		  MultipartHttpServletRequest req=(MultipartHttpServletRequest)request;
		  MultipartFile file =null;
		  if(req.getFileNames().hasNext()){
			  file=req.getFile(req.getFileNames().next());
		  }
		  String fileName = file.getOriginalFilename(); 
		  String path = request.getSession().getServletContext().getRealPath("/")+"/static/upload";
		  System.out.println("paht---"+path);
		  File files= new File(path);
		  System.out.println("files.path"+files.getAbsolutePath());
		  if(!files.exists()){
			  System.out.println("--------------");
			  files.mkdir();
		  }
	        File tempFile = new File(path, new Date().getTime() + String.valueOf(fileName));  
	        if (!tempFile.getParentFile().exists()) {  
	            tempFile.getParentFile().mkdir();  
	        }  
	        if (!tempFile.exists()) {  
	            tempFile.createNewFile();  
	        }  
	        file.transferTo(tempFile);  
	        String filePath= request.getSession().getServletContext().getContextPath()+"/static/upload/"+tempFile.getName();
	        GoodPo goodPo= new GoodPo();
	        goodPo.setCode(req.getParameter("code"));
	        goodPo.setName(req.getParameter("name"));
	        String[] goodType_Name_id=req.getParameter("good_type_name").toString().split(",");
	        goodPo.setGood_type_name(goodType_Name_id[1]);
	        goodPo.setGood_type_id(Integer.parseInt(goodType_Name_id[0]));
	        goodPo.setPrice_range(req.getParameter("price_range"));
	        goodPo.setPrice_market(req.getParameter("price_market"));
	        String rPath=request.getSession().getServletContext().getRealPath("/")+"/static/upload/"+String.valueOf(fileName);
	        System.out.println(rPath);
	        goodPo.setPic(tempFile.getName());
	        goodPo.setPic_id(tempFile.getName());
	        goodPo.setRegister_cost(req.getParameter("register_cost"));
	        goodPo.setApply_condition(req.getParameter("apply_condition"));
	        goodPo.setDetail_content(req.getParameter("detail_content"));
	        String[] begin_sale_time=req.getParameter("begin_sale_time").split("/");
	        String bst=begin_sale_time[2]+"-"+begin_sale_time[0]+"-"+begin_sale_time[1];
	        String[] end_sale_time=req.getParameter("begin_sale_time").split("/");
	        String est=end_sale_time[2]+"-"+end_sale_time[0]+"-"+end_sale_time[1];
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        System.out.println(bst);
	        System.out.println(est);
	        System.out.println("---------"+req.getParameter("begin_sale_time").getClass().getName());
	        String aa=sdf.format(sdf.parse(bst));
	        String bb=sdf.format(sdf.parse(est));
	        goodPo.setBegin_sale_time(sdf.parse(aa));
	        goodPo.setEnd_sale_time(sdf.parse(bb));
	        goodPo.setIndex_show(req.getParameter("index_show"));
	        goodPo.setRemark(req.getParameter("remark"));
	        goodPo.setSort(Integer.parseInt(req.getParameter("sort")));
	        int flag=goodService.insertGood(goodPo);
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
	
	
	/*跳转到商品修改页面*/
	@RequestMapping("/toUpdateGood")
	public String toUpdateGood(HttpServletRequest request){
		/*查询商品原来信息*/
		String id=request.getParameter("id");
		System.out.println("进入了goodController--方法--toUpdateGood--id--"+id);
		GoodPo goodPo=goodService.getGoodById(id);
		System.out.println("进入了goodController--方法--toUpdateGood--"+goodPo.toString());
		//获取当前的商品的商品类型id和name
		String goodType_id_name =goodPo.getId()+","+goodPo.getName();
		/*查询出所有的商品类型*/
		List<Map<String,Object>> list = goodService.selectGoodType();
		/*返回json格式的数据，values,fields,是在addGoodjsp页面上规定的,显示商品类型下拉框*/
		String json="[{\'values\':\'0\',\'fields\':\'请选择类型\',\'selected\':true},";
		/*遍历查询结果，获取商品类型id和那么，返回到jsp*/
		for(Map<String, Object> map:list){
			String type_id_name=map.get("id")+","+map.get("name");
			/*确定当前商品的商品类型,增加selected属性，选中该类型*/
			if(goodType_id_name.equals(type_id_name)){
				json+="{\'values\':\'"+map.get("id").toString()+","+map.get("name").toString()+"\',"
					+ "\'fields\':\'"+map.get("name").toString()+"\',\'selected\':true},";	
			}
			else{
				json+="{\'values\':\'"+map.get("id").toString()+","+map.get("name").toString()+"\',"
						+ "\'fields\':\'"+map.get("name").toString()+"\'},";	
			}
		}
		json=json.substring(0, json.length()-1)+"]";
		System.out.println("进入了GoodController的方法--toUpdateGood--"+json);
		/*返回jsp页面所有商品类型信息*/
		request.setAttribute("jsons", json);
		/*返回jsp页面所有商品信息*/
		request.setAttribute("goodPo", goodPo);
		return "good/updateGood";
	}
	
}
