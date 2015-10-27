package com.keji50.zhucexiaadmin.web.utils;

import java.util.Random;
import java.util.UUID;

public class CodeUtil {
	public static String createCode(int length){
	     String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	     Random random=new Random();
	     StringBuffer sb=new StringBuffer();
	     for(int i=0;i<length;i++){
	       int number=random.nextInt(str.length());
	       sb.append(str.charAt(number));
	     }
	     return sb.toString();
	 }
}
