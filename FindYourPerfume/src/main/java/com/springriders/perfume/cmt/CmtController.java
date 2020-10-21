package com.springriders.perfume.cmt;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springriders.perfume.SecurityUtils;
import com.springriders.perfume.cmt.model.CmtPARAM;



@Controller
@RequestMapping("/cmt")
public class CmtController {

	@Autowired
	private CmtService service;

	@RequestMapping(value="/insCmt", method = RequestMethod.POST)
	public String insCmt(CmtPARAM param, HttpSession hs, RedirectAttributes ra) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setI_user(i_user);
		int result = service.insCmt(param);
		return "redirect:/common/detail";
	}
}
