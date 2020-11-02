package com.springriders.perfume.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
import com.springriders.perfume.common.model.PerfumeTemp;
import com.springriders.perfume.common.model.PerfumeVO;
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
	
	//parameter NoteCodeVO 삭제했음
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(PerfumePARAM param, NoteCodeVO vo, PerfumeDMI dm, Model model, HttpServletRequest req) {
		
		int i_user = SecurityUtils.getLoginUserPk(req);

		param.setI_user(i_user);
		System.out.println("p_brand : " + param.getP_brand());
		List<PerfumeDMI> perfume = service.selPerfumeList(param);
		List<PerfumeDMI> brandEnm = service.selBrandEnm(dm);
		List<PerfumeDMI> brandFullNm = service.selBrandFullNm(dm);
		List<NoteCodeVO> noteList = service.selNoteList(vo);
		
		
		//알파벳 A~Z 까지 뽑기
		List<String> brandAlphabet = new ArrayList();
		
        char aString = 65 ;
        
        while(true){
            if(aString == 91)
                aString = 97 ;
            String str = String.valueOf(aString) ;
            brandAlphabet.add(str);
            aString++ ;
            if(aString > 90)
                break ;
        }
        
		List<PerfumeDMI> topPerfume = service.selTopPerfumeList(param);
		model.addAttribute("topPerfume", topPerfume);
		
		if(i_user != 0) {
			List<NoteCodeVO> userNote = service.selUserNoteList(param);
			// 슬라이드 페이지
			int slide_page = userNote.size();
			model.addAttribute("slide_page", slide_page);
			model.addAttribute("userNote", userNote);
			
			List<PerfumeDMI> recPerfume = service.selRecPerfumeList(userNote);
			model.addAttribute("recPerfume", recPerfume);
		}

		/* model.addAttribute("pageNum", pageNum); */
		model.addAttribute("noteList", noteList);
		model.addAttribute("brandFullNm", brandFullNm);
        model.addAttribute("brandAlphabet", brandAlphabet);
        model.addAttribute("brandEnm", brandEnm);
		model.addAttribute("perfume", perfume);
		


		model.addAttribute(Const.CSS, "main");
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

	@RequestMapping("/detail")
	public String detail(PerfumePARAM param, PerfumeDMI dm, Model model, HttpServletRequest req) {
		System.out.println("i_pddd : " + param.getI_p());
		int i_user = SecurityUtils.getLoginUserPk(req);
		param.setI_user(i_user);
		param.setI_p(param.getI_p());
		
		List<String> brandAlphabet = new ArrayList();
		
        char aString = 65 ;
        
        while(true){
            if(aString == 91)
                aString = 97 ;
            String str = String.valueOf(aString) ;
            brandAlphabet.add(str);
            aString++ ;
            if(aString > 90)
                break ;
        }
		
		PerfumeDMI perfume = service.selPerfume(param);
		List<NoteCodeVO> noteList = service.selPerfumeNoteList(param);
		List<PerfumeDMI> perfumeList = service.selPerfumeList(param);
		List<PerfumeDMI> brandEnm = service.selBrandEnm(dm);
		List<PerfumeDMI> brandFullNm = service.selBrandFullNm(dm);

		model.addAttribute("perfume", perfume);
		model.addAttribute("noteList", noteList);
		model.addAttribute("brandFullNm", brandFullNm);
        model.addAttribute("brandAlphabet", brandAlphabet);
        model.addAttribute("brandEnm", brandEnm);
		model.addAttribute("perfumeList", perfumeList);

		
		model.addAttribute(Const.CSS, "detail");
		model.addAttribute(Const.TITLE, "디테일 페이지"); //가게명
		model.addAttribute(Const.VIEW, "detail/perfumeDetail");
		return ViewRef.TEMP_MENU;
	}
	
	@RequestMapping("/ajaxSelBrandAlphabet")
	@ResponseBody
	public PerfumeTemp ajaxSelBrandAlphabet(PerfumePARAM param){
		return service.selBrandAlphabetCnt(param);
	}
	

	@RequestMapping("/ajaxSelBrandNm")
	@ResponseBody
	public List<PerfumeDMI> ajaxSelBrandNm(PerfumePARAM param){
		return service.selBrandNm(param);
	}
	@RequestMapping("/ajaxSelBrandPerfume")
	@ResponseBody
	public List<PerfumeDMI> ajaxSelBrandPerfume(PerfumePARAM param){
		System.out.println(param.getP_brand());
		return service.selPerfumeList(param);
	}
	
	@RequestMapping(value="/delPerfume", method = RequestMethod.POST)
	public String delPerfume(PerfumePARAM param, CommonVO vo, HttpSession hs, RedirectAttributes ra) {
		System.out.println("i_p : " + param.getI_p());
		int result = service.delPerfume(param);
		
		String msg = null;
		if(result == Const.SUCCESS) {
			msg = "삭제가 완료되었습니다";
		}

		vo.setMsg(msg);
		ra.addFlashAttribute("data", vo);
		
		return "redirect:/user/admin";
	}
	
	@RequestMapping("/ajaxSelBrandFullAp")
	@ResponseBody
	public List<PerfumeDMI> ajaxSelBranFullAp(PerfumeDMI dmi){
		return service.selBrandFullAp(dmi);
	}
	
	@RequestMapping("/ajaxSelPerfumePic")
	@ResponseBody
	public PerfumeDMI ajaxSelPerfumePic(PerfumePARAM param){
		return service.selPerfumePic(param);
	}
	
	@RequestMapping("/ajaxSelNoteList")
	@ResponseBody
	public List<NoteCodeVO> ajaxSelNoteList(PerfumePARAM param) {
		return service.ajaxSelNoteList(param);
	}

	@RequestMapping(value="/sortPerfume", method = RequestMethod.GET)
	public String sortPerfume(NoteCodeVO param, RedirectAttributes ra) {
//		int result = service.sortPerfume(param);
		
		System.out.println("type : " + param.getSort_type());
		return "";
	}
	
	
	
}