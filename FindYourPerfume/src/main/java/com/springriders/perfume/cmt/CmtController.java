package com.springriders.perfume.cmt;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springriders.perfume.SecurityUtils;
import com.springriders.perfume.cmt.model.CmtDMI;
import com.springriders.perfume.cmt.model.CmtPARAM;
import com.springriders.perfume.common.model.PerfumePARAM;



@Controller
@RequestMapping("/cmt")
public class CmtController {

	@Autowired
	private CmtService service;

	@RequestMapping(value = "/ajaxSelCmtList", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public @ResponseBody List<CmtDMI> ajaxSelCmtList(){
		System.out.println("넘어왔음?");
		PerfumePARAM param = new PerfumePARAM();
		param.setI_p(579);
		return service.selCmtList(param);
	}
	
	@RequestMapping(value = "/ajaxInsCmt", method = RequestMethod.POST)
	public @ResponseBody int ajaxInsCmt(@RequestBody CmtDMI param) {
		return 1;
	}
}
