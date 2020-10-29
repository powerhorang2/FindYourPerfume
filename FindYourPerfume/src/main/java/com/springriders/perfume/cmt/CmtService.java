package com.springriders.perfume.cmt;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springriders.perfume.CommonUtils;
import com.springriders.perfume.Const;
import com.springriders.perfume.cmt.model.CmtDMI;
import com.springriders.perfume.cmt.model.CmtPARAM;
import com.springriders.perfume.common.model.PerfumePARAM;
@Service
public class CmtService {

	@Autowired
	private CmtMapper mapper;
	
//	public List<CmtDMI> selCmtList(PerfumePARAM param) {
//		
//		List<CmtDMI> cmtList = mapper.selCmtList(param);
//		for(int i=0; i<cmtList.size(); i++) {
//			
//			// 유저 생년 뽑기
//			String bd = cmtList.get(i).getBd();	
//			String strYear = bd.substring(0,4);
//			int userYear = CommonUtils.parseStringToInt(strYear);
//			
//			// 현재 년도 뽑기
//			SimpleDateFormat format = new SimpleDateFormat("yyyy");
//			Date date = new Date();
//			String strNowYear = format.format(date);
//			int nowYear = CommonUtils.parseStringToInt(strNowYear);
//			
//			// 유저 나이 뽑기
//			int age = nowYear - userYear + 1;
//			
//			// 유저 세대 뽑기
//			String strAgeGroup = String.valueOf(age);
//			strAgeGroup = strAgeGroup.substring(0,1);
//			strAgeGroup += 0;
//			int ageGroup = CommonUtils.parseStringToInt(strAgeGroup);
//			
//			// 인덱스 값에 세대 넣기
//			cmtList.get(i).setAgeGroup(ageGroup);
//			
//		}
//		return cmtList;
//	}

	public int InsCmt(CmtPARAM param) {
		
		if(param.getCmt().equals("")) {
			return 0;
		}
		
		if(param.getCmt().length() > 50) {
			return 0;
		}
		
		return mapper.InsCmt(param);
	}

	public int DelCmt(CmtPARAM param) {
		return mapper.DelCmt(param);
	}

	public int UpdCmt(CmtPARAM param) {
		
		if(param.getCmt().equals("")) {
			return 0;
		}
		
		if(param.getCmt().length() > 50) {
			return 0;
		}
		
		return mapper.UpdCmt(param);
	}

	public CmtDMI selPageCnt(CmtPARAM param) {
		CmtDMI dmi = mapper.selPageCnt(param);
		int page_cnt = (dmi.getPage_cnt() == 0 ? 1 : dmi.getPage_cnt());
		dmi.setPage_cnt(page_cnt);
		return dmi;
	}


	public List<CmtDMI> selPageCmtList(CmtPARAM param) {
		int page = param.getPage();
		int eIdx = page * Const.RECORD_CNT;
		int sIdx = eIdx - Const.RECORD_CNT;
		param.setRecord_cnt(Const.RECORD_CNT);
		param.seteIdx(eIdx);
		param.setsIdx(sIdx);
		
		List<CmtDMI> cmtList = mapper.selPageCmtList(param);
		for(int i=0; i<cmtList.size(); i++) {
			
			// 유저 생년 뽑기
			String bd = cmtList.get(i).getBd();	
			String strYear = bd.substring(0,4);
			int userYear = CommonUtils.parseStringToInt(strYear);
			
			// 현재 년도 뽑기
			SimpleDateFormat format = new SimpleDateFormat("yyyy");
			Date date = new Date();
			String strNowYear = format.format(date);
			int nowYear = CommonUtils.parseStringToInt(strNowYear);
			
			// 유저 나이 뽑기
			int age = nowYear - userYear + 1;
			
			int ageGroup = 0;
			
			if(10 <= age && age < 100) {
				// 유저 세대 뽑기
				String strAgeGroup = String.valueOf(age);
				strAgeGroup = strAgeGroup.substring(0,1);
				strAgeGroup += 0;
				ageGroup = CommonUtils.parseStringToInt(strAgeGroup);
			} else if(age < 10) {
				// 10세 미만이면 1 보내주기
				ageGroup = 1;
			} else if(age >= 100) {
				// 100세 이상이면 100 보내주기
				ageGroup = 100;
			}
				// 인덱스 값에 세대 넣기
				cmtList.get(i).setAgeGroup(ageGroup);
			
		}
		return cmtList;
	}

}
