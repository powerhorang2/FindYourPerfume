package com.springriders.perfume.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springriders.perfume.Const;
import com.springriders.perfume.ViewRef;
import com.springriders.perfume.user.model.UserPARAM;
import com.springriders.perfume.user.model.UserVO;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin(UserPARAM param, Model model) {
//		model.addAttribute("data", service.admin(param));
		model.addAttribute("brandList", service.selBrandList());
		model.addAttribute("noteList", service.selNoteList());
		
		model.addAttribute(Const.CSS, "admin");
		model.addAttribute(Const.TITLE, "관리자 페이지");
		model.addAttribute(Const.VIEW, "user/admin");
		return ViewRef.TEMP_MENU;
	}
	
	@RequestMapping(value="/addPerfume", method = RequestMethod.POST)
	public String addPerfume(MultipartHttpServletRequest mReq, RedirectAttributes ra) {
		int result = service.insPerfume(mReq);
		System.out.println("result : " + result);
		if(result == 1) {
			return "redirect:/user/admin";
		}
		
		ra.addAttribute("err", result);
		return "redirect:/user/admin";
	}
	
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String selUser(Model model) {
		
		model.addAttribute(Const.CSS, "myPage");		
		model.addAttribute(Const.TITLE,"마이페이지");
		model.addAttribute(Const.VIEW, "user/myPage");
		return ViewRef.TEMP_MENU;
	}
	
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join(Model model, @RequestParam(defaultValue = "0") int err) {
		
		if(err > 0){
			model.addAttribute("msg", "에러");
		}
		model.addAttribute(Const.TITLE, "회원가입");
		model.addAttribute(Const.VIEW, "user/join");
		
		return ViewRef.TEMP_DEFAULT;
	}

	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(UserPARAM param, RedirectAttributes ra, MultipartHttpServletRequest mReq) {
		
		int result = service.join(param, mReq);
		
		if(result == 1) {
			return "redirect:/user/login";
		}
		
		ra.addAttribute("err", result);
		return "redirect:/user/join";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute(Const.TITLE, "로그인");
		model.addAttribute(Const.VIEW, "/user/login");
		
		return ViewRef.TEMP_DEFAULT;
	}
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(UserPARAM param, HttpSession hs, RedirectAttributes ra) {
		int result = service.login(param);
		if(result == Const.SUCCESS) {
			hs.setAttribute(Const.LOGIN_USER, param);
			return "redirect:/main";
		}
		String msg = null;
		if(result == Const.NO_ID) {
			msg = "아이디를 확인해 주세요";
		}else if(result == Const.NO_PW) {
			msg = "비밀번호를 확인해 주세요";
		}
		
		param.setMsg(msg);
		ra.addFlashAttribute("data", param);
		return "redirect:/user/login";
		
	}
	
	@RequestMapping(value="/ajaxIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxIdChk(@RequestBody UserVO param) {
		int result = service.login(param);
		return String.valueOf(result);
	}
	
	
}
