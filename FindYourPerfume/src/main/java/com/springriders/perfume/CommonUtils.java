package com.springriders.perfume;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

public class CommonUtils {
	public static int parseStringToInt(String str) {
		try {
			return Integer.parseInt(str);
		} catch(Exception e) {}		
		return 0;
	}
	
	public static double parseStringToDouble(String str) {
		try {
			return Double.parseDouble(str);
		} catch(Exception e) {}		
		return 0;
	}
	
	public static int getIntParameter(String key, HttpServletRequest request) {
		return parseStringToInt(request.getParameter(key));
	}
	
	public static int getIntParameter(String key, MultipartRequest request) {
		return parseStringToInt(request.getParameter(key));
	}
	
	public static double getDoubleParameter(String key, HttpServletRequest request) {
		return parseStringToDouble(request.getParameter(key));
	}
}