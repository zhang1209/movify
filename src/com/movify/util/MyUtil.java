package com.movify.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyUtil {
	
	//校验字符串是否为空
	public static boolean isNull(String content){
		return content==null || "".equals(content);
	}
	
	
	public static String getDate(Date date){
		return getDate(date);
	}
	
	public static String getDate(Date date,String format){
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.format(date);
	}
	
	public static Date getDate(String strDate){
		return getDate(strDate,"yyyy-MM-dd");
	}
	
	public static Date getDate(String strDate,String format){
		//定义日期格式化对象，将字符串转为日期类型
		//format:日期格式化字符 y,M,d,H,m,s
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		try {
			return sdf.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
