package com.springriders.perfume;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String index(HttpServletRequest req) {		
		if(Const.realPath == null) {
			Const.realPath = req.getServletContext().getRealPath("");
		}
		System.out.println("root!!");
		return "redirect:/common/main";
	}
}
