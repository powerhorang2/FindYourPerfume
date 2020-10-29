package com.springriders.perfume.cmt;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springriders.perfume.Const;
import com.springriders.perfume.SecurityUtils;
import com.springriders.perfume.cmt.model.CmtDMI;
import com.springriders.perfume.cmt.model.CmtPARAM;
import com.springriders.perfume.common.model.PerfumePARAM;



@Controller
@RequestMapping("/cmt")
public class CmtController {

	@Autowired
	private CmtService service;

//	@RequestMapping(value = "/ajaxSelCmtList", method = RequestMethod.GET, produces = "application/json; charset=utf8")
//	public @ResponseBody List<CmtDMI> ajaxSelCmtList(PerfumePARAM param){
//		return service.selCmtList(param);
//	}
	
	@RequestMapping(value = "/ajaxInsCmt", method = RequestMethod.POST)
	public @ResponseBody int ajaxInsCmt(@RequestBody CmtPARAM param, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUser(hs).getI_user();
		param.setI_user(i_user);
		return service.InsCmt(param);
	}
	
	@RequestMapping(value = "/ajaxDelCmt", method = RequestMethod.POST)
	public @ResponseBody int ajaxDelCmt(@RequestBody CmtPARAM param, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUser(hs).getI_user();
		param.setI_user(i_user);
		return service.DelCmt(param);
	}
	
	@RequestMapping(value = "/ajaxUpdCmt", method = RequestMethod.POST)
	public @ResponseBody int ajaxUpdCmt(@RequestBody CmtPARAM param, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUser(hs).getI_user();
		param.setI_user(i_user);
		return service.UpdCmt(param);
	}
	
	@RequestMapping(value = "/ajaxSelPageCnt", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public @ResponseBody CmtDMI ajaxSelPageCnt(CmtPARAM param){
		param.setRecord_cnt(Const.RECORD_CNT); //한 페이지당 6개 뿌리겠다
		return service.selPageCnt(param);
	}
	
	@RequestMapping(value = "/ajaxSelPage", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public @ResponseBody List<CmtDMI> ajaxSelPage(CmtPARAM param){
		return service.selPageCmtList(param);
	}
	
}
