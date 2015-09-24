package com.keji50.zhucexiaadmin.web.utils;

import java.util.Map;
import com.alibaba.fastjson.JSONObject;

public class JSTLFunction {
	
	/**
	 * @param key
	 * @param json
	 * @return
	 */
	public static String get(String key, String json){  
		Map<String, Object> map = JSONObject.parseObject(json);
		return (String)map.get(key);
		
    } 
	
}
