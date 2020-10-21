package com.springriders.perfume.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springriders.perfume.Const;
import com.springriders.perfume.SecurityUtils;
import com.springriders.perfume.ViewRef;
import com.springriders.perfume.cmt.CmtService;
import com.springriders.perfume.cmt.model.CmtDMI;
import com.springriders.perfume.common.model.CommonVO;
import com.springriders.perfume.common.model.NoteCodeVO;
import com.springriders.perfume.common.model.PerfumeDMI;
import com.springriders.perfume.common.model.PerfumePARAM;
import com.springriders.perfume.user.UserService;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	private CommonService service;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private CmtService cmtService;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(PerfumePARAM param,NoteCodeVO vo, Model model, HttpServletRequest req) {
		
		int i_user = SecurityUtils.getLoginUserPk(req);

		param.setI_user(i_user);
		
		List<PerfumeDMI> topPerfume = service.selTopPerfumeList(param);
		model.addAttribute("topPerfume", topPerfume);
		
		if(i_user != 0) {
			List<NoteCodeVO> userNote = service.selUserNoteList(param);
			
			List<PerfumeDMI> recPerfume = service.selRecPerfumeList(userNote);
			model.addAttribute("recPerfume", recPerfume);
		}
		
		List<PerfumeDMI> perfume = service.selPerfumeList(param);
		model.addAttribute("perfume", perfume);

		model.addAttribute(Const.CSS,"main");
		model.addAttribute(Const.TITLE, "main");
		model.addAttribute(Const.VIEW, "main");
		
		return ViewRef.TEMP_MENU;
	}
	
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String main(CommonVO vo, HttpSession hs, RedirectAttributes ra) {
		int result = uService.login(vo);
		if(result == Const.SUCCESS) {
			hs.setAttribute(Const.LOGIN_USER, vo);
			ra.addFlashAttribute("data", vo);
			return "redirect:/common/main";
		}
		
		String msg = null;
		if(result == Const.NO_ID) {
			msg = "아이디를 확인해 주세요";
		}else if(result == Const.NO_PW) {
			msg = "비밀번호를 확인해 주세요";
		}else if(result == Const.EMPTY_ID) {
			msg = "아이디를 입력해 주세요";
		}

		vo.setMsg(msg);
		ra.addFlashAttribute("data", vo);
		return "redirect:/common/main";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession hs) {
		hs.invalidate();
		return "redirect:/common/main";
	}

	@RequestMapping("/detail")
	public String detail(PerfumePARAM param, Model model, HttpServletRequest req) {
		
		int i_user = SecurityUtils.getLoginUserPk(req);
		param.setI_user(i_user);
		param.setI_p(579);
		PerfumeDMI perfume = service.selPerfume(param);
		List<NoteCodeVO> noteList = service.selPerfumeNoteList(param);
		
		List<CmtDMI> cmtList = cmtService.selCmtList(param);
		
		model.addAttribute("perfume", perfume);
		model.addAttribute("noteList", noteList);
		
		model.addAttribute(Const.CSS, "detail");
		model.addAttribute(Const.TITLE, "디테일 페이지"); //가게명
		model.addAttribute(Const.VIEW, "detail/perfumeDetail");
		return ViewRef.TEMP_MENU;
	}
	
	
	
}