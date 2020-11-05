package com.springriders.perfume.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springriders.perfume.Const;
import com.springriders.perfume.common.model.NoteCodeVO;
import com.springriders.perfume.common.model.PerfumeDMI;
import com.springriders.perfume.common.model.PerfumePARAM;
import com.springriders.perfume.common.model.PerfumeTemp;
import com.springriders.perfume.common.model.PerfumeVO;

@Service
public class CommonService {

	@Autowired
	private CommonMapper mapper;

	public List<PerfumeDMI> selTopPerfumeList(PerfumePARAM param) {
		return mapper.selTopPerfumeList(param);
	}


	public List<PerfumeDMI> selRecPerfumeList(List<NoteCodeVO> list) {
		List<PerfumeDMI> recList = new ArrayList();
		NoteCodeVO vo = new NoteCodeVO();
		
		// 슬라이드의 한 페이지당 보이는 향수의 갯수
		for(int i=0; i<list.size(); i++) {
			vo = list.get(i);
			vo.setSliders_per_view(Const.SLIDERS_PER_VIEW);
			
			List<PerfumeDMI> recPerfumeList = mapper.selRecPerfumeList(vo);
			recList.addAll(recPerfumeList);
			
			// 유저 노트를 가진 추천 향수가 부족할 때 리스트 추가 (노트 하나 당 5개)
			if(recPerfumeList.size() < Const.SLIDERS_PER_VIEW) {
				for(int z=0; z < Const.SLIDERS_PER_VIEW-recPerfumeList.size(); z++) {
					PerfumeDMI dmi = new PerfumeDMI();
					dmi.setI_p(Const.EMPTY_PERFUME_PK);
					recList.add(dmi);
				}
			}
		}
		
		return recList;
	}
	
	public List<PerfumeDMI> selPerfumeList(PerfumePARAM param) {
		return mapper.selPerfumeList(param);
	}
	
	public List<NoteCodeVO> selPerfumeNoteList(PerfumePARAM param) {
		return mapper.selPerfumeNoteList(param);
	}

	public PerfumeDMI selPerfume(PerfumePARAM param) {
		return mapper.selPerfume(param);
	}


	public List<PerfumeDMI> selBrandAlphabet(PerfumePARAM param) {
		System.out.println("gg : " + param.getB_nm_initial());
		
		return mapper.selBrandAlphabet(param);
	}
	
	public PerfumeTemp selBrandAlphabetCnt(PerfumePARAM param) {
		PerfumeTemp vo = new PerfumeTemp();
		vo.setSelBrandAlpahbet(mapper.selBrandAlphabet(param));
		vo.setRowAllCnt(vo.getSelBrandAlpahbet().size());
		System.out.println("cnt 출력 : "+vo.getRowAllCnt());
		return vo;
	}


	public List<NoteCodeVO> selUserNoteList(PerfumePARAM param) {
		return mapper.selUserNoteList(param);
	}


	public List<PerfumeDMI> selBrandEnm(PerfumeDMI dm) {
		return mapper.selBrandEnm(dm);
	}


	public List<PerfumeDMI> selBrandNm(PerfumePARAM param) {
		return mapper.selBrandNm(param);
	}


	public List<PerfumeDMI> selBrandFullNm(PerfumePARAM param) {
		return mapper.selBrandFullNm(param);
	}


	public List<PerfumeDMI> selBrandFullAp(PerfumeDMI dmi) {
		return mapper.selBrandFullAp(dmi);
	}

	
	public int delPerfume(PerfumePARAM param) {
		System.out.println("i_p : " + param.getI_p());
		return mapper.delPerfume(param);
	}


	public PerfumeDMI selPerfumePic(PerfumePARAM param) {
		return mapper.selPerfumePic(param);
	}


	public List<NoteCodeVO> selNoteList(NoteCodeVO vo) {
		return mapper.selNoteList(vo);
	}


	public List<NoteCodeVO> ajaxSelNoteList(PerfumePARAM param) {
	
		return mapper.ajaxSelNoteList(param);
	}


	public int delPerfumeNote(PerfumePARAM param) {
		return mapper.delPerfumeNote(param);
	}




}
