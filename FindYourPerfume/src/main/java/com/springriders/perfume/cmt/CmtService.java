package com.springriders.perfume.cmt;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springriders.perfume.CommonUtils;
import com.springriders.perfume.cmt.model.CmtDMI;
import com.springriders.perfume.cmt.model.CmtPARAM;
import com.springriders.perfume.common.model.PerfumePARAM;
@Service
public class CmtService {

	@Autowired
	private CmtMapper mapper;
	
	public List<CmtDMI> selCmtList(PerfumePARAM param) {
		List<CmtDMI> cmtList = mapper.selCmtList(param);
		System.out.println("쿼리문 접근 이후");
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
			
			// 유저 세대 뽑기
			String strAgeGroup = String.valueOf(age);
			strAgeGroup = strAgeGroup.substring(0,1);
			strAgeGroup += 0;
			int ageGroup = CommonUtils.parseStringToInt(strAgeGroup);
			
			// 인덱스 값에 세대 넣기
			cmtList.get(i).setAgeGroup(ageGroup);
			
		}
		return cmtList;
	}

}
