package com.springriders.perfume.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springriders.perfume.Const;
import com.springriders.perfume.ViewRef;
import com.springriders.perfume.common.model.CommonVO;
import com.springriders.perfume.user.UserService;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	private CommonService service;

	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model) {
		model.addAttribute(Const.TITLE, "main");
		model.addAttribute(Const.VIEW, "main");
		
		return ViewRef.TEMP_DEFAULT;
	}
	
//	@RequestMapping(value="/main", method = RequestMethod.POST)
//	public String main(CommonVO vo, HttpSession hs, RedirectAttributes ra) {
//		int result = uService.login(vo);
//		if(result == Const.SUCCESS) {
//			hs.setAttribute(Const.LOGIN_USER, vo);
//			ra.addFlashAttribute("data", vo);
//			return "redirect:/main";
//		}
//		
//		String msg = null;
//		if(result == Const.NO_ID) {
//			msg = "아이디를 확인해 주세요";
//		}else if(result == Const.NO_PW) {
//			msg = "비밀번호를 확인해 주세요";
//		}
//		vo.setMsg(msg);
//		ra.addFlashAttribute("data", vo);
//		return "redirect:/main";
//	}


}